package it.i_node.tempemail.rest;

import java.io.Serializable;

public class Status implements Serializable{
	private long countdown=-1;
	private int mailboxsize=-1;
	
	public long getCountdown() {
		return countdown;
	}
	public void setCountdown(long countdown) {
		this.countdown = countdown;
	}
	public int getMailboxsize() {
		return mailboxsize;
	}
	public void setMailboxsize(int mailboxsize) {
		this.mailboxsize = mailboxsize;
	}
	
}
