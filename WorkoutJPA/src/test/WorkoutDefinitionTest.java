package test;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Account;
import entities.Exercise;
import entities.Workout;
import entities.WorkoutDefinition;

public class WorkoutDefinitionTest {
	  private EntityManagerFactory emf;
	    private EntityManager em;

	    @Before
	    public void setUp() throws Exception {
	        emf = Persistence.createEntityManagerFactory("WorkoutJPA");
	        em = emf.createEntityManager();
	    }

	    @Test
	    public void test() throws ParseException {
	    	WorkoutDefinition wd = em.find(WorkoutDefinition.class, 1);
	        assertEquals(1, wd.getExerciseSet());
	        
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	        Date expected = formatter.parse("1000-01-01");
	        assertEquals(expected, wd.getDate());
	        
	        assertEquals((Integer)1, wd.getExerciseOrdinal());
	        assertEquals(null, wd.getWeight());
	        assertEquals((Integer)3, wd.getReps());
	        assertEquals(null, wd.getTime());
	        assertEquals(null, wd.getPace());
	        assertEquals(null, wd.getDistance());
	        assertEquals(null, wd.getIncline());
	        assertEquals((Integer)1, wd.getLevel());
	      
	        Account account = wd.getAccount();
	        assertEquals(1, account.getId());
	        
	        Workout workout = wd.getWorkout();
	        assertEquals(1, workout.getId());
	        
	        Exercise exercise = wd.getExercise();
	        assertEquals(14, exercise.getId());
	    }

	    @After
	    public void tearDown() throws Exception {
	        em.close();
	        emf.close();
	    }

}
