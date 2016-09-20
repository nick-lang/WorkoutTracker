package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.transaction.annotation.Transactional;

import entities.Account;
import entities.Address;
import entities.User;

@Transactional
public class WorkoutDaoJPAImpl implements WorkoutDao {

	@PersistenceContext
	private EntityManager em;

	public Account userHasAccount(String username, String password) {

		String queryString = "SELECT a FROM Account a JOIN FETCH User u on u.accountId = a.id WHERE a.username = ?1 AND a.password = ?2";

		List <Account> results = em.createQuery(queryString, Account.class)
				.setParameter(1, username)
				.setParameter(2, password)
				.getResultList();
		
		 if ((results.size() > 1) || (results.size() == 0)) return null;
		 else return results.get(0);
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
		List<User> results = em.createQuery("SELECT u FROM User u",User.class).getResultList();
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
		List<Account> results = em.createQuery("SELECT a FROM Account a",Account.class).getResultList();
		return results;
	}

	public int createUserAccount(Account account, User user, Address address) {
		System.out.println("Here #1 in createUserAccount");
		List<User> currentUsers = getAllUsers();
		System.out.println("All Current Users: " + currentUsers);
		List<Account> currentAccounts = getAllAccounts();
		System.out.println("All Current Accounts: " + currentAccounts);
		
		if ((currentUsers.contains(user.getFirstName())) && (currentUsers.contains(user.getLastName())))
			{
			System.out.println("Account not created: User name already exists");
			return -1;
			}

		if ((currentAccounts.contains(account.getUsername())) && (currentAccounts.contains(account.getPassword())))
			{
			System.out.println("Account not created: Account username and password already exists");
			return 0;
			}

		System.out.println("Here #2 in createUserAccount");
		System.out.println("account object: " + account);
		em.persist(account);
		
		System.out.println("Here #3 in createUserAccount");
		user.setAccountId(account.getId());
		account.setUser(user);
		user.setAccount(account);
		address.setId(account.getId());
		account.getUser().setAddress(address);
		
		System.out.println("Here #4 in createUserAccount");
	    em.persist(address);
	    System.out.println("Here #5 in createUserAccount");
		em.persist(user);
		return 1;
	}

	public int removeUserAccount(Account account) {

		if (userHasAccount(account.getUsername(), account.getPassword()) != null)
		{
			em.remove(account.getUser().getAddress());
			em.remove(account.getUser().getAccount());
			em.remove(account.getUser());
			System.out.println("Account removed!");
			return 1;
		} else return -1;
		
	}

}
