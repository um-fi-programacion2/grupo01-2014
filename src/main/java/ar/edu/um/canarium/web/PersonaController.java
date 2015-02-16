package ar.edu.um.canarium.web;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.FileSystems;
import java.nio.file.Files;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.User;
import ar.edu.um.canarium.servicio.Servicio;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.gvnix.addon.web.mvc.jquery.GvNIXWebJQuery;

@RequestMapping("/personae")
@Controller
@RooWebScaffold(path = "personae", formBackingObject = Persona.class)
@RooWebFinder
@GvNIXWebJQuery
public class PersonaController {
	
	@RequestMapping(params = "find=ByUsuarioLike", method = RequestMethod.GET)
    public String findPersonaeByUsuarioLike(@RequestParam("usuario") String usuario, Model uiModel) {
        uiModel.addAttribute("personae", Persona.findPersonaeByUsuarioLike(usuario).getResultList());
        User person = Servicio.getUserLogged();
		Query consulta = Persona.findPersonaeByPersona(person);
		Persona persona = (Persona) consulta.getSingleResult();

		uiModel.addAttribute("usuario", person);
		
		addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("persona", persona);
		
        return "personae/list";
    }
	
	
	@RequestMapping(value = "/{id}/image", method = RequestMethod.GET)
	public String showImage(@PathVariable("id") Long id,
	        HttpServletResponse response, Model model) {
	    Persona persona = Persona.findPersona(id);
	    if (persona != null && persona.getPath() != null) {
	        try {
	            OutputStream out = response.getOutputStream();
	            response.setContentType(persona.getContentType());
	            Files.copy(FileSystems.getDefault().getPath(persona.getPath()),
	                    out);
	            out.flush();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    return null;
	}
	
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String create(@Valid Persona persona, BindingResult bindingResult,
	        Model uiModel, HttpServletRequest httpServletRequest) {
	    if (bindingResult.hasErrors()) {
	        populateEditForm(uiModel, persona);
	        return "personae/create";
	    }
	    uiModel.asMap().clear();
	 
	    CommonsMultipartFile image = persona.getImage();
	    if (image != null) {
	        File file = new File(image.getOriginalFilename());
	        try {
	            image.transferTo(file);
	            persona.setContentType(image.getContentType());
	            persona.setPath(file.getAbsolutePath());
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "personae/create";
	        }
	    }
	    persona.persist();
	    return "redirect:/personae/"
	            + encodeUrlPathSegment(persona.getId().toString(),
	                    httpServletRequest);
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = "text/html")
    public String update(@Valid Persona persona, BindingResult bindingResult,
            Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, persona);
            return "personae/update";
        }
        uiModel.asMap().clear();
 
        CommonsMultipartFile image = persona.getImage();
        if (image != null && image.getSize() != 0) {
            File file = new File(image.getOriginalFilename());
            try {
                image.transferTo(file);
                persona.setContentType(image.getContentType());
                persona.setPath(file.getAbsolutePath());
            } catch (Exception e) {
                e.printStackTrace();
                return "personae/update";
            }
        } else {
            Persona personaItemFromDb = Persona.findPersona(persona.getId());
            persona.setContentType(personaItemFromDb.getContentType());
            persona.setPath(personaItemFromDb.getPath());
        }
 
        persona.merge();
        return "redirect:/personae/"
                + encodeUrlPathSegment(persona.getId().toString(),
                        httpServletRequest);
    }
	
	@RequestMapping(value = "/updatePerfil", produces = "text/html")
	public String updatePerfil(Model uiModel) throws IOException {
		User person = Servicio.getUserLogged();
		Query consulta = Persona.findPersonaeByPersona(person);
		Persona persona = (Persona) consulta.getSingleResult();
		
		uiModel.addAttribute("usuario", person);
		
		populateEditForm(uiModel, persona);
        return "personae/update";
	}
	
	@RequestMapping(value = "/verPerfil", produces = "text/html")
	public String verPerfil(Model uiModel) throws IOException {
		User person = Servicio.getUserLogged();
		Query consulta = Persona.findPersonaeByPersona(person);
		Persona persona = (Persona) consulta.getSingleResult();

		uiModel.addAttribute("usuario", person);
		
		addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("persona", persona);
        uiModel.addAttribute("itemId", persona.getId());
        return "personae/show";
	}
	
}
