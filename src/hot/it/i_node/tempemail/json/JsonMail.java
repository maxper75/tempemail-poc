package it.i_node.tempemail.json;

public class JsonMail {
	private String subject;
	private String body;
	private String from;
	private String to;
//	private Date received;
	private String received;
/*	public Date getReceived() {
		return received;
	}
	public void setReceived(Date received) {
		this.received = received;
	}*/
	
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getReceived() {
		return received;
	}
	public void setReceived(String received) {
		this.received = received;
	}

}
