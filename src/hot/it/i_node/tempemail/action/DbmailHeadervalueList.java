package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailHeadervalueList")
public class DbmailHeadervalueList extends EntityQuery<DbmailHeadervalue> {

	private static final String EJBQL = "select dbmailHeadervalue from DbmailHeadervalue dbmailHeadervalue";

	private static final String[] RESTRICTIONS = {
			"lower(dbmailHeadervalue.hash) like lower(concat(#{dbmailHeadervalueList.dbmailHeadervalue.hash},'%'))",
			"lower(dbmailHeadervalue.headervalue) like lower(concat(#{dbmailHeadervalueList.dbmailHeadervalue.headervalue},'%'))",
			"lower(dbmailHeadervalue.sortfield) like lower(concat(#{dbmailHeadervalueList.dbmailHeadervalue.sortfield},'%'))",};

	private DbmailHeadervalue dbmailHeadervalue = new DbmailHeadervalue();

	public DbmailHeadervalueList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailHeadervalue getDbmailHeadervalue() {
		return dbmailHeadervalue;
	}
}
