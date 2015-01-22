package ar.edu.um.canarium.web;
import ar.edu.um.canarium.domain.Relacion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/relacions")
@Controller
@RooWebScaffold(path = "relacions", formBackingObject = Relacion.class)
public class RelacionController {
}
