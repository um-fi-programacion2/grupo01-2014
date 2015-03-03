package ar.edu.um.canarium.servicio;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import ar.edu.um.canarium.domain.Configuracion;
import ar.edu.um.canarium.domain.Mensaje;
import ar.edu.um.canarium.domain.MensajeTag;
import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.Relacion;
import ar.edu.um.canarium.domain.Republicado;
import ar.edu.um.canarium.domain.Role;
import ar.edu.um.canarium.domain.Sexo;
import ar.edu.um.canarium.domain.Tag;
import ar.edu.um.canarium.domain.User;
import ar.edu.um.canarium.domain.UserRole;

public class Servicio {
	
	public static Persona actualizarSession(HttpSession sessionObj)
	{
		//if(sessionObj.isNew()){
			User usuario = getUserLogged();
			Query consulta = Persona.findPersonaeByPersona(usuario);
			Persona persona = (Persona) consulta.getSingleResult();
			
			persona.setSiguiendo(cantidadSeguidos(persona.getId()));
			persona.setSeguidores(cantidadSeguidores(persona.getId()));
			
			sessionObj.setAttribute("persona",persona);
			sessionObj.setAttribute("usuario",usuario);
			sessionObj.setAttribute("tags",tagValorados());
			
			return persona;
		/*}else{
			//Persona persona = new Persona();
			return (Persona) sessionObj.getAttribute("persona");
		}*/
		
	}

	public static Integer cantidadSeguidos(Long id)
	{
		Persona persona = Persona.findPersona(id);
		List<Relacion> relacion = Relacion.findRelacionsByPersona(persona).getResultList();
		return relacion.size();
	}
	
	public static Integer cantidadSeguidores(Long id)
	{
		List<Relacion> relacion = Relacion.findRelacionsByIdSeguidoEquals(id).getResultList();
		return relacion.size();
	}
	
	
	public static boolean relacionSeguido(Long id, Persona persona)
	{
		List<Relacion> relacion = Relacion.findRelacionsByIdSeguidoEqualsAndPersona(id, persona).getResultList();
		return relacion.isEmpty();
	}
	
	public UserRole setAsignarRol(User user)
	{
        Role Rol = Role.findRolesByRoleNameEquals("user").getSingleResult();
		UserRole Urol = new UserRole();
        Urol.setUserEntry(user);
        Urol.setRoleEntry(Rol);
        return Urol;
	}
	
	public String generarUsuario(User user) 
	{
		Integer cont = 0;
		String nombre_usuario = user.getLastName()+user.getFirstName();
		nombre_usuario = this.cortarStringTamanio(14, nombre_usuario);
		
		do{
			if(cont.intValue() >= 1){
				nombre_usuario = nombre_usuario+cont.toString();
				nombre_usuario = this.cortarStringTamanio(14, nombre_usuario);
			}
			cont++;
		}while(!Persona.findPersonaeByUsuarioEquals(nombre_usuario).getResultList().isEmpty());
			
		//String nombre_usuario = user.getLastName()+user.getFirstName();
		//nombre_usuario = nombre_usuario.substring(0,14);
		return nombre_usuario;
	}
	
	public String cortarStringTamanio(Integer tamanio, String cadena)
	{
		if(cadena.length() > tamanio.intValue())
			return cadena.substring(0,tamanio);
		
		return cadena;
		
	}
	
	public Persona setPersonaUsuario(User user)
	{
		Persona persona = new Persona();
        persona.setFecha(new Date());
        persona.setUsuario(this.generarUsuario(user));
        persona.setSexo(Sexo.masculino);
        persona.setPersona(user);
        persona.setPath("/home/federico/software/proyectos/canarium/src/main/webapp/images/default-profile.jpg");
        persona.setContentType("image/jpeg");
		return persona;
	}
	
	public static User getUserLogged(){
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Query query = User.findUsersByEmailAddress(userDetails.getUsername());
		User person = (User) query.getSingleResult();
		return person;
	}
	
	public static Persona getPersonaLogged(){
		User usuario = getUserLogged();
		Query consulta = Persona.findPersonaeByPersona(usuario);
		Persona persona = (Persona) consulta.getSingleResult();
		return persona;
	}
	
	public static Mensaje getMensajeRepublicado(Republicado republicado){
		Mensaje m = new Mensaje();
    	m.setRepublicado(1);
    	m.setId(republicado.getId());
    	m.setDescripcion(republicado.getMensaje().getDescripcion());
    	m.setFecha(republicado.getFecha());
    	m.setPersona(republicado.getPersona());
    	return m;
	}
	
	public static List<Tag> buscarTag(String mensaje){
		
		List<Tag> lista = new ArrayList<Tag>();
		
		String[] partes = mensaje.split("\\s+");
		
		for (String mens : partes) {
			if(mens.contains("#")){
				Tag tag = new Tag();
				tag.setDescripcion(mens);
				lista.add(tag);
			}
				
		}
		
		return lista;
	}
	
	public static MensajeTag crearMensajeTag(Mensaje mensaje, Tag tag){
		
		MensajeTag mensajeTag = new MensajeTag();
		mensajeTag.setMensaje(mensaje);
		mensajeTag.setTag(tag);
		mensajeTag.setVersion(0);
		return mensajeTag;
	}
	
	public static List<Mensaje> reemplazarTags(List<Mensaje> lista)
	{
		
		
		return lista;
		
	}
	
	public static Map<String, Integer> tagValorados()
	{
		List<Configuracion> dias = Configuracion.findConfiguracionsByAtributoLike("dias").getResultList();
		Integer dia = Integer.valueOf(dias.get(0).getValor());
		
		Calendar fecha = Calendar.getInstance();
		fecha.add(Calendar.DATE, dia);
        //Busco Los Mensajes
		//List<Mensaje> mensajes = Mensaje.findAllMensajes(); //tengo que cambiar por los mensajes por fecha.
		
		List<Mensaje> mensajes = Mensaje.findMensajesByFechaGreaterThan(fecha.getTime()).getResultList();
		
		List<Tag> tags = new ArrayList<Tag>();
		
		for (Mensaje mensaje : mensajes) {
			
			String[] partes = mensaje.getDescripcion().split("\\s+");
			
			for (String mens : partes) {
				//Me fijo si el mensaje tiene tags.
				if(mens.contains("#")){
					Tag tag = new Tag();
					tag.setDescripcion(mens);
					tags.add(tag);
				}
			}
			
		}
		
		Map<String, Integer> tagContador = new HashMap<String,Integer>();
		
		for (Tag tag : tags) {
			Integer i = tagContador.get(tag.getDescripcion().toString());
			if (i ==  null) {
		           i = 0;
			}
			tagContador.put(tag.getDescripcion().toString(), i+1);
		}
		
		tagContador = sortByValues(tagContador);
		
		return tagContador;
		
	}
	
	public static <K, V extends Comparable<V>> Map<K, V> sortByValues(final Map<K, V> map) {
	    Comparator<K> valueComparator =  new Comparator<K>() {
	        public int compare(K k1, K k2) {
	            int compare = map.get(k2).compareTo(map.get(k1));
	            if (compare == 0) return 1;
	            else return compare;
	        }
	    };
	    Map<K, V> sortedByValues = new TreeMap<K, V>(valueComparator);
	    sortedByValues.putAll(map);
	    return sortedByValues;
	}
	

	
}
