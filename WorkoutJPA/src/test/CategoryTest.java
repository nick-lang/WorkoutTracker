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

import entities.Category;
import entities.Exercise;

public class CategoryTest {
	  private EntityManagerFactory emf;
	    private EntityManager em;

	    @Before
	    public void setUp() throws Exception {
	        emf = Persistence.createEntityManagerFactory("WorkoutJPA");
	        em = emf.createEntityManager();
	    }

	    @Test
	    public void test() throws ParseException {
	        Category caty = em.find(Category.class, 1);
	        assertEquals(1, caty.getId());
	        assertEquals("weights", caty.getCategoryName());
	        assertEquals(false, caty.getDistance());
	        assertEquals(true, caty.getWeight());
	        assertEquals(false, caty.getIncline());
	        assertEquals(false, caty.getLevel());
	        assertEquals(false, caty.getPace());
	        assertEquals(true, caty.getReps());
	        assertEquals(false, caty.getTime());
	        
	        List<Exercise> es = caty.getExercises();
	        assertEquals(4, es.size());
	      
	    }

	    @After
	    public void tearDown() throws Exception {
	        em.close();
	        emf.close();
	    }

}
