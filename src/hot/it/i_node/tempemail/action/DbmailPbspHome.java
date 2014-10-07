package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailPbspHome")
public class DbmailPbspHome extends EntityHome<DbmailPbsp> {

	public void setDbmailPbspIdnr(Long id) {
		setId(id);
	}

	public Long getDbmailPbspIdnr() {
		return (Long) getId();
	}

	@Override
	protected DbmailPbsp createInstance() {
		DbmailPbsp dbmailPbsp = new DbmailPbsp();
		return dbmailPbsp;
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

	public DbmailPbsp getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
