package ar.edu.um.canarium.web;
import java.io.IOException;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.User;
import ar.edu.um.canarium.servicio.Servicio;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.gvnix.addon.web.mvc.jquery.GvNIXWebJQuery;

@RequestMapping("/personae")
@Controller
@RooWebScaffold(path = "personae", formBackingObject = Persona.class)
@RooWebFinder
@GvNIXWebJQuery
public class PersonaController {
	
	
	@RequestMapping(value = "/updatePerfil", produces = "text/html")
	public String updatePerfil(Model uiModel) throws IOException {
		User person = Servicio.getUserLogged();
		Query consulta = Persona.findPersonaeByPersona(person);
		Persona persona = (Persona) consulta.getSingleResult();

		populateEditForm(uiModel, persona);
        return "personae/update";
	}
	
	@RequestMapping(value = "/verPerfil", produces = "text/html")
	public String verPerfil(Model uiModel) throws IOException {
		User person = Servicio.getUserLogged();
		Query consulta = Persona.findPersonaeByPersona(person);
		Persona persona = (Persona) consulta.getSingleResult();

		addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("persona", persona);
        uiModel.addAttribute("itemId", persona.getId());
        return "personae/show";
	}
	
}
