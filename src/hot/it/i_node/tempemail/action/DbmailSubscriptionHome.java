package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailSubscriptionHome")
public class DbmailSubscriptionHome extends EntityHome<DbmailSubscription> {

	@In(create = true)
	DbmailMailboxesHome dbmailMailboxesHome;
	@In(create = true)
	DbmailUsersHome dbmailUsersHome;

	public void setDbmailSubscriptionId(DbmailSubscriptionId id) {
		setId(id);
	}

	public DbmailSubscriptionId getDbmailSubscriptionId() {
		return (DbmailSubscriptionId) getId();
	}

	public DbmailSubscriptionHome() {
		setDbmailSubscriptionId(new DbmailSubscriptionId());
	}

	@Override
	public boolean isIdDefined() {
		if (getDbmailSubscriptionId().getMailboxId() == 0)
			return false;
		if (getDbmailSubscriptionId().getUserId() == 0)
			return false;
		return true;
	}

	@Override
	protected DbmailSubscription createInstance() {
		DbmailSubscription dbmailSubscription = new DbmailSubscription();
		dbmailSubscription.setId(new DbmailSubscriptionId());
		return dbmailSubscription;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		DbmailMailboxes dbmailMailboxes = dbmailMailboxesHome
				.getDefinedInstance();
		if (dbmailMailboxes != null) {
			getInstance().setDbmailMailboxes(dbmailMailboxes);
		}
		DbmailUsers dbmailUsers = dbmailUsersHome.getDefinedInstance();
		if (dbmailUsers != null) {
			getInstance().setDbmailUsers(dbmailUsers);
		}
	}

	public boolean isWired() {
		if (getInstance().getDbmailMailboxes() == null)
			return false;
		if (getInstance().getDbmailUsers() == null)
			return false;
		return true;
	}

	public DbmailSubscription getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
