package ar.edu.um.canarium.web;
import ar.edu.um.canarium.domain.Mensaje;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/mensajes")
@Controller
@RooWebScaffold(path = "mensajes", formBackingObject = Mensaje.class)
@RooWebFinder
public class MensajeController {
}
