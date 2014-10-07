package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailPartlistsList")
public class DbmailPartlistsList extends EntityQuery<DbmailPartlists> {

	private static final String EJBQL = "select dbmailPartlists from DbmailPartlists dbmailPartlists";

	private static final String[] RESTRICTIONS = {};

	private DbmailPartlists dbmailPartlists;

	public DbmailPartlistsList() {
		dbmailPartlists = new DbmailPartlists();
		dbmailPartlists.setId(new DbmailPartlistsId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailPartlists getDbmailPartlists() {
		return dbmailPartlists;
	}
}
