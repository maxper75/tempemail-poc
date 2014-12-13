package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailReplycacheList")
public class DbmailReplycacheList extends EntityQuery<DbmailReplycache> {

	private static final String EJBQL = "select dbmailReplycache from DbmailReplycache dbmailReplycache";

	private static final String[] RESTRICTIONS = {
			"lower(dbmailReplycache.id.fromAddr) like lower(concat(#{dbmailReplycacheList.dbmailReplycache.id.fromAddr},'%'))",
			"lower(dbmailReplycache.id.handle) like lower(concat(#{dbmailReplycacheList.dbmailReplycache.id.handle},'%'))",
			"lower(dbmailReplycache.id.toAddr) like lower(concat(#{dbmailReplycacheList.dbmailReplycache.id.toAddr},'%'))",};

	private DbmailReplycache dbmailReplycache;

	public DbmailReplycacheList() {
		dbmailReplycache = new DbmailReplycache();
		dbmailReplycache.setId(new DbmailReplycacheId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailReplycache getDbmailReplycache() {
		return dbmailReplycache;
	}
}
