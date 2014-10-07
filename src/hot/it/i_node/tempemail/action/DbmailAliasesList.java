package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailAliasesList")
public class DbmailAliasesList extends EntityQuery<DbmailAliases> {

	private static final String EJBQL = "select dbmailAliases from DbmailAliases dbmailAliases";

	private static final String[] RESTRICTIONS = {
			"lower(dbmailAliases.alias) like lower(concat(#{dbmailAliasesList.dbmailAliases.alias},'%'))",
			"lower(dbmailAliases.deliverTo) like lower(concat(#{dbmailAliasesList.dbmailAliases.deliverTo},'%'))",};

	private DbmailAliases dbmailAliases = new DbmailAliases();

	public DbmailAliasesList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailAliases getDbmailAliases() {
		return dbmailAliases;
	}
}
