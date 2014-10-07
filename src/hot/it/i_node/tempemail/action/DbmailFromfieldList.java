package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailFromfieldList")
public class DbmailFromfieldList extends EntityQuery<DbmailFromfield> {

	private static final String EJBQL = "select dbmailFromfield from DbmailFromfield dbmailFromfield";

	private static final String[] RESTRICTIONS = {"lower(dbmailFromfield.id.fromfield) like lower(concat(#{dbmailFromfieldList.dbmailFromfield.id.fromfield},'%'))",};

	private DbmailFromfield dbmailFromfield;

	public DbmailFromfieldList() {
		dbmailFromfield = new DbmailFromfield();
		dbmailFromfield.setId(new DbmailFromfieldId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailFromfield getDbmailFromfield() {
		return dbmailFromfield;
	}
}
