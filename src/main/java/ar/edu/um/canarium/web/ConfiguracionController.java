package ar.edu.um.canarium.web;
import ar.edu.um.canarium.domain.Configuracion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/configuracions")
@Controller
@RooWebScaffold(path = "configuracions", formBackingObject = Configuracion.class)
public class ConfiguracionController {
}
