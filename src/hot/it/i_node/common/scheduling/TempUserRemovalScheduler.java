package it.i_node.common.scheduling;

import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Scope;
import org.jboss.seam.annotations.Transactional;
import org.jboss.seam.annotations.async.Asynchronous;
import org.jboss.seam.async.QuartzTriggerHandle;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


import javax.persistence.EntityManager;

import org.jboss.seam.Component;

import org.jboss.seam.annotations.TransactionPropagationType;
import org.jboss.seam.annotations.async.Expiration;
import org.jboss.seam.annotations.async.IntervalCron;
import org.jboss.seam.log.Log;


@Name("tempUserRemovalScheduler")
@Scope(ScopeType.APPLICATION)
public class TempUserRemovalScheduler {
	@Logger(value="scheduler") Log log;
	private static int DURATION_BOX=-20;
	public static TempUserRemovalScheduler instance(){
		return (TempUserRemovalScheduler) Component.getInstance(TempUserRemovalScheduler.class);
	}
	@Asynchronous
	@Transactional(TransactionPropagationType.REQUIRED)
	public QuartzTriggerHandle getTriggerHandler(@Expiration Date date, @IntervalCron String CRON_INTERVAL) {
		// TODO Auto-generated method stub
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		System.out.println("Stampa della data in cui sto girando: ["+format.format(Calendar.getInstance().getTime())+"]");
		
		Calendar data=Calendar.getInstance();
		//data.add(Calendar.MINUTE, -20); RISOSTITUIRE
		data.add(Calendar.MINUTE, DURATION_BOX);
		EntityManager em = (EntityManager) Component.getInstance("entityManager");
/*		String s="delete from dbmail_mailboxes where mailbox_idnr in ("
				+ " select mailbox_idnr from tempmailbox where refreshdate < :date);";
*/		
		/*String s="delete from dbmail_users where user_idnr in ( "
				+ "select owner_idnr from dbmail_mailboxes where mailbox_idnr in ("
				+ " select mailbox_idnr from tempmailbox where refreshdate < :date));";*/
		String s="delete from dbmail_users where user_idnr in ( "
				+ " select user_idnr from tempuser where refreshdate < :date);";
		em.createNativeQuery(s).setParameter("date", data).executeUpdate();
		return null;
	}
}
