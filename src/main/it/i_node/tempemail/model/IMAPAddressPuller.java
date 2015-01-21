package it.i_node.tempemail.model;

import it.i_node.tempemail.action.PermanentUserHome;
import it.i_node.tempemail.helpers.Importer;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
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

import org.apache.derby.iapi.util.CheapDateFormatter;
import org.apache.poi.hssf.util.HSSFColor.TEAL;
import org.jboss.seam.Component;
import org.jboss.seam.annotations.Name;

import ezvcard.Ezvcard;
import ezvcard.VCard;
import ezvcard.io.text.VCardReader;
import ezvcard.property.Email;


@Name("imapAddressPuller")
public class IMAPAddressPuller extends Importer{
	private AddressToPull utente ;

	public IMAPAddressPuller() {

	}
	public AddressToPull getUtente() {
		return utente;
	}
	public void setUtente(AddressToPull utente) {
		this.utente = utente;
	}
	/**
	 * @param: Utente da cui importare gli address
	 * @return: hashSet con tutti gli indirizzi( TempEmailAddress da importare
	 * 											 e TempEmailAddress  già presenti nella TempMailbox con il valore di 
	 * 														retentionDays già settato precedentemente) 
	 */	
	public Set<TempEmailAddress> addressesFromSentFolder (AddressToPull utente) throws MessagingException {

		TempEmailAddressFactory teaf = new TempEmailAddressFactory();
		PermanentUserHome puh = (PermanentUserHome) Component.getInstance(PermanentUserHome.class);
		abf = new AddressBookFactory();
		
		/*property accesso alla cartella Sent*/
		Properties props = System.getProperties();
		props.setProperty("mail.store.protocol",utente.getImapORimaps());
		Session session = Session.getDefaultInstance(props, null);
		Store store = session.getStore(utente.getImapORimaps());
		store.connect(utente.getServerName(), utente.getEmail(),utente.getPassword());
		Folder sent= store.getFolder("Sent");
		sent.open(Folder.READ_ONLY);
		/*end property accesso cartella Sent*/
		
		/*preparo AddressBookFactory*/
		//setto l'utente in sessione e il la lista dei suoi tempemailaddresses
		abf.setExsistingAddresses(puh.getInstance());		
		/*end preparazione AddressBookFactory*/

		for (Message m : sent.getMessages()){
			for (Address aR: m.getAllRecipients()){
				TempEmailAddress recipient = teaf.createAddress(aR);
				abf.checkNupdate(recipient);
			}
		}
		//finisco di riempire con tutti quelli che non rientrano tra i recipient ma sono presenti nella mailbox
		abf.fillMapExsisting();
		
		sent.close(false);
		store.close();
		return	new HashSet<TempEmailAddress>(abf.getAddress2tempEmail().values());
	}
	@Override
	public Set<TempEmailAddress> importAddresses() throws Exception {
		return addressesFromSentFolder(utente);
	}
	

}
