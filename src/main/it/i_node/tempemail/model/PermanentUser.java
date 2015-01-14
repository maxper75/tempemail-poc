package it.i_node.tempemail.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table
@DiscriminatorValue("T")
public class PermanentUser extends DbmailUsers{
	
	private Set <TempEmailAddress> tempEmailAddresses = new HashSet<TempEmailAddress>(0);
	private boolean dirty;
	private Set <AddressToPull> addressesToPull = new HashSet<AddressToPull>(0); 
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy="permanentUser" )
	public Set<AddressToPull> getAddressesToPull() {
		return addressesToPull;
	}
	public void setAddressesToPull(Set<AddressToPull> addressesToPull) {
		this.addressesToPull = addressesToPull;
	}
	@OneToMany(fetch = FetchType.LAZY,mappedBy="permanentUser")
	public Set<TempEmailAddress> getTempEmailAddresses() {
		return this.tempEmailAddresses;
	}
	public void setTempEmailAddresses(Set<TempEmailAddress> tempEmailAddresses) {
		this.tempEmailAddresses = tempEmailAddresses;
	}
	public boolean isDirty() {
		return dirty;
	}
	public void setDirty(boolean dirty) {
		this.dirty = dirty;
	}

}
