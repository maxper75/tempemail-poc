package it.i_node.tempemail.model;



import it.i_node.tempemail.action.TempMailboxHome;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.mail.Address;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Store;

import org.jboss.seam.Component;
import org.jboss.seam.annotations.Name;


@Name("imapAddressPuller")
public class IMAPAddressPuller {
	// imapORimaps = "imap";
	//email = "d.pucci@i-node.it"
	//password = "uuuV2Tk3"
	// domain ="zimbra.i-node.it"

	private String imapORimaps ;
	private String email ;
	private String password ;
	private String domain;
	private Set <TempEmailAddress> recipients;


	public Set<TempEmailAddress> getRecipient() {
		return recipients;
	}

	public void setRecipient(Set<TempEmailAddress> recipient) {
		this.recipients = recipient;
	}

	public String getImapORimaps() {
		return imapORimaps;
	}

	public void setImapORimaps(String imapORimaps) {
		this.imapORimaps = imapORimaps;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public void addressesFromSentFolder () throws MessagingException{
		Properties props = System.getProperties();
		props.setProperty("mail.store.protocol",imapORimaps);
		Map <String,TempEmailAddress> address2tempEmail = new HashMap<String,TempEmailAddress>();
		try{
			Session session = Session.getDefaultInstance(props, null);
			Store store = session.getStore(imapORimaps);
			store.connect(domain, email,password);
			
			//Folder [] folders=store.getDefaultFolder().list("*");
			Folder sent= store.getFolder("Sent");
			sent.open(Folder.READ_ONLY);
			TempEmailAddressFactory teaf = new TempEmailAddressFactory();
			TempMailboxHome tmh = (TempMailboxHome) Component.getInstance(TempMailboxHome.class);
			//addresses della tempMailbox : già esistenti
			List<TempEmailAddress> exsistingAddresses = new ArrayList<TempEmailAddress>(
					tmh.getInstance().getTempEmailAddresses());


			for (Message m : sent.getMessages()){
				for (Address aR: m.getAllRecipients()){
					//address nella cartella sent
					TempEmailAddress recipient = teaf.createAddress(aR);
					if(exsistingAddresses.contains(recipient)){
						//address tra gli esistenti == address dei sent
						TempEmailAddress exsistingAddress = 
								exsistingAddresses.get(exsistingAddresses.indexOf(recipient));
						//aggiorno il nome			
						if(recipient.getName()!=null && exsistingAddress.getName()== null ){
							exsistingAddress.setName(recipient.getName());	
						}

					}
					//	Altrimenti se non è già presente nella mailbox					
					if (!address2tempEmail.containsKey(recipient.getEmailAddress())){
						
						recipient.setTempMailbox(tmh.getInstance());
						address2tempEmail.put(recipient.getEmailAddress(),recipient);
						
					}
					else if (recipient.getName()!= null && address2tempEmail.get(recipient.getEmailAddress()).getName()== null)
						address2tempEmail.get(recipient.getEmailAddress())
						.setName(recipient.getName());		
				}	    	   
			}
//			store.getFolder("Sent").close(false);
//			store.close();
		this.recipients = new HashSet<TempEmailAddress>(address2tempEmail.values());
		}
		catch (NoSuchProviderException e){
			e.printStackTrace();
			System.exit(1);
		} catch (javax.mail.MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//return	new HashSet<TempEmailAddress>(address2tempEmail.values());
	}

	public String importAddresses (){
		return null;		
	}
	public IMAPAddressPuller() {

	}
	//Properties props = System.getProperties();


	//Folder [] folders=store.getDefaultFolder().list("*");			
	//			System.out.println("valid addresses are :");
	//			System.out.println("");
	//			for (String va: address2tempEmail.keySet()){
	//				System.out.println(address2tempEmail.get(va).toString());
	//			System.out.println(address2tempEmail.get(va).getRetentionDays().toString());
	//			}
	//			List<TempEmailAddress> list4rule= new ArrayList <TempEmailAddress>();
	//			list4rule.addAll(address2tempEmail.values());
	//			
	//			InternetAddress fa = new InternetAddress();
	//			fa.setAddress("d.pucci@i-node.it");
	//			fa.setPersonal("davide pucci");
	//			TempEmailAddress forwardAdd= f.createAddress(fa);
	//			
	//			SieveRulesFactory srf = new SieveRulesFactory();
	//			String rule = srf.createSieveRule(list4rule,forwardAdd);
	//			System.out.println("");
	//			System.out.println("Sieve rule is:");
	//			
	//			System.out.println(rule);
	//			


}
