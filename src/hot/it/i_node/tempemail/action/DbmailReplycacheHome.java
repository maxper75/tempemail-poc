package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import java.util.Date;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailReplycacheHome")
public class DbmailReplycacheHome extends EntityHome<DbmailReplycache> {

	public void setDbmailReplycacheId(DbmailReplycacheId id) {
		setId(id);
	}

	public DbmailReplycacheId getDbmailReplycacheId() {
		return (DbmailReplycacheId) getId();
	}

	public DbmailReplycacheHome() {
		setDbmailReplycacheId(new DbmailReplycacheId());
	}

	@Override
	public boolean isIdDefined() {
		if (getDbmailReplycacheId().getFromAddr() == null
				|| "".equals(getDbmailReplycacheId().getFromAddr()))
			return false;
		if (getDbmailReplycacheId().getHandle() == null
				|| "".equals(getDbmailReplycacheId().getHandle()))
			return false;
		if (getDbmailReplycacheId().getLastseen() == null)
			return false;
		if (getDbmailReplycacheId().getToAddr() == null
				|| "".equals(getDbmailReplycacheId().getToAddr()))
			return false;
		return true;
	}

	@Override
	protected DbmailReplycache createInstance() {
		DbmailReplycache dbmailReplycache = new DbmailReplycache();
		dbmailReplycache.setId(new DbmailReplycacheId());
		return dbmailReplycache;
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

	public DbmailReplycache getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
