package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("tempUserHome")
public class TempUserHome extends EntityHome<TempUser> {
//	@In(create = true)
	//TempEmailAddressHome teahome;

	@In(create = true)
	DbmailMailboxesHome dbmailMailboxesHome;
	
	public void setTempUserUserIdnr(Long id) {
		setId(id);
	}

	public Long getTempUserUserIdnr() {
		return (Long) getId();
	}

	@Override
	protected TempUser createInstance() {
		TempUser tempUser = new TempUser();
		tempUser.setUserType("T");
		return tempUser;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		DbmailMailboxes dbmailbox = dbmailMailboxesHome.getDefinedInstance();
		
		if (dbmailbox != null) {
			getInstance().getDbmailMailboxeses().add(dbmailbox);
		}	
	}

	public boolean isWired() {
		return true;
	}

	public  TempUser getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<DbmailAcl> getDbmailAcls() {
		return getInstance() == null ? null : new ArrayList<DbmailAcl>(
				getInstance().getDbmailAcls());
	}

	public List<DbmailSubscription> getDbmailSubscriptions() {
		return getInstance() == null
				? null
				: new ArrayList<DbmailSubscription>(getInstance()
						.getDbmailSubscriptions());
	}

	public List<TempEmailAddress> getTempEmailAddresses() {
		return getInstance() == null ? null : new ArrayList<TempEmailAddress>(
				getInstance().getTempEmailAddresses());
	}

}
