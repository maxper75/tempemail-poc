package it.i_node.tempemail.helpers;

import java.util.ArrayList;

import java.util.List;
import java.util.Set;

import org.jboss.seam.Component;
import org.jboss.seam.annotations.Name;

import it.i_node.tempemail.action.DbmailSievescriptsHome;
import it.i_node.tempemail.action.TempUserHome;
import it.i_node.tempemail.model.DbmailSievescripts;
import it.i_node.tempemail.model.SieveRulesFactory;
import it.i_node.tempemail.model.TempEmailAddress;

@Name ("tempUserHelper")
public class TempUserHelper {


	public String generateSieveRule(){

		TempUserHome tuh= (TempUserHome) Component.getInstance(TempUserHome.class);
		DbmailSievescriptsHome scriptHome=(DbmailSievescriptsHome) Component.getInstance(DbmailSievescriptsHome.class);
		List <TempEmailAddress> addresses = 
				new ArrayList <TempEmailAddress>(tuh.getInstance().getTempEmailAddresses());
		Set <DbmailSievescripts> sieveScriptses =tuh.getInstance().getDbmailSievescriptses();

		if(sieveScriptses.size() >1){//caso:presenti più DbmailSievescript =>errore

			System.out.println("Error: sono presenti più scriptses");

			//			sieveScriptses.clear(); //bisogna fare un persist per svuotare la lista
			//			script = new DbmailSievescripts();

		}
		else 
			if (sieveScriptses.size()== 1){//caso:presente un solo DbmailSievescript => update

				DbmailSievescripts script= sieveScriptses.iterator().next();
				if(script.getName().equals("TempMail")){//test per verificare che sia presente lo script corretto da aggiornare

					setNactivateScript(script,addresses,tuh.getInstance().getUserid());
					scriptHome.setInstance(script);
					scriptHome.update();
					System.out.println("lo script presente è stato aggiornato e attivato");
				}

			}


			else {
				//			if(sieveScriptses.size() >1){//caso:presenti più DbmailSievescript =>errore
				//				System.out.println("Error: sono presenti più scriptses");
				//				sieveScriptses.clear();
				//				tmh.update();
				//				System.out.println("Sono stati eliminati i precedenti script");
				//
				//			}
				//caso default:presente nessun DbmailSievescript => create
				scriptHome.getInstance().setName("TempMail");
				scriptHome.getInstance().setDbmailUsers(tuh.getInstance());
				setNactivateScript(scriptHome.getInstance(),addresses,tuh.getInstance().getUserid());
				scriptHome.persist();
				System.out.println("è stato creato il nuovo script");

			}
	
		tuh.getInstance().setDirty(false);
		return "";
	}

	/**
	 * 
	 * method to set the string-rule and activate the script
	 * @param script: DbmailSieveScripts
	 * @param addresses:List <TempEmailAddress>
	 * @param userId:String
	 * 
	 */
	public void setNactivateScript(DbmailSievescripts script,List <TempEmailAddress> addresses,String userId){
		SieveRulesFactory srf=new SieveRulesFactory();
		script.setScript(srf.createSieveRule(addresses,userId));
		script.setActive((short) 1);
	}


}
