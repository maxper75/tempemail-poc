package it.i_node.tempemail.model;

import org.jboss.seam.annotations.Name;



public class AddressToPull {
	
	private String imapORimaps ;
	private String email ;
	private String password ;
	private String serverName;

	public String getImapORimaps() {
		return imapORimaps;
	}

	public void setImapORimaps(String imapORimaps) {
		this.imapORimaps = imapORimaps;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getServerName() {
		return serverName;
	}

	public void setServerName(String serverName) {
		this.serverName = serverName;
	}

	
}
