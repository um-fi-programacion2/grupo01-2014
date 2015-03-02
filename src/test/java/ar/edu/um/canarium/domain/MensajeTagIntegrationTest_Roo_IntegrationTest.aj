// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.domain;

import ar.edu.um.canarium.domain.MensajeTag;
import ar.edu.um.canarium.domain.MensajeTagDataOnDemand;
import ar.edu.um.canarium.domain.MensajeTagIntegrationTest;
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

privileged aspect MensajeTagIntegrationTest_Roo_IntegrationTest {
    
    declare @type: MensajeTagIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: MensajeTagIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: MensajeTagIntegrationTest: @Transactional;
    
    @Autowired
    MensajeTagDataOnDemand MensajeTagIntegrationTest.dod;
    
    @Test
    public void MensajeTagIntegrationTest.testCountMensajeTags() {
        Assert.assertNotNull("Data on demand for 'MensajeTag' failed to initialize correctly", dod.getRandomMensajeTag());
        long count = MensajeTag.countMensajeTags();
        Assert.assertTrue("Counter for 'MensajeTag' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void MensajeTagIntegrationTest.testFindMensajeTag() {
        MensajeTag obj = dod.getRandomMensajeTag();
        Assert.assertNotNull("Data on demand for 'MensajeTag' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'MensajeTag' failed to provide an identifier", id);
        obj = MensajeTag.findMensajeTag(id);
        Assert.assertNotNull("Find method for 'MensajeTag' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'MensajeTag' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void MensajeTagIntegrationTest.testFindAllMensajeTags() {
        Assert.assertNotNull("Data on demand for 'MensajeTag' failed to initialize correctly", dod.getRandomMensajeTag());
        long count = MensajeTag.countMensajeTags();
        Assert.assertTrue("Too expensive to perform a find all test for 'MensajeTag', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<MensajeTag> result = MensajeTag.findAllMensajeTags();
        Assert.assertNotNull("Find all method for 'MensajeTag' illegally returned null", result);
        Assert.assertTrue("Find all method for 'MensajeTag' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void MensajeTagIntegrationTest.testFindMensajeTagEntries() {
        Assert.assertNotNull("Data on demand for 'MensajeTag' failed to initialize correctly", dod.getRandomMensajeTag());
        long count = MensajeTag.countMensajeTags();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<MensajeTag> result = MensajeTag.findMensajeTagEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'MensajeTag' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'MensajeTag' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void MensajeTagIntegrationTest.testFlush() {
        MensajeTag obj = dod.getRandomMensajeTag();
        Assert.assertNotNull("Data on demand for 'MensajeTag' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'MensajeTag' failed to provide an identifier", id);
        obj = MensajeTag.findMensajeTag(id);
        Assert.assertNotNull("Find method for 'MensajeTag' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyMensajeTag(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'MensajeTag' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void MensajeTagIntegrationTest.testMergeUpdate() {
        MensajeTag obj = dod.getRandomMensajeTag();
        Assert.assertNotNull("Data on demand for 'MensajeTag' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'MensajeTag' failed to provide an identifier", id);
        obj = MensajeTag.findMensajeTag(id);
        boolean modified =  dod.modifyMensajeTag(obj);
        Integer currentVersion = obj.getVersion();
        MensajeTag merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'MensajeTag' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void MensajeTagIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'MensajeTag' failed to initialize correctly", dod.getRandomMensajeTag());
        MensajeTag obj = dod.getNewTransientMensajeTag(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'MensajeTag' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'MensajeTag' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'MensajeTag' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void MensajeTagIntegrationTest.testRemove() {
        MensajeTag obj = dod.getRandomMensajeTag();
        Assert.assertNotNull("Data on demand for 'MensajeTag' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'MensajeTag' failed to provide an identifier", id);
        obj = MensajeTag.findMensajeTag(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'MensajeTag' with identifier '" + id + "'", MensajeTag.findMensajeTag(id));
    }
    
}
