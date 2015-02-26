package ar.edu.um.canarium.web;
import ar.edu.um.canarium.domain.Republicado;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.gvnix.addon.web.mvc.jquery.GvNIXWebJQuery;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/republicadoes")
@Controller
@RooWebScaffold(path = "republicadoes", formBackingObject = Republicado.class)
@RooWebFinder
@GvNIXWebJQuery
@RooWebJson(jsonObject = Republicado.class)
public class RepublicadoController {
}
