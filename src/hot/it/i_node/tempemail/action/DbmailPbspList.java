package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailPbspList")
public class DbmailPbspList extends EntityQuery<DbmailPbsp> {

	private static final String EJBQL = "select dbmailPbsp from DbmailPbsp dbmailPbsp";

	private static final String[] RESTRICTIONS = {};

	private DbmailPbsp dbmailPbsp = new DbmailPbsp();

	public DbmailPbspList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailPbsp getDbmailPbsp() {
		return dbmailPbsp;
	}
}
