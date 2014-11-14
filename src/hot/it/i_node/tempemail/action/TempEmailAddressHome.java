package it.i_node.tempemail.action;

import it.i_node.tempemail.model.TempAlias;
import it.i_node.tempemail.model.TempEmailAddress;

import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("TempEmailAddressHome")
public class TempEmailAddressHome extends EntityHome<TempEmailAddress>{
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
		//tea;
		return tea;
	}
	public TempEmailAddress getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}
}
