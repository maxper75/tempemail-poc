package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailHeaderList")
public class DbmailHeaderList extends EntityQuery<DbmailHeader> {

	private static final String EJBQL = "select dbmailHeader from DbmailHeader dbmailHeader";

	private static final String[] RESTRICTIONS = {};

	private DbmailHeader dbmailHeader;

	public DbmailHeaderList() {
		dbmailHeader = new DbmailHeader();
		dbmailHeader.setId(new DbmailHeaderId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailHeader getDbmailHeader() {
		return dbmailHeader;
	}
}
