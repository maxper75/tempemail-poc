package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailMimepartsList")
public class DbmailMimepartsList extends EntityQuery<DbmailMimeparts> {

	private static final String EJBQL = "select dbmailMimeparts from DbmailMimeparts dbmailMimeparts";

	private static final String[] RESTRICTIONS = {"lower(dbmailMimeparts.hash) like lower(concat(#{dbmailMimepartsList.dbmailMimeparts.hash},'%'))",};

	private DbmailMimeparts dbmailMimeparts = new DbmailMimeparts();

	public DbmailMimepartsList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailMimeparts getDbmailMimeparts() {
		return dbmailMimeparts;
	}
}
