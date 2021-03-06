// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.domain;

import ar.edu.um.canarium.domain.Mensaje;
import ar.edu.um.canarium.domain.MensajeDataOnDemand;
import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.PersonaDataOnDemand;
import ar.edu.um.canarium.domain.Republicado;
import ar.edu.um.canarium.domain.RepublicadoDataOnDemand;
import ar.edu.um.canarium.service.RepublicadoService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect RepublicadoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: RepublicadoDataOnDemand: @Component;
    
    private Random RepublicadoDataOnDemand.rnd = new SecureRandom();
    
    private List<Republicado> RepublicadoDataOnDemand.data;
    
    @Autowired
    MensajeDataOnDemand RepublicadoDataOnDemand.mensajeDataOnDemand;
    
    @Autowired
    PersonaDataOnDemand RepublicadoDataOnDemand.personaDataOnDemand;
    
    @Autowired
    RepublicadoService RepublicadoDataOnDemand.republicadoService;
    
    public Republicado RepublicadoDataOnDemand.getNewTransientRepublicado(int index) {
        Republicado obj = new Republicado();
        setFecha(obj, index);
        setMensaje(obj, index);
        setPersona(obj, index);
        return obj;
    }
    
    public void RepublicadoDataOnDemand.setFecha(Republicado obj, int index) {
        Date fecha = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFecha(fecha);
    }
    
    public void RepublicadoDataOnDemand.setMensaje(Republicado obj, int index) {
        Mensaje mensaje = mensajeDataOnDemand.getRandomMensaje();
        obj.setMensaje(mensaje);
    }
    
    public void RepublicadoDataOnDemand.setPersona(Republicado obj, int index) {
        Persona persona = personaDataOnDemand.getRandomPersona();
        obj.setPersona(persona);
    }
    
    public Republicado RepublicadoDataOnDemand.getSpecificRepublicado(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Republicado obj = data.get(index);
        Long id = obj.getId();
        return republicadoService.findRepublicado(id);
    }
    
    public Republicado RepublicadoDataOnDemand.getRandomRepublicado() {
        init();
        Republicado obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return republicadoService.findRepublicado(id);
    }
    
    public boolean RepublicadoDataOnDemand.modifyRepublicado(Republicado obj) {
        return false;
    }
    
    public void RepublicadoDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = republicadoService.findRepublicadoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Republicado' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Republicado>();
        for (int i = 0; i < 10; i++) {
            Republicado obj = getNewTransientRepublicado(i);
            try {
                republicadoService.saveRepublicado(obj);
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
