// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.domain;

import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.Relacion;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Relacion_Roo_Finder {
    
    public static TypedQuery<Relacion> Relacion.findRelacionsByIdSeguidoEquals(Long idSeguido) {
        if (idSeguido == null) throw new IllegalArgumentException("The idSeguido argument is required");
        EntityManager em = Relacion.entityManager();
        TypedQuery<Relacion> q = em.createQuery("SELECT o FROM Relacion AS o WHERE o.idSeguido = :idSeguido", Relacion.class);
        q.setParameter("idSeguido", idSeguido);
        return q;
    }
    
    public static TypedQuery<Relacion> Relacion.findRelacionsByIdSeguidoEqualsAndPersona(Long idSeguido, Persona persona) {
        if (idSeguido == null) throw new IllegalArgumentException("The idSeguido argument is required");
        if (persona == null) throw new IllegalArgumentException("The persona argument is required");
        EntityManager em = Relacion.entityManager();
        TypedQuery<Relacion> q = em.createQuery("SELECT o FROM Relacion AS o WHERE o.idSeguido = :idSeguido  AND o.persona = :persona", Relacion.class);
        q.setParameter("idSeguido", idSeguido);
        q.setParameter("persona", persona);
        return q;
    }
    
    public static TypedQuery<Relacion> Relacion.findRelacionsByPersona(Persona persona) {
        if (persona == null) throw new IllegalArgumentException("The persona argument is required");
        EntityManager em = Relacion.entityManager();
        TypedQuery<Relacion> q = em.createQuery("SELECT o FROM Relacion AS o WHERE o.persona = :persona", Relacion.class);
        q.setParameter("persona", persona);
        return q;
    }
    
}
