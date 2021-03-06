// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.web;

import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.User;
import ar.edu.um.canarium.web.PersonaController;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect PersonaController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PersonaController.showJson(@PathVariable("id") Long id) {
        Persona persona = personaService.findPersona(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (persona == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(persona.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PersonaController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Persona> result = personaService.findAllPersonae();
        return new ResponseEntity<String>(Persona.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> PersonaController.createFromJson(@RequestBody String json) {
        Persona persona = Persona.fromJsonToPersona(json);
        personaService.savePersona(persona);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> PersonaController.createFromJsonArray(@RequestBody String json) {
        for (Persona persona: Persona.fromJsonArrayToPersonae(json)) {
            personaService.savePersona(persona);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> PersonaController.updateFromJson(@RequestBody String json, @PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        Persona persona = Persona.fromJsonToPersona(json);
        if (personaService.updatePersona(persona) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> PersonaController.deleteFromJson(@PathVariable("id") Long id) {
        Persona persona = personaService.findPersona(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (persona == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        personaService.deletePersona(persona);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByPersona", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PersonaController.jsonFindPersonaeByPersona(@RequestParam("persona") User persona) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Persona.toJsonArray(Persona.findPersonaeByPersona(persona).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByUsuarioEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PersonaController.jsonFindPersonaeByUsuarioEquals(@RequestParam("usuario") String usuario) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Persona.toJsonArray(Persona.findPersonaeByUsuarioEquals(usuario).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByUsuarioLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PersonaController.jsonFindPersonaeByUsuarioLike(@RequestParam("usuario") String usuario) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Persona.toJsonArray(Persona.findPersonaeByUsuarioLike(usuario).getResultList()), headers, HttpStatus.OK);
    }
    
}
