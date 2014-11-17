package it.i_node.tempemail.model;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;
import java.util.Properties;


import javax.mail.*;
import javax.mail.internet.InternetAddress;


import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;

public class AddressPuller {
	Folder sent;
	Folder[] folders;

	public AddressPuller() throws MessagingException, UnsupportedEncodingException{
		
		String imapORimaps = "imap";
		String email = "d.pucci@i-node.it";
		String password = "uuuV2Tk3";
		String domain ="zimbra.i-node.it";

		Properties props = System.getProperties();
		props.setProperty("mail.store.protocol",imapORimaps);

		try{

			Session session = Session.getInstance(props, null);
			Store store = session.getStore(imapORimaps);
			store.connect(domain, email,password);
			System.out.println(store);
			folders = store.getDefaultFolder().list("*");

			/*for (Folder f: folders){
				System.out.println(f.getName());
				System.out.println("");
			} 
			 */
			sent = store.getFolder("Sent");
			sent.open(Folder.READ_ONLY);

			Message [] messages = sent.getMessages();
			Map <String,TempEmailAddress> address2tempEmail = new HashMap<String,TempEmailAddress>();
			TempEmailAddressFactory f = new TempEmailAddressFactory();

			for (Message m : messages){
				for (Address aR: m.getAllRecipients()){
						TempEmailAddress recipient = f.createAddress(aR);
					
					if (!address2tempEmail.containsKey(recipient.getEmailAddress()))
						address2tempEmail.put(recipient.getEmailAddress(),recipient);
					
					else if (recipient.getName()!= null && address2tempEmail.get(recipient.getEmailAddress()).getName()== null)

							address2tempEmail.get(recipient.getEmailAddress()).setName(recipient.getName());
					
				}	    	   
			}
			
			System.out.println("valid addresses are :");
			System.out.println("");
			for (String va: address2tempEmail.keySet()){
				System.out.println(address2tempEmail.get(va).toString());
			System.out.println(address2tempEmail.get(va).getRetentionDays().toString());
			}
			List<TempEmailAddress> list4rule= new ArrayList <TempEmailAddress>();
			list4rule.addAll(address2tempEmail.values());
			
			InternetAddress fa = new InternetAddress();
			fa.setAddress("d.pucci@i-node.it");
			fa.setPersonal("davide pucci");
			TempEmailAddress forwardAdd= f.createAddress(fa);
			
			SieveRulesFactory srf = new SieveRulesFactory();
			String rule = srf.createSieveRule(list4rule,forwardAdd);
			System.out.println("");
			System.out.println("Sieve rule is:");
			
			System.out.println(rule);
			
			sent.close(false);
			store.close();

		}
		catch (NoSuchProviderException e){
			e.printStackTrace();
			System.exit(1);
		} catch (javax.mail.MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void main(String[] args) throws MessagingException, UnsupportedEncodingException{
		AddressPuller a = new AddressPuller();
		
	}

}
