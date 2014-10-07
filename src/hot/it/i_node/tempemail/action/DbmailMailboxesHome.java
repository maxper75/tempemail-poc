package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailMailboxesHome")
public class DbmailMailboxesHome extends EntityHome<DbmailMailboxes> {

	@In(create = true)
	DbmailUsersHome dbmailUsersHome;

	public void setDbmailMailboxesMailboxIdnr(Long id) {
		setId(id);
	}

	public Long getDbmailMailboxesMailboxIdnr() {
		return (Long) getId();
	}

	@Override
	protected DbmailMailboxes createInstance() {
		DbmailMailboxes dbmailMailboxes = new DbmailMailboxes();
		dbmailMailboxes.setMailboxType("D");
		return dbmailMailboxes;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		DbmailUsers dbmailUsers = dbmailUsersHome.getDefinedInstance();
		if (dbmailUsers != null) {
			getInstance().setDbmailUsers(dbmailUsers);
		}
	}

	public boolean isWired() {
		return true;
	}

	public DbmailMailboxes getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<DbmailAcl> getDbmailAcls() {
		return getInstance() == null ? null : new ArrayList<DbmailAcl>(
				getInstance().getDbmailAcls());
	}
	public List<DbmailMessages> getDbmailMessageses() {
		return getInstance() == null ? null : new ArrayList<DbmailMessages>(
				getInstance().getDbmailMessageses());
	}
	public List<DbmailSubscription> getDbmailSubscriptions() {
		return getInstance() == null
				? null
				: new ArrayList<DbmailSubscription>(getInstance()
						.getDbmailSubscriptions());
	}

}
