package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailHeaderHome")
public class DbmailHeaderHome extends EntityHome<DbmailHeader> {

	@In(create = true)
	DbmailHeadernameHome dbmailHeadernameHome;
	@In(create = true)
	DbmailHeadervalueHome dbmailHeadervalueHome;
	@In(create = true)
	DbmailPhysmessageHome dbmailPhysmessageHome;

	public void setDbmailHeaderId(DbmailHeaderId id) {
		setId(id);
	}

	public DbmailHeaderId getDbmailHeaderId() {
		return (DbmailHeaderId) getId();
	}

	public DbmailHeaderHome() {
		setDbmailHeaderId(new DbmailHeaderId());
	}

	@Override
	public boolean isIdDefined() {
		if (getDbmailHeaderId().getHeadernameId() == 0)
			return false;
		if (getDbmailHeaderId().getHeadervalueId() == 0)
			return false;
		if (getDbmailHeaderId().getPhysmessageId() == 0)
			return false;
		return true;
	}

	@Override
	protected DbmailHeader createInstance() {
		DbmailHeader dbmailHeader = new DbmailHeader();
		dbmailHeader.setId(new DbmailHeaderId());
		return dbmailHeader;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		DbmailHeadername dbmailHeadername = dbmailHeadernameHome
				.getDefinedInstance();
		if (dbmailHeadername != null) {
			getInstance().setDbmailHeadername(dbmailHeadername);
		}
		DbmailHeadervalue dbmailHeadervalue = dbmailHeadervalueHome
				.getDefinedInstance();
		if (dbmailHeadervalue != null) {
			getInstance().setDbmailHeadervalue(dbmailHeadervalue);
		}
		DbmailPhysmessage dbmailPhysmessage = dbmailPhysmessageHome
				.getDefinedInstance();
		if (dbmailPhysmessage != null) {
			getInstance().setDbmailPhysmessage(dbmailPhysmessage);
		}
	}

	public boolean isWired() {
		if (getInstance().getDbmailHeadername() == null)
			return false;
		if (getInstance().getDbmailHeadervalue() == null)
			return false;
		if (getInstance().getDbmailPhysmessage() == null)
			return false;
		return true;
	}

	public DbmailHeader getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
