package it.i_node.tempemail.listeners;

import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

import it.i_node.tempemail.model.TempEmailAddress;

public class TempEmailAddressListener {
	@PrePersist
	public void prePersist(TempEmailAddress tea){
		tea.getPermanentUser().setDirty(true);
	}
	@PreUpdate
	public void preUpdate(TempEmailAddress tea){
		tea.getPermanentUser().setDirty(true);
	}	

}
