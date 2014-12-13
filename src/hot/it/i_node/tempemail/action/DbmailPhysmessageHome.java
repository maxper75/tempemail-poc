package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailPhysmessageHome")
public class DbmailPhysmessageHome extends EntityHome<DbmailPhysmessage> {

	public void setDbmailPhysmessageId(Long id) {
		setId(id);
	}

	public Long getDbmailPhysmessageId() {
		return (Long) getId();
	}

	@Override
	protected DbmailPhysmessage createInstance() {
		DbmailPhysmessage dbmailPhysmessage = new DbmailPhysmessage();
		return dbmailPhysmessage;
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

	public DbmailPhysmessage getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<DbmailEnvelope> getDbmailEnvelopes() {
		return getInstance() == null ? null : new ArrayList<DbmailEnvelope>(
				getInstance().getDbmailEnvelopes());
	}
	public List<DbmailHeader> getDbmailHeaders() {
		return getInstance() == null ? null : new ArrayList<DbmailHeader>(
				getInstance().getDbmailHeaders());
	}
	public List<DbmailMessageblks> getDbmailMessageblkses() {
		return getInstance() == null ? null : new ArrayList<DbmailMessageblks>(
				getInstance().getDbmailMessageblkses());
	}
	public List<DbmailMessages> getDbmailMessageses() {
		return getInstance() == null ? null : new ArrayList<DbmailMessages>(
				getInstance().getDbmailMessageses());
	}
	public List<DbmailPartlists> getDbmailPartlistses() {
		return getInstance() == null ? null : new ArrayList<DbmailPartlists>(
				getInstance().getDbmailPartlistses());
	}
	public List<DbmailReferencesfield> getDbmailReferencesfields() {
		return getInstance() == null
				? null
				: new ArrayList<DbmailReferencesfield>(getInstance()
						.getDbmailReferencesfields());
	}

}
