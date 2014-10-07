package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailReferencesfieldList")
public class DbmailReferencesfieldList
		extends
			EntityQuery<DbmailReferencesfield> {

	private static final String EJBQL = "select dbmailReferencesfield from DbmailReferencesfield dbmailReferencesfield";

	private static final String[] RESTRICTIONS = {"lower(dbmailReferencesfield.referencesfield) like lower(concat(#{dbmailReferencesfieldList.dbmailReferencesfield.referencesfield},'%'))",};

	private DbmailReferencesfield dbmailReferencesfield = new DbmailReferencesfield();

	public DbmailReferencesfieldList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailReferencesfield getDbmailReferencesfield() {
		return dbmailReferencesfield;
	}
}
