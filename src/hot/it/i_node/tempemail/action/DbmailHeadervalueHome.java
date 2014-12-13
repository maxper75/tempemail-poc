package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailHeadervalueHome")
public class DbmailHeadervalueHome extends EntityHome<DbmailHeadervalue> {

	public void setDbmailHeadervalueId(Long id) {
		setId(id);
	}

	public Long getDbmailHeadervalueId() {
		return (Long) getId();
	}

	@Override
	protected DbmailHeadervalue createInstance() {
		DbmailHeadervalue dbmailHeadervalue = new DbmailHeadervalue();
		return dbmailHeadervalue;
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

	public DbmailHeadervalue getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<DbmailHeader> getDbmailHeaders() {
		return getInstance() == null ? null : new ArrayList<DbmailHeader>(
				getInstance().getDbmailHeaders());
	}

}
