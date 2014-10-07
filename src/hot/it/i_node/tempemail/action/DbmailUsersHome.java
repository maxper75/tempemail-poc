package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailUsersHome")
public class DbmailUsersHome extends EntityHome<DbmailUsers> {

	@In(create = true)
	DbmailAutoNotificationsHome dbmailAutoNotificationsHome;
	@In(create = true)
	DbmailAutoRepliesHome dbmailAutoRepliesHome;

	public void setDbmailUsersUserIdnr(Long id) {
		setId(id);
	}

	public Long getDbmailUsersUserIdnr() {
		return (Long) getId();
	}

	@Override
	protected DbmailUsers createInstance() {
		DbmailUsers dbmailUsers = new DbmailUsers();
		return dbmailUsers;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		DbmailAutoNotifications dbmailAutoNotifications = dbmailAutoNotificationsHome
				.getDefinedInstance();
		if (dbmailAutoNotifications != null) {
			getInstance().setDbmailAutoNotifications(dbmailAutoNotifications);
		}
		DbmailAutoReplies dbmailAutoReplies = dbmailAutoRepliesHome
				.getDefinedInstance();
		if (dbmailAutoReplies != null) {
			getInstance().setDbmailAutoReplies(dbmailAutoReplies);
		}
	}

	public boolean isWired() {
		return true;
	}

	public DbmailUsers getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
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
