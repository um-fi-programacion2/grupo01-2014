// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.domain;

import ar.edu.um.canarium.domain.Mensaje;
import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.Republicado;
import ar.edu.um.canarium.domain.Tag;
import java.util.Date;
import java.util.Set;

privileged aspect Mensaje_Roo_JavaBean {
    
    public Integer Mensaje.getRepublicado() {
        return this.republicado;
    }
    
    public void Mensaje.setRepublicado(Integer republicado) {
        this.republicado = republicado;
    }
    
    public String Mensaje.getDescripcion() {
        return this.descripcion;
    }
    
    public void Mensaje.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public Date Mensaje.getFecha() {
        return this.fecha;
    }
    
    public void Mensaje.setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    public Persona Mensaje.getPersona() {
        return this.persona;
    }
    
    public void Mensaje.setPersona(Persona persona) {
        this.persona = persona;
    }
    
    public Set<Republicado> Mensaje.getRepublicados() {
        return this.republicados;
    }
    
    public void Mensaje.setRepublicados(Set<Republicado> republicados) {
        this.republicados = republicados;
    }
    
    public Set<Tag> Mensaje.getTags() {
        return this.tags;
    }
    
    public void Mensaje.setTags(Set<Tag> tags) {
        this.tags = tags;
    }
    
}
