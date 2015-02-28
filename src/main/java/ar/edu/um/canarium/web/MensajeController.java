package ar.edu.um.canarium.web;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import ar.edu.um.canarium.domain.Mensaje;
import ar.edu.um.canarium.domain.Persona;
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
		mensaje.setFecha(new Date());
		Persona persona = Servicio.getPersonaLogged();
		mensaje.setPersona(persona);
		
		mensaje.persist();
				
		headers.add("Content-Type", "application/json");
        
        return new ResponseEntity<String >(headers, HttpStatus.CREATED);
    }
	
	
}
