package it.i_node.tempemail.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.mail.Address;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.jboss.seam.annotations.Name;

import com.google.common.base.Joiner;
@Name("sieveRulesFactory")
public class SieveRulesFactory {

	/**Meaning of retain number
	 * Integer deliver/forward = -1;
	 * Integer discard = 0;
	 * Integer retain = 1;
	 */

	private List <TempEmailAddress> deliverAddresses; 
	private List <TempEmailAddress> discardAddresses; 
	private List <TempEmailAddress> retainAddresses;

	public String createSieveRule (List <TempEmailAddress> addresses,String forwardAddress){

		deliverAddresses= new ArrayList <TempEmailAddress> ();
		discardAddresses = new ArrayList <TempEmailAddress> (); 
		retainAddresses= new ArrayList <TempEmailAddress> ();	
		addressesHandler(addresses);
		return createRule (deliverAddresses,discardAddresses,retainAddresses,forwardAddress);

	}
	public String createSieveRule (List <TempEmailAddress> addresses,TempEmailAddress forwardAddress){
		return createSieveRule(addresses, forwardAddress.getEmailAddress());
	}


	private void addressesHandler(List <TempEmailAddress> add){

		for (TempEmailAddress s : add){
			if(s.getRetentionDays()== -1)
				deliverAddresses.add(s);		
			else if(s.getRetentionDays()== 0)
				discardAddresses.add(s);
			else
				retainAddresses.add(s);
		}
	}
	private String creationDate (){
		SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy HH:mm:ss");
		return sdf.format(new Date());
		//return ""+ Calendar.DATE +"/" + Calendar.MONTH + "/" + Calendar.YEAR + " " + Calendar.HOUR + ":" + Calendar.MINUTE + ":" + Calendar.SECOND;
	}

	private String createRule (List<TempEmailAddress> deliverAddresses,List<TempEmailAddress> discardAddresses,
			List<TempEmailAddress> retainAddresses,String forwardAddress) {
		StringBuilder stringBuilder= new StringBuilder();

		stringBuilder.append("## This rule has been created");
		stringBuilder.append("\n");
		stringBuilder.append("## "+creationDate());
		stringBuilder.append("\n");
		stringBuilder.append("## DO NOT MODIFY otherwise changes will be lost!");
		stringBuilder.append("\n");
		stringBuilder.append(requireFeature(deliverAddresses,discardAddresses));

		if(!deliverAddresses.isEmpty()){
			stringBuilder.append("\n");
			stringBuilder.append(" # sender to forward ");
			stringBuilder.append("\n");
			stringBuilder.append(rule4deliver(deliverAddresses,forwardAddress));
		}
		if(!discardAddresses.isEmpty()){
			stringBuilder.append("\n");
			stringBuilder.append(" # sender to keep into MAILBOX.discarded for a certain amount of time ");
			//specific amount of time to be specified
			stringBuilder.append("\n");
			stringBuilder.append(rule4discard(discardAddresses));
		}
		if(!retainAddresses.isEmpty()){
			stringBuilder.append("\n");
			stringBuilder.append(" # sender to keep");
			stringBuilder.append("\n");
			stringBuilder.append(rule4retain(retainAddresses));
		}
		stringBuilder.append("\n");
		return stringBuilder.toString();
	}
	private String requireFeature(List<TempEmailAddress> deliverAddresses,	List<TempEmailAddress> discardAddresses) {
		StringBuilder stringBuilder= new StringBuilder();
		stringBuilder.append("require");
//		stringBuilder.append("[");
//		if(!deliverAddresses.isEmpty())
//			stringBuilder.append("\"redirect\"");
//		if(!deliverAddresses.isEmpty() && !discardAddresses.isEmpty())
//			stringBuilder.append(" , ");
		if(!discardAddresses.isEmpty())
			stringBuilder.append("\"fileinto\"");
//		stringBuilder.append("]");
		stringBuilder.append(";");
		
		return stringBuilder.toString();
	}
	private String listAddressesIntoString (List<TempEmailAddress> Add){
		List <String> onlyAddresses= new ArrayList<String>();
		for(TempEmailAddress tea: Add)
			onlyAddresses.add(tea.getEmailAddress());
			
		return listAddresses(onlyAddresses);
	}
	private String listAddresses (List<String> listAdd){
		
		StringBuilder stringBuilder= new StringBuilder();
		stringBuilder.append("\"");
		String addresses = Joiner.on("\",\"").join(listAdd);
		stringBuilder.append(addresses);
		stringBuilder.append("\"");
		
		return stringBuilder.toString();
	}


	private String rule4deliver(List<TempEmailAddress> deliverAddresses,String forwardAddress) {
		StringBuilder stringBuilder = createIfRule(deliverAddresses);
		stringBuilder.append("{");
		stringBuilder.append(" redirect \""+ forwardAddress+"\";");
		stringBuilder.append("\n");
		stringBuilder.append("stop;");
		stringBuilder.append("\n");
		stringBuilder.append("}");
		
		
		return stringBuilder.toString();

	}
	private String rule4discard(List<TempEmailAddress> discardAddresses) {
		StringBuilder stringBuilder = createIfRule(discardAddresses);
		stringBuilder.append("{");
		stringBuilder.append("fileinto \"MAILBOX.discarded\";");
		stringBuilder.append("\n");
		stringBuilder.append("stop;");
		stringBuilder.append("\n");
		stringBuilder.append("}");
		
		//eventually to discard
		//stringBuilder.append(" discard;");
		return stringBuilder.toString();

	}
	private StringBuilder createIfRule(List<TempEmailAddress> discardAddresses) {
		StringBuilder stringBuilder= new StringBuilder();
		stringBuilder.append("if address :is \"from\" [");
		stringBuilder.append(listAddressesIntoString(discardAddresses));
		stringBuilder.append("]\n");
		return stringBuilder;
	}
	private String rule4retain(List<TempEmailAddress> retainAddresses) {
		StringBuilder stringBuilder = createIfRule(retainAddresses);
		stringBuilder.append("{");
		stringBuilder.append("keep;");
		stringBuilder.append("\n");
		stringBuilder.append("stop;");
		stringBuilder.append("\n");
		stringBuilder.append("}");
		
		return stringBuilder.toString();

	}


}
