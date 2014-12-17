package it.i_node.tempemail.model;

import it.i_node.tempemail.action.PermanentUserHome;

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
import javax.mail.Session;
import javax.mail.Store;

import org.jboss.seam.Component;
import org.jboss.seam.annotations.Name;


@Name("imapAddressPuller")
public class IMAPAddressPuller {

	public IMAPAddressPuller() {

	}
	/**
	 * @param: Utente da cui importare gli address
	 * @return: hashSet con tutti gli indirizzi( TempEmailAddress da importare
	 * 											 e TempEmailAddress  già presenti nella TempMailbox con il valore di 
	 * 														retentionDays già settato precedentemente) 
	 */
	
	public Set<TempEmailAddress> addressesFromSentFolder (AddressToPull utente) throws MessagingException {
		Properties props = System.getProperties();
		props.setProperty("mail.store.protocol",utente.getImapORimaps());
		Map <String,TempEmailAddress> address2tempEmail = new HashMap<String,TempEmailAddress>();

		Session session = Session.getDefaultInstance(props, null);
		Store store = session.getStore(utente.getImapORimaps());
		store.connect(utente.getServerName(), utente.getEmail(),utente.getPassword());

		//Folder [] folders=store.getDefaultFolder().list("*");
		Folder sent= store.getFolder("Sent");
		sent.open(Folder.READ_ONLY);
		TempEmailAddressFactory teaf = new TempEmailAddressFactory();
		PermanentUserHome puh = (PermanentUserHome) Component.getInstance(PermanentUserHome.class);
		//addresses della tempMailbox : già esistenti
		List<TempEmailAddress> exsistingAddresses = new ArrayList<TempEmailAddress>(
				puh.getInstance().getTempEmailAddresses());

		for (Message m : sent.getMessages()){
			for (Address aR: m.getAllRecipients()){
				//address nella cartella sent
				TempEmailAddress recipient = teaf.createAddress(aR);
				if(exsistingAddresses.contains(recipient)){// se recipient è già presente nella mailbox
					
					//address tra gli esistenti == address dei sent
					TempEmailAddress exsistingAddress = 
							exsistingAddresses.get(exsistingAddresses.indexOf(recipient));
					//aggiorno il nome	
					if(recipient.getName()!=null && exsistingAddress.getName()== null ){
						exsistingAddress.setName(recipient.getName());	
					}
					//aggiungo alla mappa l'indirizzo degli esistenti
					address2tempEmail.put(exsistingAddress.getEmailAddress(), exsistingAddress);

				}
				else{//	Altrimenti se non è già presente nella mailbox	
									
					if (!address2tempEmail.containsKey(recipient.getEmailAddress())){

						recipient.setPermanentUser(puh.getInstance());
						address2tempEmail.put(recipient.getEmailAddress(),recipient);

					}
					else if (recipient.getName()!= null && address2tempEmail.get(recipient.getEmailAddress()).getName()== null)
						address2tempEmail.get(recipient.getEmailAddress())
						.setName(recipient.getName());		
				}	
			}
		}
		//finisco di riempire con tutti quelli che non rientrano tra i recipient ma sono presenti nella mailbox
		fillMapExsisting( exsistingAddresses, address2tempEmail);
		
		sent.close(false);
		store.close();

		return	new HashSet<TempEmailAddress>(address2tempEmail.values());
	}
	public void fillMapExsisting(List <TempEmailAddress> exsistingAddresses,Map <String,TempEmailAddress> address2tempEmail){
		for (TempEmailAddress tea: exsistingAddresses){
			if(!address2tempEmail.containsKey(tea.getEmailAddress()))//altrimenti era stato già inserito perchè recipient
				address2tempEmail.put(tea.getEmailAddress(), tea);
		}
		
	}




}
