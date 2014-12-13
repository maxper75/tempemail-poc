package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailAutoNotificationsHome")
public class DbmailAutoNotificationsHome
		extends
			EntityHome<DbmailAutoNotifications> {

	@In(create = true)
	DbmailUsersHome dbmailUsersHome;

	public void setDbmailAutoNotificationsUserIdnr(Long id) {
		setId(id);
	}

	public Long getDbmailAutoNotificationsUserIdnr() {
		return (Long) getId();
	}

	@Override
	protected DbmailAutoNotifications createInstance() {
		DbmailAutoNotifications dbmailAutoNotifications = new DbmailAutoNotifications();
		return dbmailAutoNotifications;
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

	public DbmailAutoNotifications getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
