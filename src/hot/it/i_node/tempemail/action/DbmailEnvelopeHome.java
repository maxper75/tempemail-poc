package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailEnvelopeHome")
public class DbmailEnvelopeHome extends EntityHome<DbmailEnvelope> {

	@In(create = true)
	DbmailPhysmessageHome dbmailPhysmessageHome;

	public void setDbmailEnvelopeId(Long id) {
		setId(id);
	}

	public Long getDbmailEnvelopeId() {
		return (Long) getId();
	}

	@Override
	protected DbmailEnvelope createInstance() {
		DbmailEnvelope dbmailEnvelope = new DbmailEnvelope();
		return dbmailEnvelope;
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

	public DbmailEnvelope getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
