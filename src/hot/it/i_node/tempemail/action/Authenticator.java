package it.i_node.tempemail.action;

import javax.ejb.Local;

@Local
public interface Authenticator {

	boolean authenticate();

}
