package it.i_node.tempemail.helpers;
import java.util.Set;

import javax.mail.MessagingException;

import it.i_node.tempemail.model.AddressBookFactory;
import it.i_node.tempemail.model.TempEmailAddress;


 public abstract class Importer {
	protected AddressBookFactory abf ;
	public abstract Set <TempEmailAddress> importAddresses()throws Exception;
	public AddressBookFactory getAbf() {
		return abf;
	}
	public void setAbf(AddressBookFactory abf) {
		this.abf = abf;
	}
}
