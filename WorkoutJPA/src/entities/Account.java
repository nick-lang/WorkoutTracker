package entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Account {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@OneToOne(mappedBy="account")
	private User user;
	
	private String username;
	private String password;
	
	@OneToMany(mappedBy="account")
	private List<WorkoutDefinition> workoutDefinitions;

	public List<WorkoutDefinition> getWorkoutDefinitions() {
		return workoutDefinitions;
	}
	public void setWorkoutDefinitions(List<WorkoutDefinition> workoutDefinitions) {
		this.workoutDefinitions = workoutDefinitions;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public int getId() {
		return id;
	}
	
//	@Override
//	public String toString() {
//		return "User [id=" + id + ", username=" + username + ", password=" + password + "]";
//	}
	
	
}
