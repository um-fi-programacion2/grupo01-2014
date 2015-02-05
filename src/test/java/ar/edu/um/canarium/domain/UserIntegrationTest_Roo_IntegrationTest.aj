// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.domain;

import ar.edu.um.canarium.domain.UserDataOnDemand;
import ar.edu.um.canarium.domain.UserIntegrationTest;
import ar.edu.um.canarium.service.UserService;
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

privileged aspect UserIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UserIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UserIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: UserIntegrationTest: @Transactional;
    
    @Autowired
    UserDataOnDemand UserIntegrationTest.dod;
    
    @Autowired
    UserService UserIntegrationTest.userService;
    
    @Test
    public void UserIntegrationTest.testCountAllUsers() {
        Assert.assertNotNull("Data on demand for 'User' failed to initialize correctly", dod.getRandomUser());
        long count = userService.countAllUsers();
        Assert.assertTrue("Counter for 'User' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UserIntegrationTest.testFindUser() {
        User obj = dod.getRandomUser();
        Assert.assertNotNull("Data on demand for 'User' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'User' failed to provide an identifier", id);
        obj = userService.findUser(id);
        Assert.assertNotNull("Find method for 'User' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'User' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void UserIntegrationTest.testFindAllUsers() {
        Assert.assertNotNull("Data on demand for 'User' failed to initialize correctly", dod.getRandomUser());
        long count = userService.countAllUsers();
        Assert.assertTrue("Too expensive to perform a find all test for 'User', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<User> result = userService.findAllUsers();
        Assert.assertNotNull("Find all method for 'User' illegally returned null", result);
        Assert.assertTrue("Find all method for 'User' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UserIntegrationTest.testFindUserEntries() {
        Assert.assertNotNull("Data on demand for 'User' failed to initialize correctly", dod.getRandomUser());
        long count = userService.countAllUsers();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<User> result = userService.findUserEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'User' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'User' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void UserIntegrationTest.testFlush() {
        User obj = dod.getRandomUser();
        Assert.assertNotNull("Data on demand for 'User' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'User' failed to provide an identifier", id);
        obj = userService.findUser(id);
        Assert.assertNotNull("Find method for 'User' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUser(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'User' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UserIntegrationTest.testUpdateUserUpdate() {
        User obj = dod.getRandomUser();
        Assert.assertNotNull("Data on demand for 'User' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'User' failed to provide an identifier", id);
        obj = userService.findUser(id);
        boolean modified =  dod.modifyUser(obj);
        Integer currentVersion = obj.getVersion();
        User merged = userService.updateUser(obj);
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'User' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UserIntegrationTest.testSaveUser() {
        Assert.assertNotNull("Data on demand for 'User' failed to initialize correctly", dod.getRandomUser());
        User obj = dod.getNewTransientUser(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'User' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'User' identifier to be null", obj.getId());
        try {
            userService.saveUser(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'User' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void UserIntegrationTest.testDeleteUser() {
        User obj = dod.getRandomUser();
        Assert.assertNotNull("Data on demand for 'User' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'User' failed to provide an identifier", id);
        obj = userService.findUser(id);
        userService.deleteUser(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'User' with identifier '" + id + "'", userService.findUser(id));
    }
    
}
