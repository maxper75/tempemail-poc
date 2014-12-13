package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailAutoNotificationsList")
public class DbmailAutoNotificationsList
		extends
			EntityQuery<DbmailAutoNotifications> {

	private static final String EJBQL = "select dbmailAutoNotifications from DbmailAutoNotifications dbmailAutoNotifications";

	private static final String[] RESTRICTIONS = {"lower(dbmailAutoNotifications.notifyAddress) like lower(concat(#{dbmailAutoNotificationsList.dbmailAutoNotifications.notifyAddress},'%'))",};

	private DbmailAutoNotifications dbmailAutoNotifications = new DbmailAutoNotifications();

	public DbmailAutoNotificationsList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailAutoNotifications getDbmailAutoNotifications() {
		return dbmailAutoNotifications;
	}
}
