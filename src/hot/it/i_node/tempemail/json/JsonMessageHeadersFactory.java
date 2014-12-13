package it.i_node.tempemail.json;

import it.i_node.tempemail.model.DbmailHeader;
import it.i_node.tempemail.model.DbmailHeadervalue;
import it.i_node.tempemail.model.DbmailMessages;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.io.IOUtils;

public class JsonMessageHeadersFactory {

	public List<JsonMessageHeaders> createMessageList(List<DbmailMessages> messages){
		List<JsonMessageHeaders> mail=new ArrayList<JsonMessageHeaders>();
		for(DbmailMessages mess: messages)
			mail.add(createMessage(mess));
		return mail;
	}
	
	public JsonMessageHeaders createMessage(DbmailMessages mess) {
		JsonMessageHeaders jmail=new JsonMessageHeaders();
		Map<String,DbmailHeadervalue> headerMap=createHeaderMap(mess.getDbmailPhysmessage().getDbmailHeaders());
		jmail.setMessageId(mess.getMessageIdnr()); 
		if(headerMap.get("from")!=null)
			jmail.setFrom(headerMap.get("from").getHeadervalue());
		else	jmail.setFrom("nessun from");
		if(headerMap.get("to")!=null)
			jmail.setTo(headerMap.get("to").getHeadervalue());
		else	jmail.setTo("nessun to");
		System.out.println(headerMap.get("subject"));					//aggiunto test da rimuovere
		if(headerMap.get("subject")!=null)
			jmail.setSubject(headerMap.get("subject").getHeadervalue());
		else	jmail.setSubject("nessun subject");
		jmail.setReceived(headerMap.get("date").getHeadervalue());
		return jmail;
	}
	
	public List<List<String>> createStringArray(List<DbmailMessages> messages){
		List<List<String>> result=new ArrayList<List<String>>();
		for(DbmailMessages mess: messages)
			result.add(createMessageArray(mess));
		return result;
	}

	private List<String> createMessageArray(DbmailMessages mess) {
		List<String> message=new ArrayList<String>(4);
		JsonMessageHeaders messageHeaders = createMessage(mess);
		message.add(messageHeaders.getFrom());
		message.add(messageHeaders.getTo());
		message.add(messageHeaders.getSubject());
		message.add(messageHeaders.getReceived());
		return message;
	}

	private Map<String,DbmailHeadervalue> createHeaderMap(Set<DbmailHeader> headers)	{
		Map<String,DbmailHeadervalue> headerMap=new HashMap<String,DbmailHeadervalue>();
		for(DbmailHeader header: headers)
			if(header!=null)	{
				if(!headerMap.containsKey(header.getDbmailHeadername()))
					headerMap.put(header.getDbmailHeadername().getHeadername(), header.getDbmailHeadervalue());
			}
		return headerMap;
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
