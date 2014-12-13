package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailTofieldList")
public class DbmailTofieldList extends EntityQuery<DbmailTofield> {

	private static final String EJBQL = "select dbmailTofield from DbmailTofield dbmailTofield";

	private static final String[] RESTRICTIONS = {"lower(dbmailTofield.id.tofield) like lower(concat(#{dbmailTofieldList.dbmailTofield.id.tofield},'%'))",};

	private DbmailTofield dbmailTofield;

	public DbmailTofieldList() {
		dbmailTofield = new DbmailTofield();
		dbmailTofield.setId(new DbmailTofieldId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailTofield getDbmailTofield() {
		return dbmailTofield;
	}
}
