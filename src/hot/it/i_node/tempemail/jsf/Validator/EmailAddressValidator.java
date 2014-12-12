package it.i_node.tempemail.jsf.Validator;

import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import it.i_node.tempemail.action.TempMailboxHome;

@FacesValidator("emailAddressValidator")
public class EmailAddressValidator implements Validator {
	//http://www.tutorialspoint.com/jsf/jsf_customvalidator_tag.htm//

	/**
	 * documentazione: http://www.jsftoolbox.com/documentation/help/12-TagReference/core/f_validator.html
	 * */


	@Override
	public void validate(FacesContext context, UIComponent component,
			Object value) throws ValidatorException {



		if (!isValidEmailAddress(value.toString())) {
			FacesMessage msg =
					new FacesMessage(" E-mail validation failed.",
							"Please provide E-mail address in this format: abcd@abc.com");
			msg.setSeverity(FacesMessage.SEVERITY_ERROR);

			throw new ValidatorException(msg);
		}
	}
	/**
	 * 
	 * documentazione : http://elblog.elbuild.it/2011/11/17/un-approccio-pure-java-per-la-validazione-di-indirizzi-email/
	 * 
	 * */
	public static boolean isValidEmailAddress(String email){
		boolean result = true;
		try {
			InternetAddress emailAddr = new InternetAddress(email);
			emailAddr.validate();
		} catch (AddressException ex) {
			result = false;
		}
		return result;
	}
	/**
	 * validatore alternativo
	 * 
	 * */



	//	public boolean mailSyntaxCheck(String email)
	//	{
	//		// Create the Pattern using the regex
	//		Pattern p = Pattern.compile(".+@.+\\.[a-z]+");
	//
	//		// Match the given string with the pattern
	//		Matcher m = p.matcher(email);
	//
	//		// check whether match is found
	//		boolean matchFound = m.matches();
	//
	//		StringTokenizer st = new StringTokenizer(email, ".");
	//		String lastToken = null;
	//		while (st.hasMoreTokens()) {
	//			lastToken = st.nextToken();
	//		}
	//
	//		// validate the country code
	//		if (matchFound && lastToken.length() >= 2
	//				&& email.length() - 1 != lastToken.length()) {
	//
	//			return true;
	//		} else {
	//			return false;
	//		}
	//
	//	}




}
