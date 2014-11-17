package it.i_node.tempemail.model;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@DiscriminatorValue("tea")
public class TempEmailAddress {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "tea_idnr", unique = true, nullable = false)
	private long id;
	private String emailAddress;
	private String name;
	private Integer retentionDays;
	
	private TempMailbox tempMailbox;
	
	@ManyToOne
	public TempMailbox getTempMailbox() {
		return tempMailbox;
	}
	public void setTempMailbox(TempMailbox tempMailbox) {
		this.tempMailbox = tempMailbox;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((emailAddress == null) ? 0 : emailAddress.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TempEmailAddress other = (TempEmailAddress) obj;
		if (emailAddress == null) {
			if (other.emailAddress != null)
				return false;
		} else if (!emailAddress.equals(other.emailAddress))
			return false;
		return true;
	}
	public String toString (){
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append(name);
		stringBuilder.append(" <");
		stringBuilder.append(emailAddress);
		stringBuilder.append(">");
		return stringBuilder.toString();
	}
	public Integer getRetentionDays() {
		return retentionDays;
	}
	public void setRetentionDays(Integer retentionDays) {
		this.retentionDays = retentionDays;
	}

}
