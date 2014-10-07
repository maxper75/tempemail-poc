package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailAclList")
public class DbmailAclList extends EntityQuery<DbmailAcl> {

	private static final String EJBQL = "select dbmailAcl from DbmailAcl dbmailAcl";

	private static final String[] RESTRICTIONS = {};

	private DbmailAcl dbmailAcl;

	public DbmailAclList() {
		dbmailAcl = new DbmailAcl();
		dbmailAcl.setId(new DbmailAclId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailAcl getDbmailAcl() {
		return dbmailAcl;
	}
}
