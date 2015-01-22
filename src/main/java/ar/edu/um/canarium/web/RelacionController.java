package ar.edu.um.canarium.web;
import ar.edu.um.canarium.domain.Relacion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/relacions")
@Controller
@RooWebScaffold(path = "relacions", formBackingObject = Relacion.class)
@RooWebFinder
public class RelacionController {
}
