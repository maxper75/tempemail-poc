package it.i_node.tempemail.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;


public class AddressBookFactory {
	Set <TempEmailAddress> addressBook;
	Map <String,TempEmailAddress> address2tempEmail = new HashMap<String,TempEmailAddress>();
	List<TempEmailAddress> exsistingAddresses = new ArrayList<TempEmailAddress>();
	PermanentUser user;

	public void  setExsistingAddresses(PermanentUser user){
		setUser(user);
		setExsistingAddresses(new ArrayList<TempEmailAddress>(user.getTempEmailAddresses()));
	}
	public PermanentUser getUser() {
		return user;
	}

	public void setUser(PermanentUser user) {
		this.user = user;
	}

	public Map<String, TempEmailAddress> getAddress2tempEmail() {
		return address2tempEmail;
	}

	public void setAddress2tempEmail(Map<String, TempEmailAddress> address2tempEmail) {
		this.address2tempEmail = address2tempEmail;
	}

	public List<TempEmailAddress> getExsistingAddresses() {
		return exsistingAddresses;
	}

	public void setExsistingAddresses(List<TempEmailAddress> exsistingAddresses) {
		this.exsistingAddresses = exsistingAddresses;
	}

	public Set<TempEmailAddress> getAddressBook() {
		return addressBook;
	}

	public void setAddressBook(Set<TempEmailAddress> addressBook) {
		this.addressBook = addressBook;
	}
	/**
	 * metodo che completa l'addressBook con gli indirizzi preesistenti per il permanentUser e non importati
	 * */
	public void fillMapExsisting(){
		for (TempEmailAddress tea: exsistingAddresses){
			if(!address2tempEmail.containsKey(tea.getEmailAddress()))//altrimenti era stato già inserito perchè recipient
				address2tempEmail.put(tea.getEmailAddress(), tea);
		}
	}
	public void checkNupdate(TempEmailAddress tea){

		if(exsistingAddresses.contains(tea)){// se recipient è già presente nella mailbox

			//address tra gli esistenti == address dei sent
			TempEmailAddress exsistingAddress = 
					exsistingAddresses.get(exsistingAddresses.indexOf(tea));
			//aggiorno il nome	
			if(tea.getName()!=null && exsistingAddress.getName()== null ){
				exsistingAddress.setName(tea.getName());	
			}
			//aggiungo alla mappa l'indirizzo degli esistenti
			address2tempEmail.put(exsistingAddress.getEmailAddress(), exsistingAddress);

		}
		else{//	Altrimenti se non è già presente nella mailbox	

			if (!address2tempEmail.containsKey(tea.getEmailAddress())){
				tea.setPermanentUser(user);
				address2tempEmail.put(tea.getEmailAddress(),tea);

			}
			else if (tea.getName()!= null && address2tempEmail.get(tea.getEmailAddress()).getName()== null)
				address2tempEmail.get(tea.getEmailAddress())
				.setName(tea.getName());		
		}
	}


}
