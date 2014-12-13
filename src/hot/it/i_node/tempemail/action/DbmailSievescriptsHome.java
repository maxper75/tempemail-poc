package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailSievescriptsHome")
public class DbmailSievescriptsHome extends EntityHome<DbmailSievescripts> {

	@In(create = true)
	DbmailUsersHome dbmailUsersHome;

	public void setDbmailSievescriptsId(Long id) {
		setId(id);
	}

	public Long getDbmailSievescriptsId() {
		return (Long) getId();
	}

	@Override
	protected DbmailSievescripts createInstance() {
		DbmailSievescripts dbmailSievescripts = new DbmailSievescripts();
		return dbmailSievescripts;
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
		if (getInstance().getDbmailUsers() == null)
			return false;
		return true;
	}

	public DbmailSievescripts getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
