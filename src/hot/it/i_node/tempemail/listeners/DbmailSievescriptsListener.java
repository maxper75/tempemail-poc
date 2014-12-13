package it.i_node.tempemail.listeners;

import it.i_node.tempemail.model.DbmailSievescripts;
import it.i_node.tempemail.model.TempEmailAddress;

import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

public class DbmailSievescriptsListener {
	@PrePersist
	public void prePersist(DbmailSievescripts script){
		script.getDbmailUsers().getDbmailMailboxeses().ge
	}
	@PreUpdate
	public void preUpdate(DbmailSievescripts script){
		tea.getTempMailbox().setDirty(false);
	}	
}
