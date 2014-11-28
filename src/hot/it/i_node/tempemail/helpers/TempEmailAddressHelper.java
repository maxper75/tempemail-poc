package it.i_node.tempemail.helpers;

import it.i_node.tempemail.action.TempEmailAddressHome;
import it.i_node.tempemail.model.TempEmailAddress;

import org.jboss.seam.Component;
import org.jboss.seam.annotations.Name;

@Name ("tempEmailAddressHelper")
public class TempEmailAddressHelper {
	/**
	 * retention values
	 * 1 =retain
	 * 0 =discard
	 * -1=deliver
	 * 
	 */
private Integer retentionPolicy = 1;
	
	public Integer getRetentionPolicy() {
		return retentionPolicy;
	}

	public void setRetentionPolicy(Integer retentionPolicy) {
		this.retentionPolicy = retentionPolicy;
		setPolicy();
	}
	public void setPolicy(){
		TempEmailAddressHome teah = (TempEmailAddressHome) Component.getInstance(TempEmailAddressHome.class);
		
		if(retentionPolicy>0)
			teah.getInstance().setRetentionDays(1);
		else
			teah.getInstance().setRetentionDays(retentionPolicy);

		teah.persist();
	}

}
