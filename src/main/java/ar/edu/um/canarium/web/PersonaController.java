package ar.edu.um.canarium.web;
import ar.edu.um.canarium.domain.Persona;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/personae")
@Controller
@RooWebScaffold(path = "personae", formBackingObject = Persona.class)
public class PersonaController {
}
