package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailMessagesHome")
public class DbmailMessagesHome extends EntityHome<DbmailMessages> {

	@In(create = true)
	DbmailMailboxesHome dbmailMailboxesHome;
	@In(create = true)
	DbmailPhysmessageHome dbmailPhysmessageHome;

	public void setDbmailMessagesMessageIdnr(Long id) {
		setId(id);
	}

	public Long getDbmailMessagesMessageIdnr() {
		return (Long) getId();
	}

	@Override
	protected DbmailMessages createInstance() {
		DbmailMessages dbmailMessages = new DbmailMessages();
		return dbmailMessages;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		DbmailMailboxes dbmailMailboxes = dbmailMailboxesHome
				.getDefinedInstance();
		if (dbmailMailboxes != null) {
			getInstance().setDbmailMailboxes(dbmailMailboxes);
		}
		DbmailPhysmessage dbmailPhysmessage = dbmailPhysmessageHome
				.getDefinedInstance();
		if (dbmailPhysmessage != null) {
			getInstance().setDbmailPhysmessage(dbmailPhysmessage);
		}
	}

	public boolean isWired() {
		return true;
	}

	public DbmailMessages getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<DbmailKeywords> getDbmailKeywordses() {
		return getInstance() == null ? null : new ArrayList<DbmailKeywords>(
				getInstance().getDbmailKeywordses());
	}

}
