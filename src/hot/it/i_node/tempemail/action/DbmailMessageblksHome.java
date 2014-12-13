package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("dbmailMessageblksHome")
public class DbmailMessageblksHome extends EntityHome<DbmailMessageblks> {

	@In(create = true)
	DbmailPhysmessageHome dbmailPhysmessageHome;

	public void setDbmailMessageblksMessageblkIdnr(Long id) {
		setId(id);
	}

	public Long getDbmailMessageblksMessageblkIdnr() {
		return (Long) getId();
	}

	@Override
	protected DbmailMessageblks createInstance() {
		DbmailMessageblks dbmailMessageblks = new DbmailMessageblks();
		return dbmailMessageblks;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		DbmailPhysmessage dbmailPhysmessage = dbmailPhysmessageHome
				.getDefinedInstance();
		if (dbmailPhysmessage != null) {
			getInstance().setDbmailPhysmessage(dbmailPhysmessage);
		}
	}

	public boolean isWired() {
		return true;
	}

	public DbmailMessageblks getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
