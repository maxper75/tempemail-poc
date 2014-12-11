package it.i_node.tempemail.jsf.converters;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;


@FacesConverter(value ="retentionPolicyConverter")
public class RetentionPolicyConverter implements Converter{

	@Override
	public Object getAsObject(FacesContext context, UIComponent component,
			String value) {
		//convertes the given string value into an Object
		// TODO Auto-generated method stub
		if(value==null)
			return null;
		else return Integer.parseInt(value);
		
	}

	@Override
	public String getAsString(FacesContext context, UIComponent component,
			Object value) {
		//converts the given object into a String.
		
			
		return value.toString();
	}

	

}
