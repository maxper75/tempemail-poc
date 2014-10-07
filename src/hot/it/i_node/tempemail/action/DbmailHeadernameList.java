package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailHeadernameList")
public class DbmailHeadernameList extends EntityQuery<DbmailHeadername> {

	private static final String EJBQL = "select dbmailHeadername from DbmailHeadername dbmailHeadername";

	private static final String[] RESTRICTIONS = {"lower(dbmailHeadername.headername) like lower(concat(#{dbmailHeadernameList.dbmailHeadername.headername},'%'))",};

	private DbmailHeadername dbmailHeadername = new DbmailHeadername();

	public DbmailHeadernameList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailHeadername getDbmailHeadername() {
		return dbmailHeadername;
	}
}
