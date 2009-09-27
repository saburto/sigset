package cl.sigti.sigset.util.modelo;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;



@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target(value=ElementType.FIELD)
public @interface Form {
	String label() default "";
	InputType type() default InputType.TEXT ;
	int columna() default -1;
	int fila() default 999;
}
