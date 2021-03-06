// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.web;

import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.Relacion;
import ar.edu.um.canarium.web.RelacionController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect RelacionController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByIdSeguidoEquals", "form" }, method = RequestMethod.GET)
    public String RelacionController.findRelacionsByIdSeguidoEqualsForm(Model uiModel) {
        return "relacions/findRelacionsByIdSeguidoEquals";
    }
    
    @RequestMapping(params = { "find=ByIdSeguidoEqualsAndPersona", "form" }, method = RequestMethod.GET)
    public String RelacionController.findRelacionsByIdSeguidoEqualsAndPersonaForm(Model uiModel) {
        uiModel.addAttribute("personae", personaService.findAllPersonae());
        return "relacions/findRelacionsByIdSeguidoEqualsAndPersona";
    }
    
    @RequestMapping(params = "find=ByIdSeguidoEqualsAndPersona", method = RequestMethod.GET)
    public String RelacionController.findRelacionsByIdSeguidoEqualsAndPersona(@RequestParam("idSeguido") Long idSeguido, @RequestParam("persona") Persona persona, Model uiModel) {
        uiModel.addAttribute("relacions", Relacion.findRelacionsByIdSeguidoEqualsAndPersona(idSeguido, persona).getResultList());
        return "relacions/list";
    }
    
    @RequestMapping(params = { "find=ByPersona", "form" }, method = RequestMethod.GET)
    public String RelacionController.findRelacionsByPersonaForm(Model uiModel) {
        uiModel.addAttribute("personae", personaService.findAllPersonae());
        return "relacions/findRelacionsByPersona";
    }
    
}
