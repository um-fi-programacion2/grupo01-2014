package ar.edu.um.canarium.web;
import ar.edu.um.canarium.domain.MensajePrivado;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/mensajeprivadoes")
@Controller
@RooWebScaffold(path = "mensajeprivadoes", formBackingObject = MensajePrivado.class)
@RooWebFinder
public class MensajePrivadoController {
}
