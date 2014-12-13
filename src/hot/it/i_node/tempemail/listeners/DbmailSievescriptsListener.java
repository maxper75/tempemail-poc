package it.i_node.tempemail.listeners;

import it.i_node.tempemail.model.DbmailSievescripts;
import it.i_node.tempemail.model.DbmailUsers;
import it.i_node.tempemail.model.TempEmailAddress;
import it.i_node.tempemail.model.TempUser;

import javax.persistence.EntityManager;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

import org.jboss.seam.Component;

public class DbmailSievescriptsListener {
	@PrePersist
	public void prePersist(DbmailSievescripts script){
		
		if(script.getDbmailUsers().getUserType().equals("T"))
		{
			EntityManager em = (EntityManager) Component.getInstance("entityManager");
			TempUser user = em.find(TempUser.class, script.getDbmailUsers().getUserIdnr());
			if(user!=null)
				user.setDirty(false);
				
		}
	}
	@PreUpdate
	public void preUpdate(DbmailSievescripts script){
		if(script.getDbmailUsers().getUserType().equals("T"))
		{
			EntityManager em = (EntityManager) Component.getInstance("entityManager");
			TempUser user = em.find(TempUser.class, script.getDbmailUsers().getUserIdnr());
			if(user!=null)
				user.setDirty(false);
				
		}
	}	
}
