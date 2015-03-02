package ar.edu.um.canarium.web;
import java.util.Date;

import ar.edu.um.canarium.domain.Mensaje;
import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.Republicado;
import ar.edu.um.canarium.servicio.Servicio;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.gvnix.addon.web.mvc.jquery.GvNIXWebJQuery;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/republicadoes")
@Controller
@RooWebScaffold(path = "republicadoes", formBackingObject = Republicado.class)
@RooWebFinder
@GvNIXWebJQuery
@RooWebJson(jsonObject = Republicado.class)
public class RepublicadoController {
	
	@RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJson(@RequestBody String json) {
        Republicado republicado = Republicado.fromJsonToRepublicado(json);
        
        Mensaje mensaje = Mensaje.findMensaje(republicado.getId());
        republicado.setId(null);
        Persona persona = Servicio.getPersonaLogged();
        
        republicado.setMensaje(mensaje);
        republicado.setFecha(new Date());
        republicado.setPersona(persona);
        
        republicadoService.saveRepublicado(republicado);
        
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
	
	
}
