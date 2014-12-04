package it.i_node.tempemail.helpers;

import java.util.Map;

import javax.mail.MessagingException;

import it.i_node.tempemail.action.TempEmailAddressHome;
import it.i_node.tempemail.model.IMAPAddressPuller;
import it.i_node.tempemail.model.TempEmailAddress;

import org.jboss.seam.Component;
import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.Create;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Scope;

@Name ("tempEmailAddressHelper")
@Scope(ScopeType.CONVERSATION)
public class TempEmailAddressHelper {
	/**
	 * retention values
	 * 1 =retain
	 * 0 =discard//keep
	 * -1=deliver
	 * 
	 */
	private Integer retentionPolicy;
	private String address;
	private String imapORimaps ;
	private String email ;
	private String password ;
	private String domain;
	@Create
	public void init(){
		//viene invocato dopo ogni creazione di una nuova TempEmailAddress instance
		TempEmailAddressHome teah = (TempEmailAddressHome) Component.getInstance(TempEmailAddressHome.class);
		if (teah.getInstance().getRetentionDays()== null)
			retentionPolicy= 0;//keep
		else if(teah.getInstance().getRetentionDays()>0){
			retentionPolicy=1;

		}
		else retentionPolicy= teah.getInstance().getRetentionDays();


	}
	public Integer getRetentionPolicy() {
		return retentionPolicy;
	}

	public void setRetentionPolicy(Integer retentionPolicy) {
		this.retentionPolicy = retentionPolicy;

	}
	public String persist(){

		TempEmailAddressHome teah = (TempEmailAddressHome) Component.getInstance(TempEmailAddressHome.class);

		if(retentionPolicy<1)//0 oppure -1
			teah.getInstance().setRetentionDays(retentionPolicy);
		
			
		return teah.persist();
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String update(){
		TempEmailAddressHome teah = (TempEmailAddressHome) Component.getInstance(TempEmailAddressHome.class);
		if(retentionPolicy<1)
			teah.getInstance().setRetentionDays(retentionPolicy);
		return teah.update();
	}
	public String remove(){
		TempEmailAddressHome teah = (TempEmailAddressHome) Component.getInstance(TempEmailAddressHome.class);
		return teah.remove(); 
	}

	public String getRetentionPolicyString(TempEmailAddress tea){
		if (tea.getRetentionDays()!=null)	{	
			switch(tea.getRetentionDays()){
			case -1:
				return "deliver";
			case 0:
				return "keep(discard)";//mailbox.discarded
			default:
				return "retain for "+ tea.getRetentionDays() + " days";//verifica!
				//non sempre retentionpolicy=1
			}
		}
		return "retain";
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
//	public Map <String,TempEmailAddress> importValidAddresses() throws MessagingException{
//		IMAPAddressPuller ap= new IMAPAddressPuller();
//		ap.setDomain(domain);
//		ap.setEmail(email);
//		ap.setImapORimaps(imapORimaps);
//		ap.setPassword(password);
//		return ap.addressesFromSentFolder();
//	}
//	public String persistImportedValue () throws MessagingException{
//		for (TempEmailAddress tea : importValidAddresses().values()){
//			
//		}
//		return null;
//	}
//	
	
//	public boolean exsists(String tea,TempEmailAddressHome teah){
//
//		for(TempEmailAddress test: teah.getInstance().getTempMailbox().getTempEmailAddresses())
//			if (test.getEmailAddress().equals(tea))
//				return true;
//			
//		return false;
//	}
}
