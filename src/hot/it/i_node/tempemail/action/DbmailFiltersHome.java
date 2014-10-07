package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailFiltersHome")
public class DbmailFiltersHome extends EntityHome<DbmailFilters> {

	@In(create = true)
	DbmailUsersHome dbmailUsersHome;

	public void setDbmailFiltersId(DbmailFiltersId id) {
		setId(id);
	}

	public DbmailFiltersId getDbmailFiltersId() {
		return (DbmailFiltersId) getId();
	}

	public DbmailFiltersHome() {
		setDbmailFiltersId(new DbmailFiltersId());
	}

	@Override
	public boolean isIdDefined() {
		if (getDbmailFiltersId().getId() == 0)
			return false;
		if (getDbmailFiltersId().getUserId() == 0)
			return false;
		return true;
	}

	@Override
	protected DbmailFilters createInstance() {
		DbmailFilters dbmailFilters = new DbmailFilters();
		dbmailFilters.setId(new DbmailFiltersId());
		return dbmailFilters;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		DbmailUsers dbmailUsers = dbmailUsersHome.getDefinedInstance();
		if (dbmailUsers != null) {
			getInstance().setDbmailUsers(dbmailUsers);
		}
	}

	public boolean isWired() {
		if (getInstance().getDbmailUsers() == null)
			return false;
		return true;
	}

	public DbmailFilters getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
