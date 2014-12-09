package it.i_node.tempemail.model;

import javax.mail.Address;
import javax.mail.internet.InternetAddress;

public class TempEmailAddressFactory {

	public TempEmailAddress createAddress (Address a){
		if (a instanceof InternetAddress){
			InternetAddress iaddress = (InternetAddress)a;
			TempEmailAddress tempEmailAddress = new TempEmailAddress();
			tempEmailAddress.setEmailAddress(iaddress.getAddress());
			tempEmailAddress.setName(iaddress.getPersonal());
			tempEmailAddress.setRetentionDays(0);//impostato di default nel keep
			//((int)(Math.random()*10))-1
			return tempEmailAddress;
		}
		
		return null;
		
	}
}
