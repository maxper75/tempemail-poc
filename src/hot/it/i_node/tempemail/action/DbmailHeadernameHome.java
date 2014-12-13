package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailHeadernameHome")
public class DbmailHeadernameHome extends EntityHome<DbmailHeadername> {

	public void setDbmailHeadernameId(Long id) {
		setId(id);
	}

	public Long getDbmailHeadernameId() {
		return (Long) getId();
	}

	@Override
	protected DbmailHeadername createInstance() {
		DbmailHeadername dbmailHeadername = new DbmailHeadername();
		return dbmailHeadername;
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

	public DbmailHeadername getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<DbmailHeader> getDbmailHeaders() {
		return getInstance() == null ? null : new ArrayList<DbmailHeader>(
				getInstance().getDbmailHeaders());
	}

}
