package it.i_node.tempemail.helpers;

import it.i_node.tempemail.json.JsonMail;
import it.i_node.tempemail.json.JsonMailFactory;
import it.i_node.tempemail.json.JsonMessageHeaders;
import it.i_node.tempemail.json.JsonMessageHeadersFactory;
import it.i_node.tempemail.model.DbmailMessages;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.TimeUnit;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import org.jboss.seam.Component;
import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.Create;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Scope;
import org.jboss.seam.annotations.TransactionPropagationType;
import org.jboss.seam.annotations.Transactional;
import org.jboss.seam.annotations.async.Asynchronous;
import org.jboss.seam.annotations.async.Expiration;
import org.jboss.seam.annotations.async.IntervalCron;
import org.jboss.seam.async.QuartzTriggerHandle;

@Name("synchronousQueueManager")
@Scope(ScopeType.APPLICATION)
public class SynchronousQueueManager {
	private static final int INCOMING_MESSAGE_QUEUE_SIZE = 100;
	private static final int MESSAGE_ARRIVED_TIME = 300;
	private static final int PUSH_TIME = 60000;
	//private Map<String,SynchronousQueue<JsonMail>> queueMessageMap;	PROVO A FARE CON MESSAGEHEADERS
	private Map<String,SynchronousQueue<JsonMessageHeaders>> queueMessageMap;
	private ArrayBlockingQueue<Integer> queueMessageId;
	public static SynchronousQueueManager instance()	{
		return (SynchronousQueueManager) Component.getInstance(SynchronousQueueManager.class);
	}
	@Create
	public void init()	{
		//queueMessageMap=new HashMap<String, SynchronousQueue<JsonMail>>();
		queueMessageMap=new HashMap<String, SynchronousQueue<JsonMessageHeaders>>();
		queueMessageId=new ArrayBlockingQueue<Integer>(INCOMING_MESSAGE_QUEUE_SIZE);
	}
	public void messageArrived(Integer messageId)	{
		queueMessageId.add(messageId);
		/*EntityManager em=(EntityManager) Component.getInstance("entityManager");
		DbmailMessages message = em.createQuery("From DbmailMessages m where m.messageIdnr= :id",DbmailMessages.class).setParameter("id", messageId).getSingleResult(); 
		try {
			getQueue(message.getDbmailMailboxes().getDbmailUsers().getUserid()).offer(message, MESSAGE_ARRIVED_TIME, TimeUnit.MILLISECONDS);
			return true;
		} catch (InterruptedException e) {
			return false;
			// TODO Auto-generated catch block
		}*/
	}
	//private synchronized SynchronousQueue<JsonMail> getQueue(String username) {
	private synchronized SynchronousQueue<JsonMessageHeaders> getQueue(String username) {
		if(!queueMessageMap.containsKey(username))
			//queueMessageMap.put(username,new SynchronousQueue<JsonMail>());
			queueMessageMap.put(username,new SynchronousQueue<JsonMessageHeaders>());
		return queueMessageMap.get(username);
	}
	//public JsonMail getJsonMail(String username)	{
	public JsonMessageHeaders getJsonMessageHeaders(String username)	{
		try {
			return getQueue(username).poll(PUSH_TIME, TimeUnit.MILLISECONDS);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			return null;
		}
	}
	public void deleteQueue(String username)	{
		if (queueMessageMap.containsKey(username))	
			queueMessageMap.get(username).offer(new JsonMessageHeaders());
		queueMessageMap.remove(username);
	}
	@Asynchronous
	@Transactional(TransactionPropagationType.REQUIRED)
	public QuartzTriggerHandle getTriggerHandler(@Expiration Date date, @IntervalCron String CRON_INTERVAL) {
		EntityManager em=(EntityManager) Component.getInstance("entityManager");
		for(Integer i: queueMessageId)	{
					//operazioni sulla coda
			try {
				DbmailMessages message = em.createQuery("From DbmailMessages m where m.messageIdnr= :id",DbmailMessages.class).setParameter("id", i.longValue()).getSingleResult();
				//JsonMailFactory factory = new JsonMailFactory();
				//JsonMail jsonMess=factory.createMessage(message);
				//getQueue(message.getDbmailMailboxes().getDbmailUsers().getUserid()).offer(jsonMess, MESSAGE_ARRIVED_TIME, TimeUnit.MILLISECONDS);
				//PROVO A FARE CON MESSAGEHEADERS
				JsonMessageHeadersFactory factory = new JsonMessageHeadersFactory();
				JsonMessageHeaders jsonMess=factory.createMessage(message);
				getQueue(message.getDbmailMailboxes().getDbmailUsers().getUserid()).offer(jsonMess, MESSAGE_ARRIVED_TIME, TimeUnit.MILLISECONDS);

			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
			}catch (NoResultException e) {
				// TODO Auto-generated catch block
			}
		}
		queueMessageId.clear();
		return null;
	}
}
