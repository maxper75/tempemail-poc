package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailSubjectfieldList")
public class DbmailSubjectfieldList extends EntityQuery<DbmailSubjectfield> {

	private static final String EJBQL = "select dbmailSubjectfield from DbmailSubjectfield dbmailSubjectfield";

	private static final String[] RESTRICTIONS = {"lower(dbmailSubjectfield.id.subjectfield) like lower(concat(#{dbmailSubjectfieldList.dbmailSubjectfield.id.subjectfield},'%'))",};

	private DbmailSubjectfield dbmailSubjectfield;

	public DbmailSubjectfieldList() {
		dbmailSubjectfield = new DbmailSubjectfield();
		dbmailSubjectfield.setId(new DbmailSubjectfieldId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailSubjectfield getDbmailSubjectfield() {
		return dbmailSubjectfield;
	}
}
