package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("dbmailEnvelopeList")
public class DbmailEnvelopeList extends EntityQuery<DbmailEnvelope> {

	private static final String EJBQL = "select dbmailEnvelope from DbmailEnvelope dbmailEnvelope";

	private static final String[] RESTRICTIONS = {"lower(dbmailEnvelope.envelope) like lower(concat(#{dbmailEnvelopeList.dbmailEnvelope.envelope},'%'))",};

	private DbmailEnvelope dbmailEnvelope = new DbmailEnvelope();

	public DbmailEnvelopeList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailEnvelope getDbmailEnvelope() {
		return dbmailEnvelope;
	}
}
