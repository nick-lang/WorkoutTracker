package test;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.User;

public class UserTest {
	  private EntityManagerFactory emf;
	    private EntityManager em;

	    @Before
	    public void setUp() throws Exception {
	        emf = Persistence.createEntityManagerFactory("WorkoutJPA");
	        em = emf.createEntityManager();
	    }

	    @Test
	    public void test() throws ParseException {
	        User user = em.find(User.class, 1);
	        assertEquals(1, user.getAccountId());
	        assertEquals((Double)23.08, user.getBmi());
	        assertEquals("nick", user.getFirstName());
	        assertEquals("lang", user.getLastName());
	        assertEquals(27, user.getAge());
	        assertEquals("thisistotallyanemail", user.getEmail());
	        assertEquals(1, user.getAddressId());
	      
	    }

	    @After
	    public void tearDown() throws Exception {
	        em.close();
	        emf.close();
	    }

}
