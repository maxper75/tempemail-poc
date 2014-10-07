package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailMailboxesList")
public class DbmailMailboxesList extends EntityQuery<DbmailMailboxes> {

	private static final String EJBQL = "select dbmailMailboxes from DbmailMailboxes dbmailMailboxes";

	private static final String[] RESTRICTIONS = {"lower(dbmailMailboxes.name) like lower(concat(#{dbmailMailboxesList.dbmailMailboxes.name},'%'))",};

	private DbmailMailboxes dbmailMailboxes = new DbmailMailboxes();

	public DbmailMailboxesList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailMailboxes getDbmailMailboxes() {
		return dbmailMailboxes;
	}
}
