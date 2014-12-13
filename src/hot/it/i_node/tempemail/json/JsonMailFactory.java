package it.i_node.tempemail.json;

import it.i_node.tempemail.model.DbmailHeader;
import it.i_node.tempemail.model.DbmailHeadervalue;
import it.i_node.tempemail.model.DbmailMessages;
import it.i_node.tempemail.model.DbmailPartlists;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.io.IOUtils;

public class JsonMailFactory {

	public List<JsonMail> createMessageList(List<DbmailMessages> messages){
		List<JsonMail> mail=new ArrayList<JsonMail>();
		for(DbmailMessages mess: messages)
			mail.add(createMessage(mess));
		return mail;
	}
	
	public List<List<String>> createStringArray(List<DbmailMessages> messages){
		List<List<String>> result=new ArrayList<List<String>>();
		for(DbmailMessages mess: messages)
			result.add(createMessageArray(mess));
		return result;
	}

	private List<String> createMessageArray(DbmailMessages mess) {
		List<String> message=new ArrayList<String>(4);
		JsonMail jsonMail = createMessage(mess);
		message.add(jsonMail.getFrom());
		message.add(jsonMail.getTo());
		message.add(jsonMail.getSubject());
		message.add(jsonMail.getReceived());
		return message;
	}

	public JsonMail createMessage(DbmailMessages mess) {
		JsonMail jmail=new JsonMail();
		Map<String,DbmailHeadervalue> headerMap=createHeaderMap(mess.getDbmailPhysmessage().getDbmailHeaders());
		jmail.setFrom(headerMap.get("from").getHeadervalue());
		jmail.setTo(headerMap.get("to").getHeadervalue());
		jmail.setSubject(headerMap.get("subject").getHeadervalue());
		jmail.setReceived(headerMap.get("date").getHeadervalue());
		for(DbmailPartlists part: mess.getDbmailPhysmessage().getDbmailPartlistses())	{
			if(part.getId().getIsHeader()==0)
				jmail.setBody(convertToString(part.getDbmailMimeparts().getData()));
		}
		return jmail;
	
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
