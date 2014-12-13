package it.i_node.tempemail.jsf.Validator;


import it.i_node.tempemail.action.TempUserHome;
import it.i_node.tempemail.model.TempEmailAddress;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

import org.jboss.seam.Component;
@FacesValidator("emailAddressExsistingValidator")
public class EmailAddressExsistingValidator implements Validator {
	
	@Override
	public void validate(FacesContext context, UIComponent component,
			Object value) throws ValidatorException {
		// TODO Auto-generated method stub

		if (exsists(value.toString())) {
			FacesMessage msg =
					new FacesMessage(" E-mail validation failed.",
							"an address with this email already exsists");
			msg.setSeverity(FacesMessage.SEVERITY_ERROR);

			throw new ValidatorException(msg);
		}


	}

	public boolean exsists(String email){
		TempUserHome tmh = (TempUserHome) Component.getInstance(TempUserHome.class);

		for (TempEmailAddress tea : tmh.getInstance().getTempEmailAddresses())
			if (tea.getEmailAddress().equals(email))
				return true;
		return false;
	}

}
