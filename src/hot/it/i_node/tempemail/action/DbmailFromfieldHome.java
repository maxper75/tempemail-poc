package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailFromfieldHome")
public class DbmailFromfieldHome extends EntityHome<DbmailFromfield> {

	public void setDbmailFromfieldId(DbmailFromfieldId id) {
		setId(id);
	}

	public DbmailFromfieldId getDbmailFromfieldId() {
		return (DbmailFromfieldId) getId();
	}

	public DbmailFromfieldHome() {
		setDbmailFromfieldId(new DbmailFromfieldId());
	}

	@Override
	public boolean isIdDefined() {
		if (getDbmailFromfieldId().getFromfield() == null
				|| "".equals(getDbmailFromfieldId().getFromfield()))
			return false;
		if (getDbmailFromfieldId().getPhysmessageId() == null)
			return false;
		return true;
	}

	@Override
	protected DbmailFromfield createInstance() {
		DbmailFromfield dbmailFromfield = new DbmailFromfield();
		dbmailFromfield.setId(new DbmailFromfieldId());
		return dbmailFromfield;
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

	public DbmailFromfield getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
