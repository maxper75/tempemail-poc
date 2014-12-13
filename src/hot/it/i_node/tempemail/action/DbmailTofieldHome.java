package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailTofieldHome")
public class DbmailTofieldHome extends EntityHome<DbmailTofield> {

	public void setDbmailTofieldId(DbmailTofieldId id) {
		setId(id);
	}

	public DbmailTofieldId getDbmailTofieldId() {
		return (DbmailTofieldId) getId();
	}

	public DbmailTofieldHome() {
		setDbmailTofieldId(new DbmailTofieldId());
	}

	@Override
	public boolean isIdDefined() {
		if (getDbmailTofieldId().getPhysmessageId() == null)
			return false;
		if (getDbmailTofieldId().getTofield() == null
				|| "".equals(getDbmailTofieldId().getTofield()))
			return false;
		return true;
	}

	@Override
	protected DbmailTofield createInstance() {
		DbmailTofield dbmailTofield = new DbmailTofield();
		dbmailTofield.setId(new DbmailTofieldId());
		return dbmailTofield;
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

	public DbmailTofield getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
