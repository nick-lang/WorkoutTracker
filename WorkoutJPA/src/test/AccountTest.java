package test;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Account;
import entities.User;
import entities.WorkoutDefinition;

public class AccountTest {
	  private EntityManagerFactory emf;
	    private EntityManager em;

	    @Before
	    public void setUp() throws Exception {
	        emf = Persistence.createEntityManagerFactory("WorkoutJPA");
	        em = emf.createEntityManager();
	    }

	    @Test
	    public void test() throws ParseException {
	        Account acc = em.find(Account.class, 1);
	        assertEquals("admin", acc.getUsername());
	        assertEquals("admin", acc.getPassword());
	        
	        User user = acc.getUser();
	        assertEquals((Double)23.08, user.getBmi());
	        
	        List<WorkoutDefinition> wds = acc.getWorkoutDefinitions();
	        assertEquals(23, wds.size());
	      
	    }

	    @After
	    public void tearDown() throws Exception {
	        em.close();
	        emf.close();
	    }

}
