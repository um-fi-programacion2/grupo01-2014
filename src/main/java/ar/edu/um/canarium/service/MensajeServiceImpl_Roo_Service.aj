// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.service;

import ar.edu.um.canarium.domain.Mensaje;
import ar.edu.um.canarium.service.MensajeServiceImpl;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MensajeServiceImpl_Roo_Service {
    
    declare @type: MensajeServiceImpl: @Service;
    
    declare @type: MensajeServiceImpl: @Transactional;
    
    public long MensajeServiceImpl.countAllMensajes() {
        return Mensaje.countMensajes();
    }
    
    public void MensajeServiceImpl.deleteMensaje(Mensaje mensaje) {
        mensaje.remove();
    }
    
    public Mensaje MensajeServiceImpl.findMensaje(Long id) {
        return Mensaje.findMensaje(id);
    }
    
    public List<Mensaje> MensajeServiceImpl.findAllMensajes() {
        return Mensaje.findAllMensajes();
    }
    
    public List<Mensaje> MensajeServiceImpl.findMensajeEntries(int firstResult, int maxResults) {
        return Mensaje.findMensajeEntries(firstResult, maxResults);
    }
    
    public void MensajeServiceImpl.saveMensaje(Mensaje mensaje) {
        mensaje.persist();
    }
    
    public Mensaje MensajeServiceImpl.updateMensaje(Mensaje mensaje) {
        return mensaje.merge();
    }
    
}
