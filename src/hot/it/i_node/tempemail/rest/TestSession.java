package it.i_node.tempemail.rest;

import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.Create;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Scope;

@Name("testSession")
@Scope(ScopeType.SESSION)
public class TestSession {
	
	private int cont=0;

	public int getCont() {
		return cont++;
	}

	public void setCont(int cont) {
		this.cont = cont;
	}
	
	@Create
	public void create()	{
		System.out.println("create");
	}
	
}
