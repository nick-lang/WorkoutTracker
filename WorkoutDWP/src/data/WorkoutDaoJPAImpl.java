package data;



import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.Account;
import entities.Address;
import entities.User;

@Transactional
public class WorkoutDaoJPAImpl implements WorkoutDao{

    @PersistenceContext
    private EntityManager em;

    @Override
    public void createUserAccount(Account account, User user, Address address) {
    }
    
    @Override
	public void userAccountAuthinacation(int user_id) {
	}
    
    
	
	
}
