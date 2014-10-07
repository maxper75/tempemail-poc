package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailUsermapHome")
public class DbmailUsermapHome extends EntityHome<DbmailUsermap> {

	public void setDbmailUsermapId(DbmailUsermapId id) {
		setId(id);
	}

	public DbmailUsermapId getDbmailUsermapId() {
		return (DbmailUsermapId) getId();
	}

	public DbmailUsermapHome() {
		setDbmailUsermapId(new DbmailUsermapId());
	}

	@Override
	public boolean isIdDefined() {
		if (getDbmailUsermapId().getLogin() == null
				|| "".equals(getDbmailUsermapId().getLogin()))
			return false;
		if (getDbmailUsermapId().getSockAllow() == null
				|| "".equals(getDbmailUsermapId().getSockAllow()))
			return false;
		if (getDbmailUsermapId().getSockDeny() == null
				|| "".equals(getDbmailUsermapId().getSockDeny()))
			return false;
		if (getDbmailUsermapId().getUserid() == null
				|| "".equals(getDbmailUsermapId().getUserid()))
			return false;
		return true;
	}

	@Override
	protected DbmailUsermap createInstance() {
		DbmailUsermap dbmailUsermap = new DbmailUsermap();
		dbmailUsermap.setId(new DbmailUsermapId());
		return dbmailUsermap;
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

	public DbmailUsermap getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
