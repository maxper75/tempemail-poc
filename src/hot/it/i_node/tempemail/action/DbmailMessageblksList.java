package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailMessageblksList")
public class DbmailMessageblksList extends EntityQuery<DbmailMessageblks> {

	private static final String EJBQL = "select dbmailMessageblks from DbmailMessageblks dbmailMessageblks";

	private static final String[] RESTRICTIONS = {};

	private DbmailMessageblks dbmailMessageblks = new DbmailMessageblks();

	public DbmailMessageblksList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailMessageblks getDbmailMessageblks() {
		return dbmailMessageblks;
	}
}
