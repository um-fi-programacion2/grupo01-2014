package ar.edu.um.canarium.web;
import ar.edu.um.canarium.domain.Role;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.gvnix.addon.web.mvc.jquery.GvNIXWebJQuery;

@RequestMapping("/roles")
@Controller
@RooWebScaffold(path = "roles", formBackingObject = Role.class)
@GvNIXWebJQuery
public class RoleController {
}
