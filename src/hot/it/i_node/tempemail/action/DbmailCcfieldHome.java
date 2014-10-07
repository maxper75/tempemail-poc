package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailCcfieldHome")
public class DbmailCcfieldHome extends EntityHome<DbmailCcfield> {

	public void setDbmailCcfieldId(DbmailCcfieldId id) {
		setId(id);
	}

	public DbmailCcfieldId getDbmailCcfieldId() {
		return (DbmailCcfieldId) getId();
	}

	public DbmailCcfieldHome() {
		setDbmailCcfieldId(new DbmailCcfieldId());
	}

	@Override
	public boolean isIdDefined() {
		if (getDbmailCcfieldId().getCcfield() == null
				|| "".equals(getDbmailCcfieldId().getCcfield()))
			return false;
		if (getDbmailCcfieldId().getPhysmessageId() == null)
			return false;
		return true;
	}

	@Override
	protected DbmailCcfield createInstance() {
		DbmailCcfield dbmailCcfield = new DbmailCcfield();
		dbmailCcfield.setId(new DbmailCcfieldId());
		return dbmailCcfield;
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

	public DbmailCcfield getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
