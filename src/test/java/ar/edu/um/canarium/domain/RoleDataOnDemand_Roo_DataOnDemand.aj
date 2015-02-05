// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.domain;

import ar.edu.um.canarium.domain.Role;
import ar.edu.um.canarium.domain.RoleDataOnDemand;
import ar.edu.um.canarium.service.RoleService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect RoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: RoleDataOnDemand: @Component;
    
    private Random RoleDataOnDemand.rnd = new SecureRandom();
    
    private List<Role> RoleDataOnDemand.data;
    
    @Autowired
    RoleService RoleDataOnDemand.roleService;
    
    public Role RoleDataOnDemand.getNewTransientRole(int index) {
        Role obj = new Role();
        setRoleDescription(obj, index);
        setRoleName(obj, index);
        return obj;
    }
    
    public void RoleDataOnDemand.setRoleDescription(Role obj, int index) {
        String roleDescription = "roleDescription_" + index;
        if (roleDescription.length() > 200) {
            roleDescription = roleDescription.substring(0, 200);
        }
        obj.setRoleDescription(roleDescription);
    }
    
    public void RoleDataOnDemand.setRoleName(Role obj, int index) {
        String roleName = "roleName_" + index;
        obj.setRoleName(roleName);
    }
    
    public Role RoleDataOnDemand.getSpecificRole(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Role obj = data.get(index);
        Long id = obj.getId();
        return roleService.findRole(id);
    }
    
    public Role RoleDataOnDemand.getRandomRole() {
        init();
        Role obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return roleService.findRole(id);
    }
    
    public boolean RoleDataOnDemand.modifyRole(Role obj) {
        return false;
    }
    
    public void RoleDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = roleService.findRoleEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Role' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Role>();
        for (int i = 0; i < 10; i++) {
            Role obj = getNewTransientRole(i);
            try {
                roleService.saveRole(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
