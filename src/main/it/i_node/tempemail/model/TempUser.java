package it.i_node.tempemail.model;



import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name ="tempuser",schema="public")
@DiscriminatorValue("T")
public class TempUser extends DbmailUsers {
	
	private boolean dirty;//forse non serve per questa estensione
	private Date creationDate;
	private Date refreshDate;

	public boolean isDirty() {
		return dirty;
	}
	public void setDirty(boolean dirty) {
		this.dirty = dirty;
	}


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




}
