package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import java.util.Date;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailAuthlogHome")
public class DbmailAuthlogHome extends EntityHome<DbmailAuthlog> {

	public void setDbmailAuthlogId(DbmailAuthlogId id) {
		setId(id);
	}

	public DbmailAuthlogId getDbmailAuthlogId() {
		return (DbmailAuthlogId) getId();
	}

	public DbmailAuthlogHome() {
		setDbmailAuthlogId(new DbmailAuthlogId());
	}

	@Override
	public boolean isIdDefined() {
		if (getDbmailAuthlogId().getBytesRx() == 0)
			return false;
		if (getDbmailAuthlogId().getBytesTx() == 0)
			return false;
		if (getDbmailAuthlogId().getDstIp() == null
				|| "".equals(getDbmailAuthlogId().getDstIp()))
			return false;
		if (getDbmailAuthlogId().getDstPort() == null)
			return false;
		if (getDbmailAuthlogId().getId() == null)
			return false;
		if (getDbmailAuthlogId().getLoginTime() == null)
			return false;
		if (getDbmailAuthlogId().getLogoutTime() == null)
			return false;
		if (getDbmailAuthlogId().getService() == null
				|| "".equals(getDbmailAuthlogId().getService()))
			return false;
		if (getDbmailAuthlogId().getSrcIp() == null
				|| "".equals(getDbmailAuthlogId().getSrcIp()))
			return false;
		if (getDbmailAuthlogId().getSrcPort() == null)
			return false;
		if (getDbmailAuthlogId().getStatus() == null
				|| "".equals(getDbmailAuthlogId().getStatus()))
			return false;
		if (getDbmailAuthlogId().getUserid() == null
				|| "".equals(getDbmailAuthlogId().getUserid()))
			return false;
		return true;
	}

	@Override
	protected DbmailAuthlog createInstance() {
		DbmailAuthlog dbmailAuthlog = new DbmailAuthlog();
		dbmailAuthlog.setId(new DbmailAuthlogId());
		return dbmailAuthlog;
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

	public DbmailAuthlog getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
