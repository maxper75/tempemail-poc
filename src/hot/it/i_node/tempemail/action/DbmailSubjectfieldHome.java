package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailSubjectfieldHome")
public class DbmailSubjectfieldHome extends EntityHome<DbmailSubjectfield> {

	public void setDbmailSubjectfieldId(DbmailSubjectfieldId id) {
		setId(id);
	}

	public DbmailSubjectfieldId getDbmailSubjectfieldId() {
		return (DbmailSubjectfieldId) getId();
	}

	public DbmailSubjectfieldHome() {
		setDbmailSubjectfieldId(new DbmailSubjectfieldId());
	}

	@Override
	public boolean isIdDefined() {
		if (getDbmailSubjectfieldId().getPhysmessageId() == null)
			return false;
		if (getDbmailSubjectfieldId().getSubjectfield() == null
				|| "".equals(getDbmailSubjectfieldId().getSubjectfield()))
			return false;
		return true;
	}

	@Override
	protected DbmailSubjectfield createInstance() {
		DbmailSubjectfield dbmailSubjectfield = new DbmailSubjectfield();
		dbmailSubjectfield.setId(new DbmailSubjectfieldId());
		return dbmailSubjectfield;
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

	public DbmailSubjectfield getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
