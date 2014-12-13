package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailUsersList")
public class DbmailUsersList extends EntityQuery<DbmailUsers> {

	private static final String EJBQL = "select dbmailUsers from DbmailUsers dbmailUsers";

	private static final String[] RESTRICTIONS = {
			"lower(dbmailUsers.encryptionType) like lower(concat(#{dbmailUsersList.dbmailUsers.encryptionType},'%'))",
			"lower(dbmailUsers.passwd) like lower(concat(#{dbmailUsersList.dbmailUsers.passwd},'%'))",
			"lower(dbmailUsers.userid) like lower(concat(#{dbmailUsersList.dbmailUsers.userid},'%'))",};

	private DbmailUsers dbmailUsers = new DbmailUsers();

	public DbmailUsersList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailUsers getDbmailUsers() {
		return dbmailUsers;
	}
}
