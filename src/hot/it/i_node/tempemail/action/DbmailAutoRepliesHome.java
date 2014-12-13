package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailAutoRepliesHome")
public class DbmailAutoRepliesHome extends EntityHome<DbmailAutoReplies> {

	@In(create = true)
	DbmailUsersHome dbmailUsersHome;

	public void setDbmailAutoRepliesUserIdnr(Long id) {
		setId(id);
	}

	public Long getDbmailAutoRepliesUserIdnr() {
		return (Long) getId();
	}

	@Override
	protected DbmailAutoReplies createInstance() {
		DbmailAutoReplies dbmailAutoReplies = new DbmailAutoReplies();
		return dbmailAutoReplies;
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

	public DbmailAutoReplies getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
