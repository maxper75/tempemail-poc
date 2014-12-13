package it.i_node.tempemail.action;

import it.i_node.tempemail.model.TempEmailAddress;
import it.i_node.tempemail.model.TempUser;

import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("tempEmailAddressHome")
public class TempEmailAddressHome extends EntityHome<TempEmailAddress> {
	@In(create = true)
	private TempUserHome tempuserHome;
	
	
	

	public void setTempEmailAddressIdnr(Long id) {
		setId(id);
	}

	public Long getTempEmailAddressIdnr() {
		return (Long) getId();
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		
	}
	
	@Override
	protected TempEmailAddress createInstance() {
		TempEmailAddress tea = new TempEmailAddress();
		//TempUser mailbox = tempMailboxHome.getDefinedInstance();
		TempUser tempUser= tempuserHome.getDefinedInstance();
		if (tempUser != null)
			tea.setTempUser(tempUser);
		return tea;
	}

	public TempEmailAddress getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public boolean isIdDefined() {
		return (getTempEmailAddressIdnr() != null);

	}

	public boolean isWired() {
		return true;
	}
}
