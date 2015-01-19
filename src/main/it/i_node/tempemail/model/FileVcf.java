package it.i_node.tempemail.model;

import it.i_node.tempemail.action.PermanentUserHome;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;

import org.apache.derby.iapi.util.ByteArray;
import org.jboss.seam.Component;
import org.jboss.seam.annotations.Name;

import ezvcard.Ezvcard;
import ezvcard.VCard;
import ezvcard.io.text.VCardReader;
import ezvcard.property.Email;

@Name("fileVcf")
public class FileVcf {
	private InputStream in;
	private ByteArray data = new ByteArray();
	private String filename;
	private String contentType;
	private long size;

	public InputStream getIn() {
		return in;
	}

	public void setIn(InputStream in) {
		this.in = in;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}
	public ByteArray getData() {
		return data;
	}

	public void setData(ByteArray data) {
		this.data = data;
	}
	private void uploadVcf() throws IOException{
		PermanentUserHome puh = (PermanentUserHome) Component.getInstance(PermanentUserHome.class);
		VCardReader vcardReader = new VCardReader(in);
		List<VCard> vcards = vcardReader.readAll();
		for (VCard vcard: vcards) {
			vcf2TEAddresses(vcard, puh.getInstance());
		}
	//	InputStreamReader inputSreader = new InputStreamReader(in);
		vcardReader.close();

	}

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
	 * 
	 * 
	 * doc: http://stackoverflow.com/questions/13008943/icefaces-seam-file-upload-component-not-uploading-files
	 * doc: https://ez-vcard.googlecode.com/svn/javadocs/latest/ezvcard/io/text/VCardReader.html
	 * doc: http://facestutorials.icefaces.org/tutorial/inputFile-tutorial.html
	 */	
	public Set<TempEmailAddress> uploadVcf(InputStream in) throws IOException{
		PermanentUserHome puh = (PermanentUserHome) Component.getInstance(PermanentUserHome.class);
		Map <String,TempEmailAddress> address2tempEmail = new HashMap<String,TempEmailAddress>();
		BufferedInputStream buffer = new BufferedInputStream(in);
		Reader inreader = null;
		BufferedReader bufferReader = new BufferedReader(inreader);

		VCardReader vcardReader = new VCardReader(in);// InputStream in: the input stream to read the vcards from
		VCard vcard;
		while ((vcard = vcardReader.readNext()) != null){
			Set <TempEmailAddress> cardAddresses=vcf2TEAddresses(vcard, puh.getInstance());
			for (TempEmailAddress tea: cardAddresses)
				address2tempEmail.put(tea.getEmailAddress(), tea);

		}
		buffer.close();
		vcardReader.close();
		return new HashSet<TempEmailAddress>(address2tempEmail.values());
	}
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




}
