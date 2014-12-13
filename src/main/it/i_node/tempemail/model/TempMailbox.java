package it.i_node.tempemail.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table
@DiscriminatorValue("T")
public class TempMailbox extends DbmailMailboxes {

	private Date creationDate;
	private Date refreshDate;
	private Set <TempEmailAddress> tempEmailAddresses = new HashSet<TempEmailAddress>(0);
	private boolean dirty;
	
	
	
	
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
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tempMailbox")
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
