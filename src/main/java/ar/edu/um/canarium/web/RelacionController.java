package ar.edu.um.canarium.web;
import java.util.ArrayList;
import java.util.List;
import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.Relacion;
import ar.edu.um.canarium.service.PersonaService;
import ar.edu.um.canarium.service.RelacionService;
import ar.edu.um.canarium.servicio.Servicio;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.gvnix.addon.web.mvc.jquery.GvNIXWebJQuery;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/relacions")
@Controller
@RooWebScaffold(path = "relacions", formBackingObject = Relacion.class)
@RooWebFinder
@GvNIXWebJQuery
@RooWebJson(jsonObject = Relacion.class)
public class RelacionController {

    @RequestMapping(value = "/seguir/{idPersona}/{idSeguidor}", method = RequestMethod.GET)
    public String Seguir(@PathVariable Long idPersona, @PathVariable Long idSeguidor) {
        Persona persona = Persona.findPersona(idPersona);
        Relacion relacion = new Relacion();
        relacion.setIdSeguido(idSeguidor);
        relacion.setPersona(persona);
        relacionService.saveRelacion(relacion);
        return "redirect:/personae?find=ByUsuarioLike&usuario=";
    }

    @RequestMapping(value = "/noSeguir/{idPersona}/{idSeguidor}", method = RequestMethod.GET)
    public String NoSeguir(@PathVariable Long idPersona, @PathVariable Long idSeguidor) {
        Persona persona = Persona.findPersona(idPersona);
        Relacion relacion = Relacion.findRelacionsByIdSeguidoEqualsAndPersona(idSeguidor, persona).getSingleResult();
        relacionService.deleteRelacion(relacion);
        return "redirect:/personae?find=ByUsuarioLike&usuario=";
    }

    @RequestMapping(params = "find=ByPersona", method = RequestMethod.GET)
    public String findRelacionsByPersona(@RequestParam("persona") Persona persona, Model uiModel) {
        List<Persona> persons = new ArrayList<Persona>();
        List<Relacion> relacions = Relacion.findRelacionsByPersona(persona).getResultList();
        for (Relacion relacion : relacions) {
            Persona personaRelacion = Persona.findPersona(relacion.getIdSeguido());
            persons.add(personaRelacion);
        }
        uiModel.addAttribute("personae", persons);
        uiModel.addAttribute("relacions", relacions);
        uiModel.addAttribute("servicio", new Servicio());
        return "relacions/list";
    }

    @RequestMapping(params = "find=ByIdSeguidoEquals", method = RequestMethod.GET)
    public String findRelacionsByIdSeguidoEquals(@RequestParam("idSeguido") Long idSeguido, Model uiModel) {
        List<Persona> persons = new ArrayList<Persona>();
        List<Relacion> relacions = Relacion.findRelacionsByIdSeguidoEquals(idSeguido).getResultList();
        for (Relacion relacion : relacions) {
            Persona personaRelacion = Persona.findPersona(relacion.getPersona().getId());
            persons.add(personaRelacion);
        }
        uiModel.addAttribute("personae", persons);
        uiModel.addAttribute("relacions", relacions);
        uiModel.addAttribute("servicio", new Servicio());
        return "relacions/list";
    }
}
