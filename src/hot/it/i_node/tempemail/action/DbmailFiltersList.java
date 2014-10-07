package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailFiltersList")
public class DbmailFiltersList extends EntityQuery<DbmailFilters> {

	private static final String EJBQL = "select dbmailFilters from DbmailFilters dbmailFilters";

	private static final String[] RESTRICTIONS = {
			"lower(dbmailFilters.headername) like lower(concat(#{dbmailFiltersList.dbmailFilters.headername},'%'))",
			"lower(dbmailFilters.headervalue) like lower(concat(#{dbmailFiltersList.dbmailFilters.headervalue},'%'))",
			"lower(dbmailFilters.mailbox) like lower(concat(#{dbmailFiltersList.dbmailFilters.mailbox},'%'))",};

	private DbmailFilters dbmailFilters;

	public DbmailFiltersList() {
		dbmailFilters = new DbmailFilters();
		dbmailFilters.setId(new DbmailFiltersId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailFilters getDbmailFilters() {
		return dbmailFilters;
	}
}
