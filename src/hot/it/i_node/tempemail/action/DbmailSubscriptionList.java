package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailSubscriptionList")
public class DbmailSubscriptionList extends EntityQuery<DbmailSubscription> {

	private static final String EJBQL = "select dbmailSubscription from DbmailSubscription dbmailSubscription";

	private static final String[] RESTRICTIONS = {};

	private DbmailSubscription dbmailSubscription;

	public DbmailSubscriptionList() {
		dbmailSubscription = new DbmailSubscription();
		dbmailSubscription.setId(new DbmailSubscriptionId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailSubscription getDbmailSubscription() {
		return dbmailSubscription;
	}
}
