package entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Account {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@OneToOne(mappedBy = "account", fetch=FetchType.EAGER)
	private User user;

	private String username;
	private String password;

	@OneToMany(mappedBy = "account")
	private List<WorkoutDefinition> workoutDefinitions;

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

	public List<WorkoutDefinition> getWorkoutDefinitions() {
		return workoutDefinitions;
	}

	public void setWorkoutDefinitions(List<WorkoutDefinition> workoutDefinitions) {
		this.workoutDefinitions = workoutDefinitions;
	}

	public int getId() {
		return id;
	}

	public void addWorkoutDefinition(WorkoutDefinition workoutDefinition) {
		if (workoutDefinitions == null) {
			workoutDefinitions = new ArrayList<>();
		}
		if (!workoutDefinitions.contains(workoutDefinition)) {
			workoutDefinitions.add(workoutDefinition);
			if (workoutDefinition.getAccount() != null){
				workoutDefinition.getAccount().getWorkoutDefinitions().remove(workoutDefinition);
			}
			workoutDefinition.setAccount(this);
		}
	}

	public void removeWorkoutDefinition(WorkoutDefinition workoutDefinition) {
		workoutDefinition.setAccount(null);
		if (workoutDefinitions != null) {
			workoutDefinitions.remove(workoutDefinition);
		}
	}


}
