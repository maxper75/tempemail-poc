package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailKeywordsList")
public class DbmailKeywordsList extends EntityQuery<DbmailKeywords> {

	private static final String EJBQL = "select dbmailKeywords from DbmailKeywords dbmailKeywords";

	private static final String[] RESTRICTIONS = {"lower(dbmailKeywords.id.keyword) like lower(concat(#{dbmailKeywordsList.dbmailKeywords.id.keyword},'%'))",};

	private DbmailKeywords dbmailKeywords;

	public DbmailKeywordsList() {
		dbmailKeywords = new DbmailKeywords();
		dbmailKeywords.setId(new DbmailKeywordsId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailKeywords getDbmailKeywords() {
		return dbmailKeywords;
	}
}
