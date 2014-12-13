package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailAuthlogList")
public class DbmailAuthlogList extends EntityQuery<DbmailAuthlog> {

	private static final String EJBQL = "select dbmailAuthlog from DbmailAuthlog dbmailAuthlog";

	private static final String[] RESTRICTIONS = {
			"lower(dbmailAuthlog.id.dstIp) like lower(concat(#{dbmailAuthlogList.dbmailAuthlog.id.dstIp},'%'))",
			"lower(dbmailAuthlog.id.service) like lower(concat(#{dbmailAuthlogList.dbmailAuthlog.id.service},'%'))",
			"lower(dbmailAuthlog.id.srcIp) like lower(concat(#{dbmailAuthlogList.dbmailAuthlog.id.srcIp},'%'))",
			"lower(dbmailAuthlog.id.status) like lower(concat(#{dbmailAuthlogList.dbmailAuthlog.id.status},'%'))",
			"lower(dbmailAuthlog.id.userid) like lower(concat(#{dbmailAuthlogList.dbmailAuthlog.id.userid},'%'))",};

	private DbmailAuthlog dbmailAuthlog;

	public DbmailAuthlogList() {
		dbmailAuthlog = new DbmailAuthlog();
		dbmailAuthlog.setId(new DbmailAuthlogId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailAuthlog getDbmailAuthlog() {
		return dbmailAuthlog;
	}
}
