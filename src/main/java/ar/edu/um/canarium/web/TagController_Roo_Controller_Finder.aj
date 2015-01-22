// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.web;

import ar.edu.um.canarium.domain.Mensaje;
import ar.edu.um.canarium.domain.Tag;
import ar.edu.um.canarium.web.TagController;
import java.util.Set;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect TagController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByDescripcionEquals", "form" }, method = RequestMethod.GET)
    public String TagController.findTagsByDescripcionEqualsForm(Model uiModel) {
        return "tags/findTagsByDescripcionEquals";
    }
    
    @RequestMapping(params = "find=ByDescripcionEquals", method = RequestMethod.GET)
    public String TagController.findTagsByDescripcionEquals(@RequestParam("descripcion") String descripcion, Model uiModel) {
        uiModel.addAttribute("tags", Tag.findTagsByDescripcionEquals(descripcion).getResultList());
        return "tags/list";
    }
    
    @RequestMapping(params = { "find=ByMensajes", "form" }, method = RequestMethod.GET)
    public String TagController.findTagsByMensajesForm(Model uiModel) {
        uiModel.addAttribute("mensajes", Mensaje.findAllMensajes());
        return "tags/findTagsByMensajes";
    }
    
    @RequestMapping(params = "find=ByMensajes", method = RequestMethod.GET)
    public String TagController.findTagsByMensajes(@RequestParam("mensajes") Set<Mensaje> mensajes, Model uiModel) {
        uiModel.addAttribute("tags", Tag.findTagsByMensajes(mensajes).getResultList());
        return "tags/list";
    }
    
}
