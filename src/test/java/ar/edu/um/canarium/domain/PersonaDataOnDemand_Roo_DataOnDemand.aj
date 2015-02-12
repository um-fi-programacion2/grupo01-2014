// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.domain;

import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.PersonaDataOnDemand;
import ar.edu.um.canarium.domain.Sexo;
import ar.edu.um.canarium.domain.UserDataOnDemand;
import ar.edu.um.canarium.service.PersonaService;
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

privileged aspect PersonaDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PersonaDataOnDemand: @Component;
    
    private Random PersonaDataOnDemand.rnd = new SecureRandom();
    
    private List<Persona> PersonaDataOnDemand.data;
    
    @Autowired
    UserDataOnDemand PersonaDataOnDemand.userDataOnDemand;
    
    @Autowired
    PersonaService PersonaDataOnDemand.personaService;
    
    public Persona PersonaDataOnDemand.getNewTransientPersona(int index) {
        Persona obj = new Persona();
        setContentType(obj, index);
        setDescripcion(obj, index);
        setFecha(obj, index);
        setFoto(obj, index);
        setPath(obj, index);
        setSexo(obj, index);
        setUsuario(obj, index);
        return obj;
    }
    
    public void PersonaDataOnDemand.setContentType(Persona obj, int index) {
        String contentType = "contentType_" + index;
        obj.setContentType(contentType);
    }
    
    public void PersonaDataOnDemand.setDescripcion(Persona obj, int index) {
        String descripcion = "descripcion_" + index;
        if (descripcion.length() > 500) {
            descripcion = descripcion.substring(0, 500);
        }
        obj.setDescripcion(descripcion);
    }
    
    public void PersonaDataOnDemand.setFecha(Persona obj, int index) {
        Date fecha = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFecha(fecha);
    }
    
    public void PersonaDataOnDemand.setFoto(Persona obj, int index) {
        String foto = "foto_" + index;
        if (foto.length() > 255) {
            foto = foto.substring(0, 255);
        }
        obj.setFoto(foto);
    }
    
    public void PersonaDataOnDemand.setPath(Persona obj, int index) {
        String path = "path_" + index;
        obj.setPath(path);
    }
    
    public void PersonaDataOnDemand.setSexo(Persona obj, int index) {
        Sexo sexo = Sexo.class.getEnumConstants()[0];
        obj.setSexo(sexo);
    }
    
    public void PersonaDataOnDemand.setUsuario(Persona obj, int index) {
        String usuario = "usuario_" + index;
        if (usuario.length() > 15) {
            usuario = new Random().nextInt(10) + usuario.substring(1, 15);
        }
        obj.setUsuario(usuario);
    }
    
    public Persona PersonaDataOnDemand.getSpecificPersona(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Persona obj = data.get(index);
        Long id = obj.getId();
        return personaService.findPersona(id);
    }
    
    public Persona PersonaDataOnDemand.getRandomPersona() {
        init();
        Persona obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return personaService.findPersona(id);
    }
    
    public boolean PersonaDataOnDemand.modifyPersona(Persona obj) {
        return false;
    }
    
    public void PersonaDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = personaService.findPersonaEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Persona' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Persona>();
        for (int i = 0; i < 10; i++) {
            Persona obj = getNewTransientPersona(i);
            try {
                personaService.savePersona(obj);
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
