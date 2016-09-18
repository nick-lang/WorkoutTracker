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
import entities.WorkoutDefinition;

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
	        assertEquals("The best exercise ever", e.getDescription());
	        assertEquals("deadlift", e.getExerciseName());
	        assertEquals(null, e.getImageURL());
	        assertEquals(null, e.getVideoURL());
	        
	        List<WorkoutDefinition> ws = e.getWorkoutDefinitions();
	        assertEquals(3, ws.size());
	        
	        Category cat = e.getCategory();
	        assertEquals(1, cat.getId());
	   
	    }

	    @After
	    public void tearDown() throws Exception {
	        em.close();
	        emf.close();
	    }

}
