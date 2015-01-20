// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.domain;

import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.PersonaDataOnDemand;
import ar.edu.um.canarium.domain.PersonaIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PersonaIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PersonaIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PersonaIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: PersonaIntegrationTest: @Transactional;
    
    @Autowired
    PersonaDataOnDemand PersonaIntegrationTest.dod;
    
    @Test
    public void PersonaIntegrationTest.testCountPersonae() {
        Assert.assertNotNull("Data on demand for 'Persona' failed to initialize correctly", dod.getRandomPersona());
        long count = Persona.countPersonae();
        Assert.assertTrue("Counter for 'Persona' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PersonaIntegrationTest.testFindPersona() {
        Persona obj = dod.getRandomPersona();
        Assert.assertNotNull("Data on demand for 'Persona' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Persona' failed to provide an identifier", id);
        obj = Persona.findPersona(id);
        Assert.assertNotNull("Find method for 'Persona' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Persona' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PersonaIntegrationTest.testFindAllPersonae() {
        Assert.assertNotNull("Data on demand for 'Persona' failed to initialize correctly", dod.getRandomPersona());
        long count = Persona.countPersonae();
        Assert.assertTrue("Too expensive to perform a find all test for 'Persona', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Persona> result = Persona.findAllPersonae();
        Assert.assertNotNull("Find all method for 'Persona' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Persona' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PersonaIntegrationTest.testFindPersonaEntries() {
        Assert.assertNotNull("Data on demand for 'Persona' failed to initialize correctly", dod.getRandomPersona());
        long count = Persona.countPersonae();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Persona> result = Persona.findPersonaEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Persona' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Persona' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PersonaIntegrationTest.testFlush() {
        Persona obj = dod.getRandomPersona();
        Assert.assertNotNull("Data on demand for 'Persona' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Persona' failed to provide an identifier", id);
        obj = Persona.findPersona(id);
        Assert.assertNotNull("Find method for 'Persona' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPersona(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Persona' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PersonaIntegrationTest.testMergeUpdate() {
        Persona obj = dod.getRandomPersona();
        Assert.assertNotNull("Data on demand for 'Persona' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Persona' failed to provide an identifier", id);
        obj = Persona.findPersona(id);
        boolean modified =  dod.modifyPersona(obj);
        Integer currentVersion = obj.getVersion();
        Persona merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Persona' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PersonaIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Persona' failed to initialize correctly", dod.getRandomPersona());
        Persona obj = dod.getNewTransientPersona(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Persona' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Persona' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Persona' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PersonaIntegrationTest.testRemove() {
        Persona obj = dod.getRandomPersona();
        Assert.assertNotNull("Data on demand for 'Persona' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Persona' failed to provide an identifier", id);
        obj = Persona.findPersona(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Persona' with identifier '" + id + "'", Persona.findPersona(id));
    }
    
}
