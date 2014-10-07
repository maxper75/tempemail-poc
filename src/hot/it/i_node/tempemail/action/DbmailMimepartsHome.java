package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailMimepartsHome")
public class DbmailMimepartsHome extends EntityHome<DbmailMimeparts> {

	public void setDbmailMimepartsId(Long id) {
		setId(id);
	}

	public Long getDbmailMimepartsId() {
		return (Long) getId();
	}

	@Override
	protected DbmailMimeparts createInstance() {
		DbmailMimeparts dbmailMimeparts = new DbmailMimeparts();
		return dbmailMimeparts;
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

	public DbmailMimeparts getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<DbmailPartlists> getDbmailPartlistses() {
		return getInstance() == null ? null : new ArrayList<DbmailPartlists>(
				getInstance().getDbmailPartlistses());
	}

}
