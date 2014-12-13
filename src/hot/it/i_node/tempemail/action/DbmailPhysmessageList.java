package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailPhysmessageList")
public class DbmailPhysmessageList extends EntityQuery<DbmailPhysmessage> {

	private static final String EJBQL = "select dbmailPhysmessage from DbmailPhysmessage dbmailPhysmessage";

	private static final String[] RESTRICTIONS = {};

	private DbmailPhysmessage dbmailPhysmessage = new DbmailPhysmessage();

	public DbmailPhysmessageList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailPhysmessage getDbmailPhysmessage() {
		return dbmailPhysmessage;
	}
}
