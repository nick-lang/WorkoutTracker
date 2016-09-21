package data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Stack;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.Account;
import entities.Address;
import entities.User;
import entities.Workout;
import entities.WorkoutDefinition;
import helpers.WorkoutEditor;

@Transactional
public class WorkoutDaoJPAImpl implements WorkoutDao {

	@PersistenceContext
	private EntityManager em;

	public Account userHasAccount(String username, String password) {

		String queryString = "SELECT a FROM Account a JOIN FETCH User u on u.accountId = a.id WHERE a.username = ?1 AND a.password = ?2";

		List<Account> results = em.createQuery(queryString, Account.class).setParameter(1, username)
				.setParameter(2, password).getResultList();

		System.out.println("Accounts List: " + results);

		if ((results.size() > 1) || (results.size() == 0))
			return null;
		else
			return results.get(0);
	}

	public boolean userIsAdmin(String username, String password) {

		Account result = userHasAccount(username, password);
		if ((result.getUsername().equals("admin") && (result.getPassword().equals("admin"))))
			return true;
		else
			return false;
	}

	public User getUser(int id) {
		System.out.println("I'm here @ getuser WorkoutDaoJPA");
		User user = em.find(User.class, id);
		return user;
	}

	public User getUser(String username) {
		String queryString = "SELECT u FROM User u JOIN FETCH Account a on u.accountId = a.id WHERE a.username = ?1";

		List<User> results = em.createQuery(queryString, User.class).setParameter(1, username).getResultList();

		if ((results.size() > 1) || (results.size() == 0))
			return null;
		else
			return results.get(0);
	}

	public List<User> getAllUsers() {
		List<User> results = em.createQuery("SELECT u FROM User u", User.class).getResultList();
		return results;
	}

	public Account getAccount(int id) {
		Account account = em.find(Account.class, id);
		return account;
	}

	public Account getAccount(String username) {
		String queryString = "SELECT a FROM Account a JOIN FETCH User u on u.accountId = a.id WHERE a.username = ?1";

		List<Account> results = em.createQuery(queryString, Account.class).setParameter(1, username).getResultList();

		if ((results.size() > 1) || (results.size() == 0))
			return null;
		else
			return results.get(0);
	}

	public List<Account> getAllAccounts() {
		List<Account> results = em.createQuery("SELECT a FROM Account a", Account.class).getResultList();
		return results;
	}

	public int createUserAccount(Account account, User user, Address address) {

		List<User> currentUsers = getAllUsers();
		if ((currentUsers.contains(user.getFirstName())) && (currentUsers.contains(user.getLastName()))) {
			System.out.println("Account not created: User name already exists");
			return -1;
		}

		List<Account> currentAccounts = getAllAccounts();
		if (currentAccounts.contains(account.getUsername())) {
			System.out.println("Account not created: username already exists");
			return 0;
		}

		em.persist(account);
		user.setAccountId(account.getId());
		user.setAccount(account);
		account.setUser(user);
		address.setId(account.getId());
		address.addUser(user);
		em.persist(address);
		em.persist(user);
		System.out.println("Account Record Created");
		return 1;
	}

	public void updateUserAccount(Account account, User user, Address address) {

		if (account != null)
			em.merge(account);
		if (address != null)
			em.merge(address);
		if (user != null)
			em.merge(user);
		System.out.println("Account Record Updated");
	}

	public int removeUserAccount(int id) {
		Account account = em.find(Account.class, id);
		User user = em.find(User.class, id);
		Address address = em.find(Address.class, id);

		if (userHasAccount(account.getUsername(), account.getPassword()) != null) {
			em.remove(address);
			em.remove(user);
			em.remove(account);
			System.out.println("Account Record Removed");
			return 1;
		} else
			System.out.println("No Record Found");
		return -1;
	}

	@Override
	public WorkoutDefinition getUserWorkout(int y, int m, int d, int accountId) {
		String queryString = "SELECT wd FROM WorkoutDefinition wd WHERE wd.account.id = ?1 AND wd.date = ?2 AND wd.exerciseOrdinal = 1";
		Date date = new Date(y - 1900, m - 1, d);
		// System.out.println("" + date);
		try {
			WorkoutDefinition result = em.createQuery(queryString, WorkoutDefinition.class).setParameter(1, accountId)
					.setParameter(2, date).getSingleResult();
			// System.out.println("Found!");
			// System.out.println(result.getSet());
			return result;
		} catch (NoResultException e) {
			return null;
		}

	}

	@Override
	public List<Workout> getAdminWorkouts() {
		String queryString = "SELECT DISTINCT w FROM Workout w WHERE accountAssociation = 1";

		try {
			List<Workout> results = em.createQuery(queryString, Workout.class).getResultList();
			// System.out.println("Found!");
			System.out.println(results.size());
			return results;
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public void makeUserWorkoutDef(int year, int month, int day, int accountID, int workoutId) {
		String queryString = "SELECT wd FROM WorkoutDefinition wd WHERE date = ?1 AND wd.account.id = 1 AND wd.workout.id = ?2";
		Date date = new Date(1000 - 1900, 1 - 1, 1);
		System.out.println("in makeUserWorkoutDef");

		List<WorkoutDefinition> results = new ArrayList<>();
		try {
			results = em.createQuery(queryString, WorkoutDefinition.class).setParameter(1, date)
					.setParameter(2, workoutId).getResultList();
			// System.out.println(results);
			// System.out.println(results.size());
		} catch (NoResultException e) {
		}

		date = new Date(year - 1900, month - 1, day);
		for (WorkoutDefinition wd : results) {

			WorkoutDefinition newWd = new WorkoutDefinition();
			newWd.setWorkout(wd.getWorkout());
			newWd.setExercise(wd.getExercise());
			newWd.setExerciseSet(wd.getExerciseSet());
			newWd.setDate(date);
			newWd.setAccount(getAccount(accountID));
			newWd.setExerciseOrdinal(wd.getExerciseOrdinal());
			System.out.println("Account set" + newWd);
			em.persist(newWd);
		}
	}

	@Override
	public List<WorkoutDefinition> getWorkoutForEdit(int year, int monthInt, int dayInt, int accountId, int workoutId) {
		String queryString = "SELECT wd FROM WorkoutDefinition wd WHERE wd.account.id = ?1 AND wd.date = ?2 ORDER BY exerciseOrdinal ASC";
		Date date = new Date(year - 1900, monthInt - 1, dayInt);

		System.out.println("in getWorkoutForEdit");

		List<WorkoutDefinition> results = new ArrayList<>();

		results = em.createQuery(queryString, WorkoutDefinition.class).setParameter(1, accountId).setParameter(2, date)
				.getResultList();
		System.out.println(results);
		return results;
	}

	@Override
	public void editWorkout(int year, int month, int day, int accountId, int workoutId, WorkoutEditor catVars) {

		String queryString = "SELECT wd FROM WorkoutDefinition wd WHERE wd.account.id = ?1 AND wd.date = ?2 ORDER BY exerciseOrdinal ASC";
		Date date = new Date(year - 1900, month - 1, day);

		List<WorkoutDefinition> results = new ArrayList<>();
		results = em.createQuery(queryString, WorkoutDefinition.class).setParameter(1, accountId).setParameter(2, date)
				.getResultList();

		int listCounter = 0;
		for (WorkoutDefinition exercise : results) {
			if (exercise.getExercise().getCategory().getWeight()) {
				exercise.setWeight(Integer.parseInt(catVars.getWorkoutList().get(listCounter)));
				listCounter++;
				em.merge(exercise);
			}
			if (exercise.getExercise().getCategory().getReps()) {
				exercise.setReps(Integer.parseInt(catVars.getWorkoutList().get(listCounter)));
				listCounter++;
				em.merge(exercise);
			}
			if (exercise.getExercise().getCategory().getTime()) {
				exercise.setTime(Double.parseDouble(catVars.getWorkoutList().get(listCounter)));
				listCounter++;
				em.merge(exercise);
			}
			if (exercise.getExercise().getCategory().getPace()) {
				exercise.setPace(Double.parseDouble(catVars.getWorkoutList().get(listCounter)));
				listCounter++;
				em.merge(exercise);
			}
			if (exercise.getExercise().getCategory().getDistance()) {
				exercise.setDistance(Double.parseDouble(catVars.getWorkoutList().get(listCounter)));
				listCounter++;
				em.merge(exercise);
			}
			if (exercise.getExercise().getCategory().getIncline()) {
				exercise.setIncline(Double.parseDouble(catVars.getWorkoutList().get(listCounter)));
				listCounter++;
				em.merge(exercise);
			}
			if (exercise.getExercise().getCategory().getLevel()) {
				exercise.setLevel(Integer.parseInt(catVars.getWorkoutList().get(listCounter)));
				listCounter++;
				em.merge(exercise);
			}

		}

	}

	@Override
	public void deleteWorkout(int year, int month, int day, int accountId) {
		String queryString = "SELECT wd FROM WorkoutDefinition wd WHERE wd.account.id = ?1 AND wd.date = ?2";
		Date date = new Date(year - 1900, month - 1, day);

		List<WorkoutDefinition> results = new ArrayList<>();
		results = em.createQuery(queryString, WorkoutDefinition.class).setParameter(1, accountId).setParameter(2, date)
				.getResultList();
		
		for (WorkoutDefinition exercise : results) {
			em.remove(exercise);
		}
	}

}
