package cl.sigti.sigset.util.tags;

import java.lang.reflect.Field;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import cl.sigti.sigset.util.modelo.Form;


public class FieldFormHelper {
	
	Map<Integer, TreeSet<Field>> tabla;
	
	public FieldFormHelper(Field[] fields){
		
		tabla = new TreeMap<Integer, TreeSet<Field>>();
		
		for(Field obj : fields){
			if(obj.getAnnotation(Form.class) == null) continue;
			
			TreeSet<Field> camposCelda = tabla.get(obj.getAnnotation(Form.class).fila());
			if(camposCelda == null){
				camposCelda = new TreeSet<Field>(new Comparator<Field>() {

					@Override
					public int compare(Field o1, Field o2) {
						return new Integer(o1.getAnnotation(Form.class).columna()).compareTo(o2.getAnnotation(Form.class).columna());
					}
					
				});
				tabla.put(obj.getAnnotation(Form.class).fila(), camposCelda);
			}
			camposCelda.add(obj);
		}
	}
	
	public Set<Field> getListaCampos(int columna){
		return this.tabla.get(columna);
	}
	
	public int getTotalColumnas(){
		return tabla.size();
	}
	
}
