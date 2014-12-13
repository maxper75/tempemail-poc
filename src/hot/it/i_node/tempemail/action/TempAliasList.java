package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("tempAliasList")
public class TempAliasList extends EntityQuery<TempAlias> {

	private static final String EJBQL = "select tempAlias from TempAlias tempAlias";

	private static final String[] RESTRICTIONS = {
			"lower(tempAlias.alias) like lower(concat(#{tempAliasList.tempAlias.alias},'%'))",
			"lower(tempAlias.deliverTo) like lower(concat(#{tempAliasList.tempAlias.deliverTo},'%'))",};

	private TempAlias tempAlias = new TempAlias();

	public TempAliasList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public DbmailAliases getTempAlias() {
		return tempAlias;
	}
}
