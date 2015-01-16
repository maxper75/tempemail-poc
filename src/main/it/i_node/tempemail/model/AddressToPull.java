package it.i_node.tempemail.model;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.jboss.seam.annotations.Name;


@Entity
@Table(name = "addressToPull", schema = "public")

public class AddressToPull implements java.io.Serializable{
	private long id;
	private PermanentUser permanentUser;
	private String imapORimaps ;
	private String email ;
	private String password ;
	private String serverName;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "addressToPull_id", unique = true, nullable = false)
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	@ManyToOne(fetch= FetchType.LAZY)
	@JoinColumn (name = "userIdnr")
	public PermanentUser getPermanentUser() {
		return permanentUser;
	}

	public void setPermanentUser(PermanentUser permanentUser) {
		this.permanentUser = permanentUser;
	}
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
