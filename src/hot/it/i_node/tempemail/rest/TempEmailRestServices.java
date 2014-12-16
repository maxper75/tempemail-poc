package it.i_node.tempemail.rest;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

import it.i_node.tempemail.components.ListContainer;
import it.i_node.tempemail.helpers.SynchronousQueueManager;
import it.i_node.tempemail.helpers.TempEmailHelper;
import it.i_node.tempemail.json.JsonCompleteMessage;
import it.i_node.tempemail.json.JsonCompleteMessageFactory;
import it.i_node.tempemail.json.JsonMail;
import it.i_node.tempemail.json.JsonMailFactory;
import it.i_node.tempemail.json.JsonMessageHeaders;
import it.i_node.tempemail.json.JsonMessageHeadersFactory;
import it.i_node.tempemail.model.DbmailMessages;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;

import org.jboss.resteasy.core.ResourceMethodRegistry;
import org.jboss.resteasy.jsapi.JSAPIWriter;
import org.jboss.resteasy.jsapi.ServiceRegistry;
import org.jboss.resteasy.spi.ResteasyProviderFactory;
import org.jboss.seam.Component;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.resteasy.SeamResteasyProviderFactory;

@Path("/tempemail")
@Name("tempEmailRestServices")
public class TempEmailRestServices {

	private static final String DEFAULT_PROTOCOL = "http";
	private static final String DEFAULT_HOST = "localhost";
	private static final String DEFAULT_CONTEXT = "/tempemail";
	private static final int DEFAULT_URL_PORT = 8080;
	private String protocol = DEFAULT_PROTOCOL;
	private String hostName =  null;
	private Integer port = DEFAULT_URL_PORT;
	private String context = DEFAULT_CONTEXT;

	@GET
	@Produces(MediaType.TEXT_PLAIN)
	@Path("/create/{username}")
	public String createEmail(@PathParam("username") String username) {
		TempEmailHelper helper = (TempEmailHelper) Component
				.getInstance(TempEmailHelper.class);
		helper.setUsername(username);
		helper.setDomainName("emailtemporanea.it");
		if (helper.createEmail())
			return helper.getUsername();
		return helper.getText();
	}

	@GET
	@Produces(MediaType.TEXT_PLAIN)
	@Path("/create")
	public String createRandomEmail() {
		TempEmailHelper helper = (TempEmailHelper) Component
				.getInstance(TempEmailHelper.class);
		// helper.setUsername(null); //TEST OCCHIO
		helper.setDomainName("emailtemporanea.it");
		if (helper.createEmail())
			return helper.getUsername();
		return helper.getText();
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/status")
	public Status getMailboxStatus() {
		TempEmailHelper helper = (TempEmailHelper) Component
				.getInstance(TempEmailHelper.class);
		Status status = new Status();
		if (helper.reloadContents()) {
			status.setMailboxsize(helper.getMessages().size());
			status.setCountdown(helper.countDown());
		}
		return status;
	}

	@GET
	@Produces(MediaType.TEXT_PLAIN)
	@Path("/expiretime")
	public String getExpireTime() {
		TempEmailHelper helper = (TempEmailHelper) Component
				.getInstance(TempEmailHelper.class);
		return "" + helper.countDown();
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/messagelist")
	public String getMailboxMessageList() {
		TempEmailHelper helper = (TempEmailHelper) Component
				.getInstance(TempEmailHelper.class);
		return helper.getMessages().toString();
	}

	@GET
	@Produces(MediaType.TEXT_PLAIN)
	@Path("/delete")
	public String deleteEmail() {
		TempEmailHelper helper = (TempEmailHelper) Component
				.getInstance(TempEmailHelper.class);
		helper.deleteEmail();
		return "delete";
	}

	// serve?
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	@Path("/reload")
	public String reloadContents() {
		TempEmailHelper helper = (TempEmailHelper) Component
				.getInstance(TempEmailHelper.class);
		helper.reloadContents();
		return "reload";
	}

	@GET
	@Produces(MediaType.TEXT_PLAIN)
	@Path("/refreshing")
	public String refreshing() {
		TempEmailHelper helper = (TempEmailHelper) Component
				.getInstance(TempEmailHelper.class);
		helper.refreshing();
		return "" + helper.countDown();
	}

	@GET
	@Path("/data")
	@Produces(MediaType.APPLICATION_JSON)
	public ListContainer<JsonMail> getData() {
		try {
			JAXBContext.newInstance(JsonMail.class);
			JsonMailFactory factory = new JsonMailFactory();
			TempEmailHelper helper = (TempEmailHelper) Component
					.getInstance(TempEmailHelper.class);
			// scade la sessione bisogna riprendere i messaggi
			helper.reloadContents();
			List<JsonMail> data = factory.createMessageList(helper
					.getMessages());
			ListContainer<JsonMail> responseValue = new ListContainer<JsonMail>(
					data);
			return responseValue;
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@GET
	@Path("/datatable")
	@Produces(MediaType.APPLICATION_JSON)
	public ListContainer<List<String>> getDataTable() {
		try {
			JAXBContext.newInstance(JsonMail.class);
			JsonMailFactory factory = new JsonMailFactory();
			TempEmailHelper helper = (TempEmailHelper) Component
					.getInstance(TempEmailHelper.class);
			// scade la sessione bisogna riprendere i messaggi
			helper.reloadContents();
			List<List<String>> data = factory.createStringArray(helper
					.getMessages());
			ListContainer<List<String>> responseValue = new ListContainer<List<String>>(
					data);
			return responseValue;
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@Path("/js-api")
	@Produces(MediaType.TEXT_PLAIN)
	@GET
	public Response getAPI() {
		try {
			JSAPIWriter w = new JSAPIWriter("/seam/resource/restv1");
			ResteasyProviderFactory providerFactory = SeamResteasyProviderFactory
					.getInstance();
			ResourceMethodRegistry methodRegistry = new ResourceMethodRegistry(
					providerFactory);
			// Registrare direttamente quì i singleton (oggetti REST) che poi
			// verranno esposti nella API
			// Mediante REST
			// TODO: Sarebbe interessante effettuare, per ottenere la lista, una
			// scansione delle classi
			// ricerando una annotation, così da evitare di dover inserire
			// manualmente questa cosa.
			// L'altra possibilità è qualla secondo la quale, invece di scandire
			// tutte le classi, utilizzando una
			// interfaccia si creino solamente classi che espongono la propria
			// API, invece di tutte le API insieme
			methodRegistry.addSingletonResource(new TempEmailRestServices());

			ServiceRegistry registry = new ServiceRegistry(null,
					methodRegistry, providerFactory, null);
			StringWriter stringWriter = new StringWriter();
			PrintWriter writer = new PrintWriter(stringWriter);
			StringBuilder restUrl = new StringBuilder();
			if (getHostName() != null) {
				if (getProtocol() == null)
					setProtocol(DEFAULT_PROTOCOL);
				restUrl.append(getProtocol());
				restUrl.append("://");
				restUrl.append(getHostName());
				if (getPort() != null) {
					restUrl.append(":");
					restUrl.append(getPort());
				}
			}
			restUrl.append(getContext());
			w.writeJavaScript(restUrl.toString(), writer, registry);

			return Response.status(200).entity(stringWriter.toString()).build();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Response.status(500).build();
	}

	@GET
	@Path("/messageheaders")
	@Produces(MediaType.APPLICATION_JSON)
	public ListContainer<JsonMessageHeaders> getMessageHeaders() {
		try {
			JAXBContext.newInstance(JsonMessageHeaders.class);
			JsonMessageHeadersFactory factory = new JsonMessageHeadersFactory();
			TempEmailHelper helper = (TempEmailHelper) Component
					.getInstance(TempEmailHelper.class);
			// scade la sessione bisogna riprendere i messaggi
			helper.reloadContents();
			List<JsonMessageHeaders> data = factory.createMessageList(helper
					.getMessages());
			ListContainer<JsonMessageHeaders> responseValue = new ListContainer<JsonMessageHeaders>(
					data);
			return responseValue;
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@GET
	@Path("/completemessage/{messageid}")
	@Produces(MediaType.APPLICATION_JSON)
	public JsonCompleteMessage getCompleteMessage(
			@PathParam("messageid") long messageId) {
		try {
			JAXBContext.newInstance(JsonMessageHeaders.class);
			JsonCompleteMessageFactory factory = new JsonCompleteMessageFactory();
			TempEmailHelper helper = (TempEmailHelper) Component
					.getInstance(TempEmailHelper.class);
			// scade la sessione bisogna riprendere i messaggi
			helper.reloadContents();
			DbmailMessages mess = helper.getMessageById(messageId);
			System.out.println("messaggio con id: " + mess.getMessageIdnr());
			JsonCompleteMessage data = factory.createMessage(mess);
			System.out.println("body messaggio corrente: " + data.getBody());
			return data;

		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@GET
	@Path("/nomeutente")
	@Produces(MediaType.TEXT_PLAIN)
	public String getNomeUtente() {
		TempEmailHelper helper = (TempEmailHelper) Component
				.getInstance(TempEmailHelper.class);
		if (helper.getDbmailbox() != null)
			if (helper.countDown() > 0)
				return helper.getDbmailbox().getDbmailUsers().getUserid();
			else
				helper.clear();
		return "non presente";
	}

	@GET
	@Path("/messageid/{messageid}")
	@Produces(MediaType.TEXT_PLAIN)
	public String getMessageId(@PathParam("messageid") Integer messageId) {
		SynchronousQueueManager.instance().messageArrived(messageId);
		return "" + messageId;

	}

	@GET
	@Path("/push")
	@Produces(MediaType.APPLICATION_JSON)
	// public ListContainer<JsonMail> push() {
	public ListContainer<JsonMessageHeaders> push() {
		TempEmailHelper helper = (TempEmailHelper) Component
				.getInstance(TempEmailHelper.class);
		if (helper.getEmailAddress() != null) {
			// JsonMailFactory factory = new JsonMailFactory();
			// JsonMail
			// mess=factory.createMessage(SynchronousQueueManager.instance().getMessage(helper.getEmailAddress()));
			// List<JsonMail> list=new ArrayList<JsonMail>();
			// list.add(SynchronousQueueManager.instance().getJsonMail(helper.getEmailAddress()));
			// PASSO MESSAGE HEADERS
			List<JsonMessageHeaders> list = new ArrayList<JsonMessageHeaders>();
			list.add(SynchronousQueueManager.instance().getJsonMessageHeaders(
					helper.getEmailAddress()));
			ListContainer<JsonMessageHeaders> resp = new ListContainer<JsonMessageHeaders>(
					list);
			return resp;
		}
		return null;
	}

	@GET
	@Produces(MediaType.TEXT_PLAIN)
	@Path("/createalias/{alias}")
	public String createAlias(@PathParam("alias") String alias) {
		TempEmailHelper helper = (TempEmailHelper) Component
				.getInstance(TempEmailHelper.class);
		if (helper.getDbmailbox() == null || helper.countDown() <= 0) {
			System.out.println("create alias:error");
			return "error";
		}
		helper.createAlias(alias);
		return helper.getText();
	}

	public String getProtocol() {
		return protocol;
	}

	public void setProtocol(String protocol) {
		this.protocol = protocol;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	public Integer getPort() {
		return port;
	}

	public void setPort(Integer port) {
		this.port = port;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

}
