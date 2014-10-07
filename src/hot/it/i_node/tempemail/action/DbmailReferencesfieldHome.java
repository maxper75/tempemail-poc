package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailReferencesfieldHome")
public class DbmailReferencesfieldHome
		extends
			EntityHome<DbmailReferencesfield> {

	@In(create = true)
	DbmailPhysmessageHome dbmailPhysmessageHome;

	public void setDbmailReferencesfieldId(Long id) {
		setId(id);
	}

	public Long getDbmailReferencesfieldId() {
		return (Long) getId();
	}

	@Override
	protected DbmailReferencesfield createInstance() {
		DbmailReferencesfield dbmailReferencesfield = new DbmailReferencesfield();
		return dbmailReferencesfield;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		DbmailPhysmessage dbmailPhysmessage = dbmailPhysmessageHome
				.getDefinedInstance();
		if (dbmailPhysmessage != null) {
			getInstance().setDbmailPhysmessage(dbmailPhysmessage);
		}
	}

	public boolean isWired() {
		if (getInstance().getDbmailPhysmessage() == null)
			return false;
		return true;
	}

	public DbmailReferencesfield getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
