package it.i_node.tempemail.model;

import it.i_node.tempemail.action.PermanentUserHome;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;

import org.apache.derby.iapi.util.ByteArray;
import org.jboss.seam.Component;
import org.jboss.seam.annotations.Name;

import ezvcard.Ezvcard;
import ezvcard.VCard;
import ezvcard.io.text.VCardReader;
import ezvcard.property.Email;

@Name("fileVcf")
public class FileVcf {
	
	private byte[] data;
	private String filename;
	private String contentType;
	private long size;

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}
	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

	


}
