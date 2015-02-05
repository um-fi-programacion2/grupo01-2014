// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.service;

import ar.edu.um.canarium.domain.Relacion;
import ar.edu.um.canarium.service.RelacionService;
import java.util.List;

privileged aspect RelacionService_Roo_Service {
    
    public abstract long RelacionService.countAllRelacions();    
    public abstract void RelacionService.deleteRelacion(Relacion relacion);    
    public abstract Relacion RelacionService.findRelacion(Long id);    
    public abstract List<Relacion> RelacionService.findAllRelacions();    
    public abstract List<Relacion> RelacionService.findRelacionEntries(int firstResult, int maxResults);    
    public abstract void RelacionService.saveRelacion(Relacion relacion);    
    public abstract Relacion RelacionService.updateRelacion(Relacion relacion);    
}
