package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailAliasesHome")
public class DbmailAliasesHome extends EntityHome<DbmailAliases> {

	public void setDbmailAliasesAliasIdnr(Long id) {
		setId(id);
	}

	public Long getDbmailAliasesAliasIdnr() {
		return (Long) getId();
	}

	@Override
	protected DbmailAliases createInstance() {
		DbmailAliases dbmailAliases = new DbmailAliases();
		dbmailAliases.setAliasType("D");
		return dbmailAliases;
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

	public DbmailAliases getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
