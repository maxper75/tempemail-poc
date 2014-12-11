package it.i_node.tempemail.helpers;

import it.i_node.tempemail.action.TempEmailAddressHome;
import it.i_node.tempemail.action.TempMailboxHome;
import it.i_node.tempemail.model.AddressToPull;
import it.i_node.tempemail.model.IMAPAddressPuller;
import it.i_node.tempemail.model.ImportedAddress;
import it.i_node.tempemail.model.TempEmailAddress;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	private List <TempEmailAddress> add2import= new  ArrayList<TempEmailAddress>();
	private AddressToPull utente = new AddressToPull();
	private Map <TempEmailAddress,Integer> imported2Retention = new HashMap<TempEmailAddress, Integer>();
	//utente da usare per i test(più address= più lento nel caricamento)
	private AddressToPull davide;
	//utente da usare per i test (unico address= più veloce nel caricamento)
	private AddressToPull barbara;

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
		if (add2import!= null)
			if (!add2import.isEmpty()){
				for(TempEmailAddress tea: imported2Retention.keySet()){
					TempEmailAddressHome teah = (TempEmailAddressHome) Component.getInstance(TempEmailAddressHome.class);
					teah.getInstance().setEmailAddress(tea.getEmailAddress());
					teah.getInstance().setName(tea.getName());

					if(imported2Retention.get(tea)<1)
						//0 oppure -1
						teah.getInstance().setRetentionDays(imported2Retention.get(tea));
					//altrimenti è stato già settato dalla form

					if (tea.getId()>0)
						teah.update();
					else
						teah.persist();
				}
				return "addedAll";
			}
		return "noAddresseAdded";
	}
	public Map<TempEmailAddress, Integer> getImported2Retention() {
		return imported2Retention;
	}
	public void setImported2Retention(
			Map<TempEmailAddress, Integer> imported2Retention) {
		this.imported2Retention = imported2Retention;
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
		if (imported2Retention.containsKey(tea))
			imported2Retention.remove(tea);
		return "removed";
	}
	public String importAddresses() throws MessagingException{
		IMAPAddressPuller puller = new IMAPAddressPuller();
		setAdd2import(new ArrayList<TempEmailAddress>(puller.addressesFromSentFolder(utente)));
		if (!add2import.isEmpty())
			fillMap(add2import);		
		return "needRetention";
		//return "imported";
	}
	public void fillMap(List <TempEmailAddress> teaList){
		//tealist not empty (test in importAddresses)
		for(TempEmailAddress tea: add2import){
			//impostato di defaul il valore di retention Policy a 0
			imported2Retention.put(tea,getRetentionPolicyFromRetentionDays(tea));
		}

	}
	public Integer getRetentionPolicyFromRetentionDays(TempEmailAddress tea){
		if (tea.getRetentionDays()!=null)	{
			switch(tea.getRetentionDays()){
			case -1:
				return -1;
			case 0:
				return 0;//mailbox.discarded
			default:
				return 1;//verifica!
				//non sempre retentionpolicy=1
			}
		}
		return 0;//default se non esiste retentiondays

	}
	/**
	 * metodo da usare nella fase di test
	 * più lento nel caricamento
	 * */
	public String importAddressesFromDavide() throws MessagingException{
		IMAPAddressPuller puller = new IMAPAddressPuller();
		davide = new AddressToPull();
		davide.setEmail("d.pucci@i-node.it");
		davide.setImapORimaps("imap");
		davide.setPassword("uuuV2Tk3");
		davide.setServerName("zimbra.i-node.it");
		setAdd2import(new ArrayList<TempEmailAddress>(puller.addressesFromSentFolder(davide)));
		if (!add2import.isEmpty())
			fillMap(add2import);		
		return "needRetention";

	}
	/**
	 * metodo da usare nella fase di test
	 * più rapido nel caricamento*/
	public String importAddressesFromBarbara() throws MessagingException{
		IMAPAddressPuller puller = new IMAPAddressPuller();
		barbara = new AddressToPull();
		barbara.setEmail("b.covella@i-node.it");
		barbara.setImapORimaps("imap");
		barbara.setPassword("7mJ7nagE");
		barbara.setServerName("zimbra.i-node.it");
		setAdd2import(new ArrayList<TempEmailAddress>(puller.addressesFromSentFolder(barbara)));
		if (!add2import.isEmpty())
			fillMap(add2import);		
		return "needRetention";
		
	}
	

	//	public ImportedAddress getElemFromList(TempEmailAddress tea){
	//		if(!importedNRetentionPolicy.isEmpty())
	//		for (ImportedAddress imported: importedNRetentionPolicy)
	//			if(imported.getTea()==tea)
	//				return imported;
	//		return null;//non esiste l'elemento
	//	}




}
