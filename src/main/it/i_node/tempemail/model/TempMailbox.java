package it.i_node.tempemail.model;

import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table
@DiscriminatorValue("T")
public class TempMailbox extends DbmailMailboxes {
	private Date creationDate;
	private Date refreshDate;
	
	private Set <TempEmailAddress> tempEmailAddresses = new HashSet<TempEmailAddress>();
	
	public Date getRefreshDate() {
		return refreshDate;
	}
	public void setRefreshDate(Date refreshDate) {
		this.refreshDate = refreshDate;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	@OneToMany
	public Set<TempEmailAddress> getTempEmailAddresses() {
		return tempEmailAddresses;
	}
	public void setTempEmailAddresses(Set<TempEmailAddress> tempEmailAddresses) {
		this.tempEmailAddresses = tempEmailAddresses;
	}

	
	
}
