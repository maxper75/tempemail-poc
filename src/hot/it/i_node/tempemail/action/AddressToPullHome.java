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
@Name ("addressToPullHome")
public class AddressToPullHome extends EntityHome<AddressToPull>{
	@In(create = true)
	private PermanentUserHome permanentUserHome;

	public void setAddressToPullId(Long id) {
		setId(id);
	}

	public Long getAddressToPullId() {
		return (Long) getId();
	}

	@Override
	protected AddressToPull createInstance() {
		AddressToPull addressToPull = new AddressToPull();
		PermanentUser puser= permanentUserHome.getDefinedInstance();

		if (puser != null)
			addressToPull.setPermanentUser(puser);

		return addressToPull;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
	}

	public boolean isWired() {
		return true;
	}

	public  AddressToPull getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public PermanentUser getPermanentUser() {
		return getInstance() == null? null : getInstance().getPermanentUser();
	}


}
