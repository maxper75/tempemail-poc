package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

//@Name("tempMailboxList")
public class TempMailboxList extends EntityQuery<TempUser> {

//	private static final String EJBQL = "select tempMailbox from TempMailbox tempMailbox";
//
//	private static final String[] RESTRICTIONS = {"lower(tempMailbox.name) like lower(concat(#{tempMailboxList.tempMailbox.name},'%'))",};
//
//	private TempUser tempMailbox = new TempUser();
//
//	public TempMailboxList() {
//		setEjbql(EJBQL);
//		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
//		setMaxResults(25);
//	}
//
//	public TempUser getTempMailbox() {
//		return tempMailbox;
//	}
}
