package test;

import static org.junit.Assert.*;

import java.text.ParseException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Exercise;

public class ExerciseTest {
	  private EntityManagerFactory emf;
	    private EntityManager em;

	    @Before
	    public void setUp() throws Exception {
	        emf = Persistence.createEntityManagerFactory("WorkoutJPA");
	        em = emf.createEntityManager();
	    }

	    @Test
	    public void test() throws ParseException {
	        Exercise e = em.find(Exercise.class, 1);
	        assertEquals(1, e.getId());
	        assertEquals(1, e.getCategoryId());
	        assertEquals("The best exercise ever", e.getDescription());
	        assertEquals("deadlift", e.getExerciseName());
	        assertEquals(null, e.getImageURL());
	        assertEquals(null, e.getVideoURL());
	        assertEquals(null, e.getUserAssociation());
	   
	    }

	    @After
	    public void tearDown() throws Exception {
	        em.close();
	        emf.close();
	    }

}
