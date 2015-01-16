package it.i_node.tempemail.action;

import it.i_node.tempemail.model.AddressToPull;
import it.i_node.tempemail.model.DbmailAcl;
import it.i_node.tempemail.model.DbmailFilters;
import it.i_node.tempemail.model.DbmailMailboxes;
import it.i_node.tempemail.model.DbmailSievescripts;
import it.i_node.tempemail.model.DbmailSubscription;
import it.i_node.tempemail.model.PermanentUser;
import it.i_node.tempemail.model.TempEmailAddress;

import java.util.ArrayList;
import java.util.List;

import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;
@Name ("permanentUserHome")
public class PermanentUserHome extends EntityHome<PermanentUser>{

	@In(create = true)
	DbmailMailboxesHome dbmailMailboxesHome;
	
	public void setPermanentUserUserIdnr(Long id) {
		setId(id);
	}

	public Long getPermanentUserUserIdnr() {
		return (Long) getId();
	}

	@Override
	protected PermanentUser createInstance() {
		PermanentUser permanentUser = new PermanentUser();
		permanentUser.setUserType("T");
		return permanentUser;
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

	public  PermanentUser getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}



	public List<AddressToPull> getAddressesToPull() {
		return getInstance() == null ? null : new ArrayList<AddressToPull>(
				getInstance().getAddressesToPull());
	}

	public List<TempEmailAddress> getTempEmailAddresses() {
		return getInstance() == null ? null : new ArrayList<TempEmailAddress>(
				getInstance().getTempEmailAddresses());
	}

	public List<DbmailAcl> getDbmailAcls() {
		return getInstance() == null ? null : new ArrayList<DbmailAcl>(
				getInstance().getDbmailAcls());
	}
	public List<DbmailFilters> getDbmailFilterses() {
		return getInstance() == null ? null : new ArrayList<DbmailFilters>(
				getInstance().getDbmailFilterses());
	}
	public List<DbmailMailboxes> getDbmailMailboxeses() {
		return getInstance() == null ? null : new ArrayList<DbmailMailboxes>(
				getInstance().getDbmailMailboxeses());
	}
	public List<DbmailSievescripts> getDbmailSievescriptses() {
		return getInstance() == null
				? null
				: new ArrayList<DbmailSievescripts>(getInstance()
						.getDbmailSievescriptses());
	}
	public List<DbmailSubscription> getDbmailSubscriptions() {
		return getInstance() == null
				? null
				: new ArrayList<DbmailSubscription>(getInstance()
						.getDbmailSubscriptions());
	}
	

}
