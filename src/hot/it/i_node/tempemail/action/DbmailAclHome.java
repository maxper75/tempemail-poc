package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailAclHome")
public class DbmailAclHome extends EntityHome<DbmailAcl> {

	@In(create = true)
	DbmailMailboxesHome dbmailMailboxesHome;
	@In(create = true)
	DbmailUsersHome dbmailUsersHome;

	public void setDbmailAclId(DbmailAclId id) {
		setId(id);
	}

	public DbmailAclId getDbmailAclId() {
		return (DbmailAclId) getId();
	}

	public DbmailAclHome() {
		setDbmailAclId(new DbmailAclId());
	}

	@Override
	public boolean isIdDefined() {
		if (getDbmailAclId().getMailboxId() == 0)
			return false;
		if (getDbmailAclId().getUserId() == 0)
			return false;
		return true;
	}

	@Override
	protected DbmailAcl createInstance() {
		DbmailAcl dbmailAcl = new DbmailAcl();
		dbmailAcl.setId(new DbmailAclId());
		return dbmailAcl;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		DbmailMailboxes dbmailMailboxes = dbmailMailboxesHome
				.getDefinedInstance();
		if (dbmailMailboxes != null) {
			getInstance().setDbmailMailboxes(dbmailMailboxes);
		}
		DbmailUsers dbmailUsers = dbmailUsersHome.getDefinedInstance();
		if (dbmailUsers != null) {
			getInstance().setDbmailUsers(dbmailUsers);
		}
	}

	public boolean isWired() {
		if (getInstance().getDbmailMailboxes() == null)
			return false;
		if (getInstance().getDbmailUsers() == null)
			return false;
		return true;
	}

	public DbmailAcl getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
