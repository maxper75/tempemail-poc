package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailMessagesList")
public class DbmailMessagesList extends EntityQuery<DbmailMessages> {

	private static final String EJBQL = "select dbmailMessages from DbmailMessages dbmailMessages";

	private static final String[] RESTRICTIONS = {"lower(dbmailMessages.uniqueId) like lower(concat(#{dbmailMessagesList.dbmailMessages.uniqueId},'%'))",};

	private DbmailMessages dbmailMessages = new DbmailMessages();

	public DbmailMessagesList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailMessages getDbmailMessages() {
		return dbmailMessages;
	}
}
