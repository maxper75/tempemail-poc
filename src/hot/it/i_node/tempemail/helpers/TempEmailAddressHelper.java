package it.i_node.tempemail.helpers;

import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;

import it.i_node.tempemail.action.TempEmailAddressHome;
import it.i_node.tempemail.action.TempMailboxHome;
import it.i_node.tempemail.model.AddressToPull;
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
	private Set <TempEmailAddress> add2import;
	private AddressToPull utente;


	public AddressToPull getUtente() {
		return utente;
	}
	public void setUtente(AddressToPull utente) {
		this.utente = utente;
	}
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
	public Set<TempEmailAddress> getAdd2import() {
		return add2import;
	}
	public void setAdd2import(Set<TempEmailAddress> add2import) {
		this.add2import = add2import;
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
	public boolean allRetentionDays(){
		TempMailboxHome tmh = (TempMailboxHome) Component.getInstance(TempMailboxHome.class);
		for(TempEmailAddress tea: tmh.getInstance().getTempEmailAddresses())
			if (tea.getRetentionDays()==null)
				return false;
		return true;

	}
	public String importAddresses() throws MessagingException{
		IMAPAddressPuller puller = new IMAPAddressPuller();
		setAdd2import(puller.addressesFromSentFolder(utente));
		return "imported";
	}
}
