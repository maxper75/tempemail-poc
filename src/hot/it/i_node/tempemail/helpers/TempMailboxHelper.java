package it.i_node.tempemail.helpers;

import java.util.ArrayList;

import java.util.List;
import java.util.Set;

import org.jboss.seam.Component;
import org.jboss.seam.annotations.Name;

import it.i_node.tempemail.action.DbmailSievescriptsHome;
import it.i_node.tempemail.action.TempMailboxHome;
import it.i_node.tempemail.model.DbmailSievescripts;
import it.i_node.tempemail.model.SieveRulesFactory;
import it.i_node.tempemail.model.TempEmailAddress;

@Name ("tempMailboxHelper")
public class TempMailboxHelper {

	private boolean changes_generateRule= false;//if true=> there are changes => a new sieve rule have to be generate


	public boolean isChanges_generateRule() {
		return changes_generateRule;
	}

	public void setChanges_generateRule(boolean changes_generateRule) {
		this.changes_generateRule = changes_generateRule;
	}

	public String generateSieveRule(){

		TempMailboxHome tmh= (TempMailboxHome) Component.getInstance(TempMailboxHome.class);
		DbmailSievescriptsHome home=(DbmailSievescriptsHome) Component.getInstance(DbmailSievescriptsHome.class);
		List <TempEmailAddress> addresses = 
				new ArrayList <TempEmailAddress>(tmh.getInstance().getTempEmailAddresses());
		Set <DbmailSievescripts> sieveScriptses =tmh.getInstance().getDbmailUsers().getDbmailSievescriptses();

		if(sieveScriptses.size() >1){//caso:presenti più DbmailSievescript =>errore

			System.out.println("Error: sono presenti più scriptses");

			//			sieveScriptses.clear(); //bisogna fare un persist per svuotare la lista
			//			script = new DbmailSievescripts();

		}
		else 
			if (sieveScriptses.size()== 1){//caso:presente un solo DbmailSievescript => update

				DbmailSievescripts script= sieveScriptses.iterator().next();
				if(script.getName().equals("TempMail")){//test per verificare che sia presente lo script corretto da aggiornare

					setNactivateScript(script,addresses,tmh.getInstance().getDbmailUsers().getUserid());
					home.setInstance(script);
					home.update();
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
				home.getInstance().setName("TempMail");
				home.getInstance().setDbmailUsers(tmh.getInstance().getDbmailUsers());
				setNactivateScript(home.getInstance(),addresses,tmh.getInstance().getDbmailUsers().getUserid());
				home.persist();
				System.out.println("è stato creato il nuovo script");

			}
		setChanges_generateRule(false);//dopo aver creato la nuova sieve rules, 
										//il pulsante generate sieve rules deve essere disabilitato
		
		tmh.getInstance().setDirty(false);
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
