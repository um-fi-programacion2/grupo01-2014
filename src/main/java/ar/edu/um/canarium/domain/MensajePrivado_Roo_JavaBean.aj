// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.domain;

import ar.edu.um.canarium.domain.MensajePrivado;
import ar.edu.um.canarium.domain.Persona;
import java.util.Date;

privileged aspect MensajePrivado_Roo_JavaBean {
    
    public String MensajePrivado.getDescripcion() {
        return this.descripcion;
    }
    
    public void MensajePrivado.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public Date MensajePrivado.getFecha() {
        return this.fecha;
    }
    
    public void MensajePrivado.setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    public Long MensajePrivado.getIdPersonaDestino() {
        return this.idPersonaDestino;
    }
    
    public void MensajePrivado.setIdPersonaDestino(Long idPersonaDestino) {
        this.idPersonaDestino = idPersonaDestino;
    }
    
    public Persona MensajePrivado.getPersona() {
        return this.persona;
    }
    
    public void MensajePrivado.setPersona(Persona persona) {
        this.persona = persona;
    }
    
}
