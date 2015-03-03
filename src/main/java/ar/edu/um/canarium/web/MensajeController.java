package ar.edu.um.canarium.web;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import ar.edu.um.canarium.domain.Mensaje;
import ar.edu.um.canarium.domain.MensajeTag;
import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.Relacion;
import ar.edu.um.canarium.domain.Tag;
import ar.edu.um.canarium.domain.Republicado;
import ar.edu.um.canarium.servicio.Servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.gvnix.addon.web.mvc.jquery.GvNIXWebJQuery;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/mensajes")
@Controller
@RooWebScaffold(path = "mensajes", formBackingObject = Mensaje.class)
@RooWebFinder
@GvNIXWebJQuery
@RooWebJson(jsonObject = Mensaje.class)
public class MensajeController {

	 @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
	 public ResponseEntity<String> create(@RequestBody String json)
	 {
		HttpHeaders headers = new HttpHeaders(); 
		Mensaje mensaje = Mensaje.fromJsonToMensaje(json);
		
		//CREO EL MENSAJE
		mensaje.setFecha(new Date());
		Persona persona = Servicio.getPersonaLogged();
		mensaje.setPersona(persona);
		String descripcion = mensaje.getDescripcion();
		
		mensaje.persist();
		
		//VERIFICO SI HAY TAGS
		if(descripcion.contains("#")){
			
			List<Tag> tags = Servicio.buscarTag(descripcion);
			
			for (Tag tag : tags) {
				
				List<Tag> tagEncontrado = Tag.findTagsByDescripcionEquals(tag.getDescripcion()).getResultList();
				
				//SINO ESTA EL TAG LO GUARDO
				if(tagEncontrado.isEmpty()){
					tag.persist();
				}else{
					tag = tagEncontrado.get(0);
				}
				
				//GUARDO LA RELACION
				MensajeTag mensajeTag = Servicio.crearMensajeTag(mensaje, tag);
				mensajeTag.persist();
			}
			
		}
		
		headers.add("Content-Type", "application/json");
        
        return new ResponseEntity<String >(headers, HttpStatus.CREATED);
    }
	 
	 @RequestMapping(value = "/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> updateFromJson(@RequestBody String json, @PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        Mensaje mensaje = Mensaje.fromJsonToMensaje(json);
        Mensaje anterior = Mensaje.findMensaje(mensaje.getId());
        mensaje.setFecha(anterior.getFecha());
        mensaje.setPersona(anterior.getPersona());
        
        if (mensajeService.updateMensaje(mensaje) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(headers = "Accept=application/json")
     public ResponseEntity<String> listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Mensaje> todos = new ArrayList<Mensaje>();
        
        //OBTENGO MIS MENSAJES
        //los que yo publico
        Persona persona = Servicio.getPersonaLogged();
        List<Mensaje> mios = Mensaje.findMensajesByPersona(persona).getResultList();
        
        //los que yo republico
        List<Republicado> republicadoMio = Republicado.findRepublicadoesByPersona(persona).getResultList();
        for (Republicado republicado : republicadoMio) {
        	Mensaje m = Servicio.getMensajeRepublicado(republicado);
        	mios.add(m);
		}
        
        //OBTENGO LOS MENSAJES DE LAS PERSONAS QUE SIGO
        //los que ellos publican
        List<Relacion> relaciones = Relacion.findRelacionsByPersona(persona).getResultList();
        
        for (Relacion relacion : relaciones) {
        	Persona seguido = Persona.findPersona(relacion.getIdSeguido());
			List<Mensaje> seguidos = Mensaje.findMensajesByPersona(seguido).getResultList();
			todos.addAll(seguidos);
			 
			//los que ellos republican
			List<Republicado> republicadoSeguido = Republicado.findRepublicadoesByPersona(seguido).getResultList();
			 for (Republicado republicado : republicadoSeguido) {
		        	Mensaje m = Servicio.getMensajeRepublicado(republicado);
		        	todos.add(m);
				}
		}
        
        
        
        
        todos.addAll(mios);
        
        //todos = Servicio.reemplazarTags(todos);
        
        //Los ordeno
        Collections.sort(todos, new Comparator(){
        	public int compare(Object o1, Object o2)
        	{
        		Mensaje p1 = (Mensaje)o1;
        		Mensaje p2 = (Mensaje)o2;
        		return p2.getFecha().compareTo(p1.getFecha());
        	}
        });
        
        return new ResponseEntity<String>(Mensaje.toJsonArray(todos), headers, HttpStatus.OK);
     }
	
	
}
