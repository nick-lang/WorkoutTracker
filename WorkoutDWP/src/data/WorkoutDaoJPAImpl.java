package data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.Account;
import entities.Address;
import entities.User;
import entities.Workout;
import entities.WorkoutDefinition;

@Transactional
public class WorkoutDaoJPAImpl implements WorkoutDao {

	@PersistenceContext
	private EntityManager em;

	public Account userHasAccount(String username, String password) {

		String queryString = "SELECT a FROM Account a JOIN FETCH User u on u.accountId = a.id WHERE a.username = ?1 AND a.password = ?2";

		List<Account> results = em.createQuery(queryString, Account.class).setParameter(1, username)
				.setParameter(2, password).getResultList();

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
		// Query query = em.createQuery("SELECT u FROM User u");
		// return (List<User>) query.getResultList();
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
		// Query query = em.createQuery("SELECT a FROM Account a");
		// return (List<Account>) query.getResultList();
	}

	public int createUserAccount(Account account, User user, Address address) {
		//
		System.out.println("Here #1 in createUserAccount");
		List<User> currentUsers = getAllUsers();
		System.out.println("All Current Users: " + currentUsers);
		List<Account> currentAccounts = getAllAccounts();
		System.out.println("All Current Accounts: " + currentAccounts);

		if ((currentUsers.contains(user.getFirstName())) && (currentUsers.contains(user.getLastName()))) {
			System.out.println("Account not created: User name already exists");
			//
			// if ((em.find(User.class, user.getFirstName()) != null) &&
			// (em.find(User.class, user.getLastName()) != null))
			return -1;
		}
		if ((currentAccounts.contains(account.getUsername())) && (currentAccounts.contains(account.getPassword()))) {
			System.out.println("Account not created: Account username and password already exists");
			// if ((em.find(Account.class, account.getUsername()) != null)
			// && (em.find(Account.class, account.getPassword()) != null))
			return 0;
		}
		System.out.println("Here #2 in createUserAccount");
		em.persist(account);
		System.out.println("accountID: " + account.getId());
		System.out.println("account object: " + account);

		System.out.println("Here #3 in createUserAccount");
		user.setAccountId(account.getId());
		user.setAccount(account);
		System.out.println("user object: " + user);
		System.out.println("userID: " + user.getAccountId());
		address.setId(account.getId());
		account.setUser(user);
		address.addUser(user);
		// account.getUser().setAddress(address);
		// user.setAddress(address);
		System.out.println("Here #4 in createUserAccount");
		System.out.println("address.getUsers().size(): " + address.getUsers().size());
		System.out.println("user.getAddress(): " + user.getAddress());
		em.persist(address);
		System.out.println("Here #5 in createUserAccount");
		em.persist(user);
		return 1;
	}

	public int removeUserAccount(Account account) {
		if (userHasAccount(account.getUsername(), account.getPassword()) != null) {
			em.remove(account.getUser().getAddress());
			em.remove(account.getUser().getAccount());
			em.remove(account.getUser());
			System.out.println("Account removed!");
			return 1;
		} else
			return -1;

		// if ((em.find(Account.class, account.getUser().getFirstName()) ==
		// null)
		// && (em.find(Account.class, account.getUser().getLastName()) == null))
		// return -1;
		//
		// em.remove(account.getUser());
		// em.remove(account);
		//
		// return 1;
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
//			 System.out.println(results);
//			System.out.println(results.size());
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

}
