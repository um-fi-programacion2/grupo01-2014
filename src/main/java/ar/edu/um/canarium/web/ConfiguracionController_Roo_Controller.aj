// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.web;

import ar.edu.um.canarium.domain.Configuracion;
import ar.edu.um.canarium.web.ConfiguracionController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ConfiguracionController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ConfiguracionController.create(@Valid Configuracion configuracion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, configuracion);
            return "configuracions/create";
        }
        uiModel.asMap().clear();
        configuracion.persist();
        return "redirect:/configuracions/" + encodeUrlPathSegment(configuracion.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ConfiguracionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Configuracion());
        return "configuracions/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ConfiguracionController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("configuracion", Configuracion.findConfiguracion(id));
        uiModel.addAttribute("itemId", id);
        return "configuracions/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ConfiguracionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("configuracions", Configuracion.findConfiguracionEntries(firstResult, sizeNo));
            float nrOfPages = (float) Configuracion.countConfiguracions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("configuracions", Configuracion.findAllConfiguracions());
        }
        return "configuracions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ConfiguracionController.update(@Valid Configuracion configuracion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, configuracion);
            return "configuracions/update";
        }
        uiModel.asMap().clear();
        configuracion.merge();
        return "redirect:/configuracions/" + encodeUrlPathSegment(configuracion.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ConfiguracionController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Configuracion.findConfiguracion(id));
        return "configuracions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ConfiguracionController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Configuracion configuracion = Configuracion.findConfiguracion(id);
        configuracion.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/configuracions";
    }
    
    void ConfiguracionController.populateEditForm(Model uiModel, Configuracion configuracion) {
        uiModel.addAttribute("configuracion", configuracion);
    }
    
    String ConfiguracionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
