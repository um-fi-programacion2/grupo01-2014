package ar.edu.um.canarium.web;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.gvnix.addon.web.mvc.jquery.GvNIXWebJQuery;

import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.User;
import ar.edu.um.canarium.servicio.Servicio;

@Controller
@RooWebFinder
@GvNIXWebJQuery
public class SiteController {
	
	
	@RequestMapping("/")
	public String index(Model uiModel, HttpSession sessionObj) throws IOException {
		
		Servicio.actualizarSession(sessionObj);
		
		/*User person = Servicio.getUserLogged();
		Query consulta = Persona.findPersonaeByPersona(person);
		Persona persona = (Persona) consulta.getSingleResult();

		persona.setSiguiendo(Servicio.cantidadSeguidos(persona.getId()));
		persona.setSeguidores(Servicio.cantidadSeguidores(persona.getId()));

		
		uiModel.addAttribute("usuario", person);*/
		
        //uiModel.addAttribute("persona", persona);
        //uiModel.addAttribute("itemId", persona.getId());
        return "index";
	}	
}
