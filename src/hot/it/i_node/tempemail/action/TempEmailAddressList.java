package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;

import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;

import java.util.Arrays;
import java.util.Arrays;

import org.jboss.seam.annotations.Name;

@Name("tempEmailAddressList")
public class TempEmailAddressList extends EntityQuery<TempEmailAddress> {

	private static final String EJBQL = "select tempEmailAddress from TempEmailAddress tea";
	private static final String[] RESTRICTIONS = {
		"lower(tempEmailAddress.name) like lower(concat(#{tempEmailAddressList.tea.name},'%'))",
		"lower(tempEmailAddress.retentionDays) like lower(concat(#{tempEmailAddressList.tea.retentionDays},'%'))",
		"lower(tempEmailAddress.emailAddress) like lower(concat(#{tempEmailAddressList.tea.emailAddress},'%'))",};
	

private TempEmailAddress tea = new TempEmailAddress();

public TempEmailAddressList() {
	setEjbql(EJBQL);
	setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
	setMaxResults(10);
}

public TempEmailAddress getTempEmailAddress() {
	return tea;
}


}
