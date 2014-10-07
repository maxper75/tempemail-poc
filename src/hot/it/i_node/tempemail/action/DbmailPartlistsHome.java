package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailPartlistsHome")
public class DbmailPartlistsHome extends EntityHome<DbmailPartlists> {

	@In(create = true)
	DbmailMimepartsHome dbmailMimepartsHome;
	@In(create = true)
	DbmailPhysmessageHome dbmailPhysmessageHome;

	public void setDbmailPartlistsId(DbmailPartlistsId id) {
		setId(id);
	}

	public DbmailPartlistsId getDbmailPartlistsId() {
		return (DbmailPartlistsId) getId();
	}

	public DbmailPartlistsHome() {
		setDbmailPartlistsId(new DbmailPartlistsId());
	}

	@Override
	public boolean isIdDefined() {
		if (getDbmailPartlistsId().getIsHeader() == 0)
			return false;
		if (getDbmailPartlistsId().getPartDepth() == 0)
			return false;
		if (getDbmailPartlistsId().getPartId() == 0)
			return false;
		if (getDbmailPartlistsId().getPartKey() == 0)
			return false;
		if (getDbmailPartlistsId().getPartOrder() == 0)
			return false;
		if (getDbmailPartlistsId().getPhysmessageId() == 0)
			return false;
		return true;
	}

	@Override
	protected DbmailPartlists createInstance() {
		DbmailPartlists dbmailPartlists = new DbmailPartlists();
		dbmailPartlists.setId(new DbmailPartlistsId());
		return dbmailPartlists;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		DbmailMimeparts dbmailMimeparts = dbmailMimepartsHome
				.getDefinedInstance();
		if (dbmailMimeparts != null) {
			getInstance().setDbmailMimeparts(dbmailMimeparts);
		}
		DbmailPhysmessage dbmailPhysmessage = dbmailPhysmessageHome
				.getDefinedInstance();
		if (dbmailPhysmessage != null) {
			getInstance().setDbmailPhysmessage(dbmailPhysmessage);
		}
	}

	public boolean isWired() {
		if (getInstance().getDbmailMimeparts() == null)
			return false;
		if (getInstance().getDbmailPhysmessage() == null)
			return false;
		return true;
	}

	public DbmailPartlists getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
