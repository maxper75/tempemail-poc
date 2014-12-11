package it.i_node.tempemail.jsf.Validator;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

import it.i_node.tempemail.action.TempMailboxHome;

@FacesValidator("tempEmailAddressValidator")
public class TempEmailAddressValidator implements Validator {
	//http://www.tutorialspoint.com/jsf/jsf_customvalidator_tag.htm//
	
	@Override
	public void validate(FacesContext context, UIComponent component,
			Object value) throws ValidatorException {
		// TODO Auto-generated method stub
		
		
		
		//http://elblog.elbuild.it/2011/11/17/un-approccio-pure-java-per-la-validazione-di-indirizzi-email/
		
	}

}
