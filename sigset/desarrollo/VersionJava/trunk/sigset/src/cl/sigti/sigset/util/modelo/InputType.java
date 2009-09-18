package cl.sigti.sigset.util.modelo;

public enum InputType{
		HIDDEN, TEXT, PASSWORD;
		public String toString(){
			return this.name().toLowerCase();
		}
}

