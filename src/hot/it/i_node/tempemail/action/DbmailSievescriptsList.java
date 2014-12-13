package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailSievescriptsList")
public class DbmailSievescriptsList extends EntityQuery<DbmailSievescripts> {

	private static final String EJBQL = "select dbmailSievescripts from DbmailSievescripts dbmailSievescripts";

	private static final String[] RESTRICTIONS = {
			"lower(dbmailSievescripts.name) like lower(concat(#{dbmailSievescriptsList.dbmailSievescripts.name},'%'))",
			"lower(dbmailSievescripts.script) like lower(concat(#{dbmailSievescriptsList.dbmailSievescripts.script},'%'))",};

	private DbmailSievescripts dbmailSievescripts = new DbmailSievescripts();

	public DbmailSievescriptsList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailSievescripts getDbmailSievescripts() {
		return dbmailSievescripts;
	}
}
