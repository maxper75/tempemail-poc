package it.i_node.tempemail.json;


import it.i_node.tempemail.model.DbmailMessages;
import it.i_node.tempemail.model.DbmailPartlists;

import java.io.IOException;

import org.apache.commons.io.IOUtils;

public class JsonCompleteMessageFactory {

	public JsonCompleteMessage createMessage(DbmailMessages mess) {
		JsonCompleteMessage completeMessage=new JsonCompleteMessage();
				
		for(DbmailPartlists part: mess.getDbmailPhysmessage().getDbmailPartlistses())	{
			if(part.getId().getIsHeader()==0)
				completeMessage.setBody(convertToString(part.getDbmailMimeparts().getData()));
		}
		return completeMessage;
	
	}
	
	@SuppressWarnings("deprecation")
	public String convertToString(byte[] toConvert)	{
		try {
			return IOUtils.toString(toConvert);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

}
