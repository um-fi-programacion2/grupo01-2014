// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.domain;

import ar.edu.um.canarium.domain.Configuracion;
import ar.edu.um.canarium.domain.ConfiguracionDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ConfiguracionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ConfiguracionDataOnDemand: @Component;
    
    private Random ConfiguracionDataOnDemand.rnd = new SecureRandom();
    
    private List<Configuracion> ConfiguracionDataOnDemand.data;
    
    public Configuracion ConfiguracionDataOnDemand.getNewTransientConfiguracion(int index) {
        Configuracion obj = new Configuracion();
        setAtributo(obj, index);
        setValor(obj, index);
        return obj;
    }
    
    public void ConfiguracionDataOnDemand.setAtributo(Configuracion obj, int index) {
        String atributo = "atributo_" + index;
        if (atributo.length() > 45) {
            atributo = atributo.substring(0, 45);
        }
        obj.setAtributo(atributo);
    }
    
    public void ConfiguracionDataOnDemand.setValor(Configuracion obj, int index) {
        String valor = "valor_" + index;
        if (valor.length() > 45) {
            valor = valor.substring(0, 45);
        }
        obj.setValor(valor);
    }
    
    public Configuracion ConfiguracionDataOnDemand.getSpecificConfiguracion(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Configuracion obj = data.get(index);
        Long id = obj.getId();
        return Configuracion.findConfiguracion(id);
    }
    
    public Configuracion ConfiguracionDataOnDemand.getRandomConfiguracion() {
        init();
        Configuracion obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Configuracion.findConfiguracion(id);
    }
    
    public boolean ConfiguracionDataOnDemand.modifyConfiguracion(Configuracion obj) {
        return false;
    }
    
    public void ConfiguracionDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Configuracion.findConfiguracionEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Configuracion' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Configuracion>();
        for (int i = 0; i < 10; i++) {
            Configuracion obj = getNewTransientConfiguracion(i);
            try {
                obj.persist();
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
