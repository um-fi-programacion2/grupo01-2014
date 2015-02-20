package ar.edu.um.canarium.web;


import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.Relacion;
import ar.edu.um.canarium.service.PersonaService;
import ar.edu.um.canarium.service.RelacionService;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.gvnix.addon.web.mvc.jquery.GvNIXWebJQuery;

@RequestMapping("/relacions")
@Controller
@RooWebScaffold(path = "relacions", formBackingObject = Relacion.class)
@RooWebFinder
@GvNIXWebJQuery
public class RelacionController {
	
	
	
	@RequestMapping(value = "/seguir/{idPersona}/{idSeguidor}", method = RequestMethod.GET)
    public String Seguir(@PathVariable Long idPersona,@PathVariable Long idSeguidor) {
		
		Persona persona = Persona.findPersona(idPersona);
		Relacion relacion = new Relacion();
		relacion.setIdSeguido(idSeguidor);
		relacion.setPersona(persona);
		relacionService.saveRelacion(relacion);
		
		return "redirect:/personae?find=ByUsuarioLike&usuario=";
    }
	
	@RequestMapping(value = "/noSeguir/{idPersona}/{idSeguidor}", method = RequestMethod.GET)
    public String NoSeguir(@PathVariable Long idPersona,@PathVariable Long idSeguidor) {
		
		Persona persona = Persona.findPersona(idPersona);
		Relacion relacion = Relacion.findRelacionsByIdSeguidoEqualsAndPersona(idSeguidor, persona).getSingleResult();
		relacionService.deleteRelacion(relacion);
		
		return "redirect:/personae?find=ByUsuarioLike&usuario=";
    }
	
	
}
