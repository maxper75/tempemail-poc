package it.i_node.tempemail.helpers;

import it.i_node.tempemail.action.PermanentUserHome;
import it.i_node.tempemail.action.TempEmailAddressHome;
import it.i_node.tempemail.model.AddressToPull;
import it.i_node.tempemail.model.FileVcf;
import it.i_node.tempemail.model.IMAPAddressPuller;
import it.i_node.tempemail.model.PermanentUser;
import it.i_node.tempemail.model.TempEmailAddress;
import it.i_node.tempemail.model.VcfUpload;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.persistence.EntityManager;

import org.jboss.seam.Component;
import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.Create;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Scope;

import ezvcard.Ezvcard;
import ezvcard.VCard;
import ezvcard.property.Email;



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
	private Map <TempEmailAddress,Integer> imported2Retention = new HashMap<TempEmailAddress, Integer>();
	private Importer importer;
	private FileVcf file;
	
	public FileVcf getFile() {
		return file;
	}
	public void setFile(FileVcf file) {
		this.file = file;
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
		EntityManager em = (EntityManager) Component.getInstance("entityManager");
		if (add2import!= null)
			if (!add2import.isEmpty()){
				for(TempEmailAddress tea: imported2Retention.keySet()){


					if(imported2Retention.get(tea)<1)
						//0 oppure -1
						tea.setRetentionDays(imported2Retention.get(tea));
					//altrimenti è stato già settato dalla form

					if (tea.getId()>0)

						em.merge(tea);//verificare
					//teah.update();
					else
						em.persist(tea);
				}

				return "addedAll";
			}
		return "noAddressesAdded";
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
		if(retentionPolicy<1)// 0=discard // 1= deliver
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
				return "discard";//mailbox.discarded. in realtà viene persistito in una mailbox != mailbox.inbox (non scartato)
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
	
	/**---------------------metodi per importare liste di TempEmailAddresses---------------------------**/
	/**
	 * metodo per importare addresses da utente AddressToPull
	 * (viene richiamato dal pulsante "connect" dalla vista tempmailbox
	 * @throws Exception 
	 * */
	public String importAddressesFromUser(AddressToPull user) throws Exception{
		importer = new IMAPAddressPuller();
		((IMAPAddressPuller) importer).setUtente(user);
		return anyImport(importer);
		}
	
	/**
	 * metodo per importare addresses da file .vcf
	 * @throws Exception 
	 * */
	//contentType="#{file.contentType}"
	//fileName="#{file.filename}" fileSize="#{fileVcf.size}"
	public String importVcf() throws Exception{
		importer = new VcfUpload();	
		((VcfUpload) importer).setFile(file);
		return anyImport(importer);
	}
	/**
	 *metodo di supporto per inserimento lista di TempEmailAddresses
	 *chiede all'importer di estrarre la lista di TempEmailAddresses e si occupa dei
	 *vari check 
	 * */
	public String anyImport(Importer importer) throws Exception{
		setAdd2import(new ArrayList<TempEmailAddress>(importer.importAddresses()));//contiene indirizzi scaricati e già esistenti nella tmailbox
		if (!add2import.isEmpty())
			fillMap(add2import);		
		return "needRetention";
		
	}
	/**
	 * metodo di supporto per inserimento lista di TempEmauilAddresses
	 * riempe la mappa imported2retention, e mostra la potenziale rubrica dell'utente
	 * */
	public void fillMap(List <TempEmailAddress> teaList){
		//tealist not empty (test in importAddresses)
		for(TempEmailAddress tea: add2import){
			//impostato di defaul il valore di retention Policy a 0
			imported2Retention.put(tea,getRetentionPolicyFromRetentionDays(tea));
		}

	}
}
