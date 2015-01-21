package it.i_node.tempemail.model;

import it.i_node.tempemail.action.PermanentUserHome;
import it.i_node.tempemail.helpers.Importer;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;

import org.jboss.seam.Component;

import ezvcard.Ezvcard;
import ezvcard.VCard;
import ezvcard.io.text.VCardReader;
import ezvcard.property.Email;

public class VcfUpload extends Importer{
	
	private FileVcf file;
	

	public FileVcf getFile() {
		return file;
	}

	public void setFile(FileVcf file) {
		this.file = file;
	}

	/**
	 * metodo che itera tra gli indirizzi email della vcard e crea relativo tempemailaddress
	 */
	public Set<TempEmailAddress> vcf2TEAddresses(VCard vcard,PermanentUser user){
		Map <String,TempEmailAddress> address2tempEmail = new HashMap<String,TempEmailAddress>();
		for (Email em: vcard.getEmails()){
			TempEmailAddress tea = new TempEmailAddress();
			tea.setEmailAddress(em.getValue());
			tea.setName(vcard.getFormattedName().getValue());
			tea.setPermanentUser(user);
			tea.setRetentionDays(0);// default
			address2tempEmail.put(tea.getEmailAddress(), tea);
		}
		return new HashSet<TempEmailAddress>(address2tempEmail.values());
	}
	/**
	 * metodo non completo
	 * @throws IOException 
	 */	
	public Set<TempEmailAddress> uploadVcf() throws IOException{
		PermanentUserHome puh = (PermanentUserHome) Component.getInstance(PermanentUserHome.class);
		abf= new AddressBookFactory();
		//setto l'utente e la lista dei suoi tempemailaddresses 
		abf.setExsistingAddresses(puh.getInstance());
		InputStream is = new ByteArrayInputStream(file.getData());
		VCardReader vcardReader = new VCardReader(is);// InputStream in: the input stream to read the vcards from
		VCard vcard;

		while ((vcard = vcardReader.readNext()) != null){
			Set <TempEmailAddress> cardAddresses=vcf2TEAddresses(vcard, puh.getInstance());
			for (TempEmailAddress tea: cardAddresses)
				abf.checkNupdate(tea);
		}
		//finisco di riempire con tutti quelli che non rientrano tra i recipient ma sono presenti nella mailbox
		abf.fillMapExsisting();
		
		vcardReader.close();
		return new HashSet<TempEmailAddress>(abf.getAddress2tempEmail().values());
	}
	/**
	 * metodo che estrae gli indirizzi da vcard in locale
	 * */
	public Set<TempEmailAddress> addressFromLocalVcf(String pathname) throws MessagingException, IOException {
		PermanentUserHome puh = (PermanentUserHome) Component.getInstance(PermanentUserHome.class);
		Map <String,TempEmailAddress> address2tempEmail = new HashMap<String,TempEmailAddress>();
		File file = new File(pathname);
		VCard vcard = Ezvcard.parse(file).first();
		for (Email em: vcard.getEmails()){
			Set <TempEmailAddress> cardAddresses=vcf2TEAddresses(vcard, puh.getInstance());
			for (TempEmailAddress tea: cardAddresses)
				address2tempEmail.put(tea.getEmailAddress(), tea);

		}

		return	new HashSet<TempEmailAddress>(address2tempEmail.values());
	}
//	private void uploadVcf() throws IOException{
	//		PermanentUserHome puh = (PermanentUserHome) Component.getInstance(PermanentUserHome.class);
	//		VCardReader vcardReader = new VCardReader(in);
	//		List<VCard> vcards = vcardReader.readAll();
	//		for (VCard vcard: vcards) {
	//			vcf2TEAddresses(vcard, puh.getInstance());
	//		}
	//	//	InputStreamReader inputSreader = new InputStreamReader(in);
	//		vcardReader.close();
	//
	//	}
	/**
	 * potrebbe servire per l'upload da url per zimbra*/
	//	private String getUpdateCode(){
	//		try {
	//			final URL updateURL=new URL(UPDATE_SITE);
	//			final URLConnection conn=updateURL.openConnection();
	//			final BufferedReader bis=new BufferedReader(new InputStream(conn.getInputStream()),8192);
	//			final ByteArrayBuffer baf=new ByteArrayBuffer(50);
	//			int current=0;
	//			while ((current=bis.read()) != -1) {
	//				baf.append((byte)current);
	//			}
	//			return new String(baf.toByteArray()).replace("\n","");
	//		}
	//	}

	@Override
	public Set<TempEmailAddress> importAddresses() throws Exception {
		// TODO Auto-generated method stub
		return uploadVcf();
	}



}
