package ar.edu.um.canarium.web;
import ar.edu.um.canarium.domain.UserRole;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.gvnix.addon.web.mvc.jquery.GvNIXWebJQuery;

@RequestMapping("/userroles")
@Controller
@RooWebScaffold(path = "userroles", formBackingObject = UserRole.class)
@GvNIXWebJQuery
public class UserRoleController {
}
