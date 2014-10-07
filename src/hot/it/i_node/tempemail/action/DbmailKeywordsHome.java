package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailKeywordsHome")
public class DbmailKeywordsHome extends EntityHome<DbmailKeywords> {

	@In(create = true)
	DbmailMessagesHome dbmailMessagesHome;

	public void setDbmailKeywordsId(DbmailKeywordsId id) {
		setId(id);
	}

	public DbmailKeywordsId getDbmailKeywordsId() {
		return (DbmailKeywordsId) getId();
	}

	public DbmailKeywordsHome() {
		setDbmailKeywordsId(new DbmailKeywordsId());
	}

	@Override
	public boolean isIdDefined() {
		if (getDbmailKeywordsId().getKeyword() == null
				|| "".equals(getDbmailKeywordsId().getKeyword()))
			return false;
		if (getDbmailKeywordsId().getMessageIdnr() == 0)
			return false;
		return true;
	}

	@Override
	protected DbmailKeywords createInstance() {
		DbmailKeywords dbmailKeywords = new DbmailKeywords();
		dbmailKeywords.setId(new DbmailKeywordsId());
		return dbmailKeywords;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		DbmailMessages dbmailMessages = dbmailMessagesHome.getDefinedInstance();
		if (dbmailMessages != null) {
			getInstance().setDbmailMessages(dbmailMessages);
		}
	}

	public boolean isWired() {
		if (getInstance().getDbmailMessages() == null)
			return false;
		return true;
	}

	public DbmailKeywords getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
