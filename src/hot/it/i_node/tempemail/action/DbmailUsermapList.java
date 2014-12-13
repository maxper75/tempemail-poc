package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailUsermapList")
public class DbmailUsermapList extends EntityQuery<DbmailUsermap> {

	private static final String EJBQL = "select dbmailUsermap from DbmailUsermap dbmailUsermap";

	private static final String[] RESTRICTIONS = {
			"lower(dbmailUsermap.id.login) like lower(concat(#{dbmailUsermapList.dbmailUsermap.id.login},'%'))",
			"lower(dbmailUsermap.id.sockAllow) like lower(concat(#{dbmailUsermapList.dbmailUsermap.id.sockAllow},'%'))",
			"lower(dbmailUsermap.id.sockDeny) like lower(concat(#{dbmailUsermapList.dbmailUsermap.id.sockDeny},'%'))",
			"lower(dbmailUsermap.id.userid) like lower(concat(#{dbmailUsermapList.dbmailUsermap.id.userid},'%'))",};

	private DbmailUsermap dbmailUsermap;

	public DbmailUsermapList() {
		dbmailUsermap = new DbmailUsermap();
		dbmailUsermap.setId(new DbmailUsermapId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailUsermap getDbmailUsermap() {
		return dbmailUsermap;
	}
}
