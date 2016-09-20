package data;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import entities.Account;
import entities.Address;
import entities.User;
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
		Query query = em.createQuery("SELECT u FROM User u");
		return (List<User>) query.getResultList();
	}

	public Account getAccount(int id) {
		Account account = em.find(Account.class, id);
		return account;
	}

	public List<Account> getAllAccounts() {
		Query query = em.createQuery("SELECT a FROM Account a");
		return (List<Account>) query.getResultList();
	}

	public int createUserAccount(Account account, User user, Address address) {
		if ((em.find(User.class, user.getFirstName()) != null) && (em.find(User.class, user.getLastName()) != null))
			return -1;

		if ((em.find(Account.class, account.getUsername()) != null)
				&& (em.find(Account.class, account.getPassword()) != null))
			return 0;

		em.persist(account);
		user.setAccount(account);
		em.persist(address);
		user.setAddress(address);
		em.persist(user);

		return 1;
	}

	public int removeUserAccount(Account account) {

		if ((em.find(Account.class, account.getUser().getFirstName()) == null)
				&& (em.find(Account.class, account.getUser().getLastName()) == null))
			return -1;

		em.remove(account.getUser());
		em.remove(account);

		return 1;
	}

	@Override
	public WorkoutDefinition getUserWorkouts(int y, int m, int d, int accountId) {
		String queryString = "SELECT DISTINCT wd FROM WorkoutDefinition wd WHERE wd.account.id = ?1 AND wd.date = ?2";
		Date date = new Date(y - 1900, m - 1, d);
//		System.out.println("" + date);
		try{
		WorkoutDefinition result = em.createQuery(queryString, WorkoutDefinition.class)
				.setParameter(1, accountId)
				.setParameter(2, date)
				.getSingleResult();
//		System.out.println("Found!");
//		System.out.println(result.getSet());
		return result;
		}
		catch(NoResultException e){
			return null;
		}
		
	}

}
