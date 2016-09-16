package test;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Account;
import entities.Address;

public class AddressTest {
	  private EntityManagerFactory emf;
	    private EntityManager em;

	    @Before
	    public void setUp() throws Exception {
	        emf = Persistence.createEntityManagerFactory("WorkoutJPA");
	        em = emf.createEntityManager();
	    }

	    @Test
	    public void test() throws ParseException {
	        Address a = em.find(Address.class, 1);
	        assertEquals(1, a.getId());
	        assertEquals("place street", a.getAddress());
	        assertEquals("other place", a.getAddress2());
	        assertEquals("denver", a.getCity());
	        assertEquals("CO", a.getState());
	        assertEquals(12345, a.getZip());
	        assertEquals(1234567, a.getPhone());
	      
	    }

	    @After
	    public void tearDown() throws Exception {
	        em.close();
	        emf.close();
	    }

}
