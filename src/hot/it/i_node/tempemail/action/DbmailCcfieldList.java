package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailCcfieldList")
public class DbmailCcfieldList extends EntityQuery<DbmailCcfield> {

	private static final String EJBQL = "select dbmailCcfield from DbmailCcfield dbmailCcfield";

	private static final String[] RESTRICTIONS = {"lower(dbmailCcfield.id.ccfield) like lower(concat(#{dbmailCcfieldList.dbmailCcfield.id.ccfield},'%'))",};

	private DbmailCcfield dbmailCcfield;

	public DbmailCcfieldList() {
		dbmailCcfield = new DbmailCcfield();
		dbmailCcfield.setId(new DbmailCcfieldId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailCcfield getDbmailCcfield() {
		return dbmailCcfield;
	}
}
