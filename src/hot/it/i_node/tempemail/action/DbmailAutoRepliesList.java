package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailAutoRepliesList")
public class DbmailAutoRepliesList extends EntityQuery<DbmailAutoReplies> {

	private static final String EJBQL = "select dbmailAutoReplies from DbmailAutoReplies dbmailAutoReplies";

	private static final String[] RESTRICTIONS = {"lower(dbmailAutoReplies.replyBody) like lower(concat(#{dbmailAutoRepliesList.dbmailAutoReplies.replyBody},'%'))",};

	private DbmailAutoReplies dbmailAutoReplies = new DbmailAutoReplies();

	public DbmailAutoRepliesList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailAutoReplies getDbmailAutoReplies() {
		return dbmailAutoReplies;
	}
}
