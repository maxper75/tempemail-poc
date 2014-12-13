package it.i_node.tempemail.action;

import it.i_node.tempemail.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("tempAliasHome")
public class TempAliasHome extends EntityHome<TempAlias> {

	public void setTempAliasAliasIdnr(Long id) {
		setId(id);
	}

	public Long getTempAliasAliasIdnr() {
		return (Long) getId();
	}

	@Override
	protected TempAlias createInstance() {
		TempAlias tempAlias = new TempAlias();
		tempAlias.setAliasType("T");
		return tempAlias;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
	}

	public boolean isWired() {
		return true;
	}

	public TempAlias getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
