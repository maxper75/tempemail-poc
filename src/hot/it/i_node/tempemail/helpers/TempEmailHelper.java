package it.i_node.tempemail.helpers;


import it.i_node.tempemail.action.DbmailAliasesHome;
import it.i_node.tempemail.action.DbmailUsersHome;
import it.i_node.tempemail.action.DbmailUsersList;
import it.i_node.tempemail.action.TempAliasHome;
import it.i_node.tempemail.action.TempUserHome;
import it.i_node.tempemail.model.DbmailAliases;
import it.i_node.tempemail.model.DbmailHeader;
import it.i_node.tempemail.model.DbmailHeadervalue;
import it.i_node.tempemail.model.DbmailMailboxes;
import it.i_node.tempemail.model.DbmailMessages;
import it.i_node.tempemail.model.DbmailSubjectfield;
import it.i_node.tempemail.model.DbmailUsers;
import it.i_node.tempemail.model.TempAlias;
import it.i_node.tempemail.model.TempUser;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import org.apache.commons.io.IOUtils;
import org.jboss.seam.Component;
import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Scope;
import org.jboss.seam.util.RandomStringUtils;

@Name("tempEmailHelper")
@Scope(ScopeType.SESSION)
public class TempEmailHelper {

	private static final String DEFAULT_DOMAIN_NAME = "pippopluto.com";
	private String domainName = DEFAULT_DOMAIN_NAME;
	private String username=null;							//username users
	private String emailAddress=null;						//indirizzo mail
	private String text=null;								//da utilizzare per messaggi di errore
	//private DbmailUsers dbmailUsers;						//mailbox corrente //per ricevere mail
	private TempUser tempUser;
	private DbmailMailboxes dbmailbox;

	//se si vogliono piu alias fare un array
	private TempAlias alias=null;							//alias utente

	private long messageId;									//id messaggio corrente
	private List<DbmailMessages> messages=null;				//lista messaggi
	private Map<Long, DbmailSubjectfield> subjectMap=null;	//<id physmessage,subject>
	private DbmailMessages message=null;					//messaggio corrente
	private Map<String,DbmailHeadervalue> headerMap=null;	//<nome,valore>


	//crea uno user e la mailbox associata


	public boolean createEmail() {

		if(emailAddress!=null&&!emailAddress.isEmpty())	{
			System.out.println("create email: utente gia in sessione");
			text="utente gia in sessione";
			return false;
		}
		if (username==null||username.isEmpty()) 
			username=randomString();

		StringBuilder emailBuilder = new StringBuilder();
		emailBuilder.append(username);
		emailBuilder.append("@");
		emailBuilder.append(getDomainName());
		emailAddress=emailBuilder.toString();			
		if(emailAddressIsValid())	{
												// user//
			Date data=new Date();
			TempUserHome tuserHome= (TempUserHome) Component.getInstance(TempUserHome.class);
			//DbmailUsersHome usersHome=(DbmailUsersHome) Component.getInstance(DbmailUsersHome.class);
			tuserHome.clearInstance();
			tempUser= tuserHome.getInstance();
			//			usersHome.clearInstance();
			//			DbmailUsers user = usersHome.getInstance();
			//			user.setUserid(emailAddress);
			//			user.setPasswd("");
			//			user.setLastLogin(data);
			//			user.setEncryptionType("");

			tempUser.setUserid(emailAddress);//username@domain
			tempUser.setPasswd("");
			tempUser.setLastLogin(data);
			tempUser.setEncryptionType("");
			tempUser.setCreationDate(data);
			tempUser.setRefreshDate(data);
			

												//mailbox//

			//			TempUserHome mailboxesHome=(TempUserHome) Component.getInstance(TempUserHome.class);//no
			//			mailboxesHome.clearInstance();
			//			setMail(mailboxesHome.getInstance());
			//			dbmailbox.setDbmailUsers(user);
			dbmailbox= new DbmailMailboxes();
			dbmailbox.setName("INBOX");
			dbmailbox.setPermission((short) 2);
			dbmailbox.setDbmailUsers(tempUser);
			tuserHome.getInstance().getDbmailMailboxeses().add(dbmailbox);



			//			mail.setCreationDate(data);
			//			mail.setRefreshDate(data);

			//			
			//			//salvataggio dati in dbmail MAILBOX
			//			mailboxesHome.persist();
			//			usersHome.persist();

			tuserHome.persist();
			text="Utente "+tempUser.getUserIdnr()+" creato";
			System.out.println("create email ok: creato: "+username);
			return true;
		}
		else	{
			//text="Nome utente gia utilizzato!";
			System.out.println("create email: user non creato");
			emailAddress=null;
			username=null;
		}
		return false;
	}

	//elimina user e mailbox associata, se presenti
	public void deleteEmail()	{
		if(tempUser==null)	{//non presente => non va eliminato
			text="Crea un indirizzo di mail";
			return;
		}		
		if(!tempUser.getUserid().isEmpty())	{//se esiste l'utente
			//DbmailUsersHome usersHome=(DbmailUsersHome) Component.getInstance(DbmailUsersHome.class);
			TempUserHome tuserHome= (TempUserHome) Component.getInstance(TempUserHome.class);

			EntityManager em=(EntityManager) Component.getInstance("entityManager");
			try	{
				TempUser tuser=em.createQuery("From TempUser t where t.userIdnr="
						+ " :userIdnr",TempUser.class).setParameter("userIdnr",tempUser.getUserIdnr()).getSingleResult();
				if(tuser!=null)	{
					tuserHome.setTempUserUserIdnr(tempUser.getUserIdnr());
					//tuserHome.setDbmailUsersUserIdnr(tempUser.getUserIdnr());
					tuserHome.remove();
					text="Utente "+tempUser.getUserid()+" con password eliminato!";
					//mail=null;
					//messages=null;
					text="utente "+username+" eliminato";
					//elimino anche la coda
					//SynchronousQueueManager.instance().messageArrived(-1);
					SynchronousQueueManager.instance().deleteQueue(emailAddress);
					if(alias!=null)	{
						TempAliasHome aliasHome=(TempAliasHome) Component.getInstance(TempAliasHome.class);
						aliasHome.setId(alias.getAliasIdnr());
						aliasHome.remove();
						System.out.println("delete email: alias eliminato");
					}
					//alias=null;
					//emailAddress=null;
					//username=null;
					clear();
					System.out.println("delete email");
				}
			}
			catch(NoResultException e)	{
				text="Utente non presente!";
				System.out.println("delete mail:utente non presente");
			}
		}
		else	{ 
			text="Inserisci un nome!";
			System.out.println("delete mail: inserisci un nome");
		}
	}

//	public DbmailMailboxes getDbmailbox() {
//		return dbmailbox;
//	}
//
//	public void setDbmailbox(DbmailMailboxes dbmailbox) {
//		this.dbmailbox = dbmailbox;
//	}

	public TempUser getTempUser() {
		return tempUser;
	}

	public void setTempUser(TempUser tempUser) {
		this.tempUser = tempUser;
	}

	//aggiorna la data di ultimo refresh e richiama reloadContents
	public void refreshing()	{
		if(!emailAddressIsValid())	{
			//aggiorno la refreshdate
			if(tempUser==null)	{
				text="Crea un indirizzo di mail";
				return;
			}
			Date data=Calendar.getInstance().getTime();
			TempUserHome tempUserHome=(TempUserHome) Component.getInstance(TempUserHome.class);
			tempUserHome.setId(tempUser.getUserIdnr());
			tempUserHome.getInstance().setRefreshDate(data);
			tempUserHome.update();
			tempUser.setRefreshDate(data);
			System.out.println("refresh per id:"+tempUser.getUserIdnr()+" con data: "+tempUser.getRefreshDate());

			if(alias!=null)	{
				TempAliasHome aliasHome=(TempAliasHome) Component.getInstance(TempAliasHome.class);
				aliasHome.setId(alias.getAliasIdnr());
				aliasHome.getInstance().setRefreshDate(data);
				aliasHome.update();
				alias.setRefreshDate(data);
				System.out.println("refresh per id:"+alias.getAliasIdnr()+" con data: "+alias.getRefreshDate());
			}


			reloadContents();
		}
		else	{
			text="username non valido!";
			System.out.println("refreshing: user non valido");
		}
	}

	//ricarica i messaggi dell' utente
	public boolean reloadContents()	{
		if(tempUser!=null)	{
			if(!tempUser.getUserid().isEmpty())	{
				EntityManager em = (EntityManager) Component.getInstance("entityManager");
				messages=em.createQuery("From DbmailMessages m where m.dbmailMailboxes.dbmailUsers.userid"
						+ " = :userid",DbmailMessages.class).setParameter("userid",dbmailbox.getDbmailUsers().getUserid()).getResultList();
				if(getMessages().size()==0)	{
					text="nessun messaggio presente o user non presente!";
					System.out.println("reload contents: nessun messaggio presente o user non presente!");
					System.out.println("users: "+tempUser.getUserIdnr());
					return true;
				}
				else	{
					text="messaggi di "+dbmailbox.getDbmailUsers().getUserid()+" :";
					System.out.println("messaggi di "+dbmailbox.getDbmailUsers().getUserid());
					createSubjectMap(reloadSubjects(dbmailbox.getDbmailUsers().getUserid()));
					return true;
				}
			}	
			else	{ 
				text="inserisci un utente valido!";
				System.out.println("reload contents: inserisci un utente valido!");
				return false;
			}
		}
		return false;
	}

	//setta messaggio corrente
	private void setCurrentMessage(long id)	{
		for(DbmailMessages mess:messages)
			if(mess.getDbmailPhysmessage().getId()==id)	{
				message=mess;
				System.out.println("message settato:"+message.getDbmailPhysmessage().getId());
			}
	}

	//ricarica i subjects di un utente
	@SuppressWarnings("unchecked")
	public List<DbmailSubjectfield> reloadSubjects(String name)	{
		EntityManager em = (EntityManager) Component.getInstance("entityManager");
		String s="select dbmail_messages.physmessage_id,subjectfield from dbmail_physmessage left outer join "
				+ "dbmail_subjectfield on (id=dbmail_subjectfield.physmessage_id), dbmail_users, dbmail_mailboxes, "
				+ "dbmail_messages where userid= :userid and user_idnr=owner_idnr "
				+ "and dbmail_mailboxes.mailbox_idnr=dbmail_messages.mailbox_idnr and dbmail_messages.physmessage_id=id;";
		return em.createNativeQuery(s, DbmailSubjectfield.class).setParameter("userid",name).getResultList();
	}

	//crea mappa <id_physmessage,subjectfield>
	private void createSubjectMap(List<DbmailSubjectfield> subjects)	{
		setSubjectMap(new HashMap<Long,DbmailSubjectfield>());
		for(DbmailSubjectfield sub:subjects)	{
			if(sub!=null)	{
				if(!getSubjectMap().containsKey(sub.getId().getPhysmessageId()))	
					getSubjectMap().put(Long.valueOf(sub.getId().getPhysmessageId()), sub);
			}
		}
	}

	//restituisce l'headermap creata sulla base di messageId
	public Map<String,DbmailHeadervalue> getHeaderMap() {
		if(headerMap==null)	{
			setCurrentMessage(messageId);
			createHeaderMap(message.getDbmailPhysmessage().getDbmailHeaders());
		}
		setCurrentMessage(messageId);
		return headerMap;
	}


	//crea mappa <nome header,valore header>
	private void createHeaderMap(Set<DbmailHeader> headers)	{
		setHeaderMap(new HashMap<String,DbmailHeadervalue>());
		for(DbmailHeader header: headers)
			if(header!=null)	{
				if(!getHeaderMap().containsKey(header.getDbmailHeadername()))
					getHeaderMap().put(header.getDbmailHeadername().getHeadername(), header.getDbmailHeadervalue());
			}
	}	

	//restituisce tempo di vita mailbox
	public long countDown()	{
		if(getTempUser()!=null)	{
			Calendar calendar=Calendar.getInstance();
			calendar.setTime(tempUser.getRefreshDate());
			//calendar.add(Calendar.MINUTE, 20); RISOSTITUIRE
			calendar.add(Calendar.MINUTE, 20);
			Calendar today = Calendar.getInstance();
			//System.out.println();
			long togo = (calendar.getTimeInMillis() - today.getTimeInMillis()) / 1000;
			if (togo>0)
				return togo;
			return 0;
		}
		return 0;
	}

	//restituisce una stringa random
	private String randomString()	{
		String localPart=RandomStringUtils.random(8,"abcdefghijklmnopqrstuvwxyz0123456789");
		return localPart;
	}

	//verifica se uno username è gia utilizzato
	private boolean emailAddressIsValid()	{
		if((!username.matches("^[a-zA-Z0-9.]*$"))) {			
			System.out.println("username: non rispetta sintassi!");
			text="non rispetta la sintassi";
			return false;
		}
		DbmailUsersList usersList=(DbmailUsersList) Component.getInstance(DbmailUsersList.class);
		for(DbmailUsers user: usersList.getResultList())
			if(user.getUserid().equals(emailAddress))	{
				System.out.println("username: gia presente nel database");
				text="gia presente in database";
				return false;
			}
		return true;
	}

	//converter bytearray to string
	@SuppressWarnings("deprecation")
	public String convertToString(byte[] toConvert)	{
		try {
			return IOUtils.toString(toConvert);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

	public void clear() {
		//setDbmailbox(null);
		setTempUser(null);
		setMessages(null);
		setUsername(null);
		setEmailAddress(null);
		setAlias(null);
		System.out.println("CLEAR ALL!");
	}

	public DbmailMessages getMessageById(long messageId) {
		EntityManager em = (EntityManager) Component.getInstance("entityManager");
		DbmailMessages mess=em.createQuery("From DbmailMessages m where m.messageIdnr"
				+ "= :messageid and m.dbmailMailboxes.mailboxIdnr= :mailboxid",DbmailMessages.class).setParameter("messageid", messageId).setParameter("mailboxid", dbmailbox.getMailboxIdnr()).getSingleResult();
		return mess;
	}

	public boolean createAlias(String name)	{
		//controllo mail esistente nel servizio rest
		//DbmailAliasesHome aliasHome=(DbmailAliasesHome) Component.getInstance(DbmailAliasesHome.class);
		//aliasHome.clearInstance();
		//DbmailAliases alias = aliasHome.getInstance();
		//alias.setAlias(emailAddress);
		//alias.setDeliverTo(name);
		//aliasHome.persist();
		if(tempUser==null)	{	
			text="createAlias: mail null";
			System.out.println("createAlias: mail null");
			return false;
		}
		//provo ad usare tempalias
		if(alias==null)	{
			Date data=new Date();
			TempAliasHome tempAliasHome=(TempAliasHome) Component.getInstance(TempAliasHome.class);
			tempAliasHome.clearInstance();
			TempAlias tempAlias = tempAliasHome.getInstance();
			tempAlias.setAlias(emailAddress);
			tempAlias.setDeliverTo(name);
			tempAlias.setCreationDate(data);
			tempAlias.setRefreshDate(data);
			tempAliasHome.persist();
			alias=tempAlias;
			text="alias:"+name;
			System.out.println("create alias:"+name);
			return true;
		}
		else	{
			text="alias già creato: "+alias.getDeliverTo();
			System.out.println("create alias: già creato");
			return false;
		}
	}

	//GETTER E SETTER 

	public DbmailMailboxes getDbmailbox() {
		return dbmailbox;
	}

	public void setDbmailbox(DbmailMailboxes dbmailbox) {
		this.dbmailbox = dbmailbox;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public double getMinute(double num)	{
		return Math.floor(num);
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String usernam) {
		username = usernam;
	}

	public String getText() {
		return text;
	}

	public void setText(String tex) {
		text = tex;
	}

	public void checkEmail()	{

	}

	public Map<Long, DbmailSubjectfield> getSubjectMap() {
		return subjectMap;
	}

	public void setSubjectMap(Map<Long, DbmailSubjectfield> subjectMap) {
		this.subjectMap = subjectMap;
	}

	public List<DbmailMessages> getMessages() {
		return messages;
	}

	public void setMessages(List<DbmailMessages> messages) {
		this.messages = messages;
	}

	public long getMessageId() {
		return messageId;
	}

	public void setMessageId(long messageId) {
		this.messageId = messageId;
	}

	public DbmailMessages getMessage() {
		return message;
	}

	public void setMessage(DbmailMessages message) {
		this.message = message;
	}

	public void setHeaderMap(Map<String,DbmailHeadervalue> headerMap) {
		this.headerMap = headerMap;
	}

	public TempAlias getAlias() {
		return alias;
	}

	public void setAlias(TempAlias alias) {
		this.alias = alias;
	}

	public String getDomainName() {
		return domainName;
	}

	public void setDomainName(String domainName) {
		this.domainName = domainName;
	}

}

