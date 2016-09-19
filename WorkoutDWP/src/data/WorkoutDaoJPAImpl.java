package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import entities.Account;
import entities.Address;
import entities.User;

@Transactional
public class WorkoutDaoJPAImpl implements WorkoutDao{

    @PersistenceContext
    private EntityManager em;
    
    @Override
    public boolean userHasAccount(String username, String password) {
    	Account account = em.getReference(Account.class, username);
    	if (account.getPassword().equals(password)) return true;
    	else return false;
	}
    
    @Override
    public boolean userIsAdmin(String username, String password) {
    	
    	Account account = em.getReference(Account.class, username);
    	if (account.getUsername().equals("admin")) return true;
    	else return false;
    }

    @Override
    public User getUser(int id) {
        User user = em.find(User.class, id);
        return user;
    }
    
    @Override
    public User getUser(String username) {
    	User user = new User();
    	return em.find(User.class, user.getAccount().getPassword().equals(username));
    }

    @Override
    public List<User> getAllUsers() {
    	Query query = em.createQuery("SELECT e FROM user e");
    	return (List<User>) query.getResultList();
    }
    
    @Override
    public Account getAccount(int id) {
    	Account account = em.find(Account.class, id);
    	return account;
    }
    
    @Override
    public List<Account> getAllAccounts() {
        Query query = em.createQuery("SELECT e FROM account e");
        return (List<Account>) query.getResultList();
    }
    
    @Override
    public int createUserAccount(Account account, User user, Address address) {
    	if ((em.find(User.class, user.getFirstName()) != null) &&
    	(em.find(User.class, user.getLastName()) != null)) return -1;
    	
    	if ((em.find(Account.class, account.getUsername()) != null) &&
    	(em.find(Account.class, account.getPassword()) != null)) return 0;
    	
    	em.persist(account);
    	user.setAccount(account);
    	em.persist(address);
    	user.setAddress(address);
    	em.persist(user);
    	
    	return 1;
    }
    
    @Override
    public int removeUserAccount(Account account) {

    	if ((em.find(Account.class, account.getUser().getFirstName()) == null) &&
    	(em.find(Account.class, account.getUser().getLastName()) == null)) return -1;
    	
    	em.remove(account.getUser());
    	em.remove(account);
    	
    	return 1;
    }
    
}
