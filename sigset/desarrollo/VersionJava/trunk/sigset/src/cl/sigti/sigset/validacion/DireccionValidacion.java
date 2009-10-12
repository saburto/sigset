package cl.sigti.sigset.validacion;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import cl.sigti.sigset.modelo.Direccion;

public class DireccionValidacion implements Validator {

	@Override
	public boolean supports(Class<? extends Object> clazz) {
		return clazz.equals(Direccion.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "calle", "Debe ingresar Calle");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "comuna", "Debe ingresar Comuna");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "numero", "Debe ingresar Número");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "provincia", "Debe ingresar Comuna");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "region", "Debe ingresar Region");
		
		if(target instanceof Direccion){
			errors.reject("Error", "Error de Prueba");
		}

	}

}
