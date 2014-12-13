package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import java.util.Date;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailDatefieldHome")
public class DbmailDatefieldHome extends EntityHome<DbmailDatefield> {

	public void setDbmailDatefieldId(DbmailDatefieldId id) {
		setId(id);
	}

	public DbmailDatefieldId getDbmailDatefieldId() {
		return (DbmailDatefieldId) getId();
	}

	public DbmailDatefieldHome() {
		setDbmailDatefieldId(new DbmailDatefieldId());
	}

	@Override
	public boolean isIdDefined() {
		if (getDbmailDatefieldId().getDatefield() == null)
			return false;
		if (getDbmailDatefieldId().getPhysmessageId() == null)
			return false;
		if (getDbmailDatefieldId().getSortfield() == null
				|| "".equals(getDbmailDatefieldId().getSortfield()))
			return false;
		return true;
	}

	@Override
	protected DbmailDatefield createInstance() {
		DbmailDatefield dbmailDatefield = new DbmailDatefield();
		dbmailDatefield.setId(new DbmailDatefieldId());
		return dbmailDatefield;
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

	public DbmailDatefield getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
