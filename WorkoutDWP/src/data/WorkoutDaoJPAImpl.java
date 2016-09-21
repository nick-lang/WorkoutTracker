package data;

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

	public void  updateUserAccount(Account account, User user, Address address) {
		
		if (account != null) em.persist(account);
		if (address != null) em.persist(address);
		if (user != null) em.persist(user);
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
		String queryString = "SELECT DISTINCT wd FROM WorkoutDefinition wd WHERE wd.account.id = ?1 AND wd.date = ?2";
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
	public List<Workout> getAdminWorkouts(){
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

}
