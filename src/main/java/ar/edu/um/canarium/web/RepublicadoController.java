package ar.edu.um.canarium.web;
import ar.edu.um.canarium.domain.Republicado;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/republicadoes")
@Controller
@RooWebScaffold(path = "republicadoes", formBackingObject = Republicado.class)
public class RepublicadoController {
}
