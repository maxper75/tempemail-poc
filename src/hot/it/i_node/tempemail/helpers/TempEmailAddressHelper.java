package it.i_node.tempemail.helpers;

import it.i_node.tempemail.action.TempEmailAddressHome;
import it.i_node.tempemail.action.TempMailboxHome;
import it.i_node.tempemail.model.AddressToPull;
import it.i_node.tempemail.model.IMAPAddressPuller;
import it.i_node.tempemail.model.TempEmailAddress;

import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;

import org.jboss.seam.Component;
import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.Create;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Scope;

@Name ("tempEmailAddressHelper")
@Scope(ScopeType.CONVERSATION)
public class TempEmailAddressHelper {
	/**
	 * retention values:
	 * 1 =retain
	 * 0 =discard//keep
	 * -1=deliver 
	 * 
	 */
	private Integer retentionPolicy;
	private List <TempEmailAddress> add2import;
	private AddressToPull utente = new AddressToPull();


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

	public List<TempEmailAddress> getAdd2import() {
		return add2import;
	}
	public void setAdd2import(List<TempEmailAddress> add2import) {
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
	@SuppressWarnings("unused")
	public String persistAll(){
		if (!add2import.isEmpty()){
			for(TempEmailAddress tea: add2import){
				TempEmailAddressHome teah = (TempEmailAddressHome) Component.getInstance(TempEmailAddressHome.class);
				if(retentionPolicy<1)//0 oppure -1
					teah.getInstance().setRetentionDays(retentionPolicy);
				teah.persist();
			}
			return "addedAll";
		}
		return "noAddresseAdded";
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

	public String delete (TempEmailAddress tea){
		if(add2import.contains(tea))
			add2import.remove(tea);

		return "removed";
	}
	public String importAddresses() throws MessagingException{
		IMAPAddressPuller puller = new IMAPAddressPuller();
		setAdd2import(new ArrayList<TempEmailAddress>(puller.addressesFromSentFolder(utente)));
		//if (!add2import.isEmpty())
		return "needRetention";
		//return "imported";

	}
}
