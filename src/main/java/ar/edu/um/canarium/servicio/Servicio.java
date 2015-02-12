package ar.edu.um.canarium.servicio;

import java.util.Date;

import javax.persistence.Query;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.Role;
import ar.edu.um.canarium.domain.Sexo;
import ar.edu.um.canarium.domain.User;
import ar.edu.um.canarium.domain.UserRole;

public class Servicio {
	
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
	
}
