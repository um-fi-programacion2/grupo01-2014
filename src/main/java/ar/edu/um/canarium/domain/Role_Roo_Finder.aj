// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.domain;

import ar.edu.um.canarium.domain.Role;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Role_Roo_Finder {
    
    public static TypedQuery<Role> Role.findRolesByRoleNameEquals(String roleName) {
        if (roleName == null || roleName.length() == 0) throw new IllegalArgumentException("The roleName argument is required");
        EntityManager em = Role.entityManager();
        TypedQuery<Role> q = em.createQuery("SELECT o FROM Role AS o WHERE o.roleName = :roleName", Role.class);
        q.setParameter("roleName", roleName);
        return q;
    }
    
}