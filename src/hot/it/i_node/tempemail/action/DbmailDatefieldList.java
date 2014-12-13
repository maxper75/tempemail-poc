package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailDatefieldList")
public class DbmailDatefieldList extends EntityQuery<DbmailDatefield> {

	private static final String EJBQL = "select dbmailDatefield from DbmailDatefield dbmailDatefield";

	private static final String[] RESTRICTIONS = {"lower(dbmailDatefield.id.sortfield) like lower(concat(#{dbmailDatefieldList.dbmailDatefield.id.sortfield},'%'))",};

	private DbmailDatefield dbmailDatefield;

	public DbmailDatefieldList() {
		dbmailDatefield = new DbmailDatefield();
		dbmailDatefield.setId(new DbmailDatefieldId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailDatefield getDbmailDatefield() {
		return dbmailDatefield;
	}
}
