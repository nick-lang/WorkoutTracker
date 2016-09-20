package entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Workout {

	@Id
	private int id;

	private String name;

	private String description;
	
	@Column(name = "account_association")
	private Integer accountAssociation;
	

	@OneToMany(mappedBy="workout")
	private List<WorkoutDefinition> workoutDefinitions;
	
	public Integer getAccountAssociation() {
		return accountAssociation;
	}
	
	public void setAccountAssociation(Integer accountAssociation) {
		this.accountAssociation = accountAssociation;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<WorkoutDefinition> getWorkoutDefinitions() {
		return workoutDefinitions;
	}

	public void setWorkoutDefinitions(List<WorkoutDefinition> workoutDefinitions) {
		this.workoutDefinitions = workoutDefinitions;
	}

	public void addWorkoutDefinition(WorkoutDefinition workoutDefinition) {
		if (workoutDefinitions == null) {
			workoutDefinitions = new ArrayList<>();
		}
		if (!workoutDefinitions.contains(workoutDefinition)) {
			workoutDefinitions.add(workoutDefinition);
			if (workoutDefinition.getWorkout() != null){
				workoutDefinition.getWorkout().getWorkoutDefinitions().remove(workoutDefinition);
			}
			workoutDefinition.setWorkout(this);
		}
	}

	public void removeUser(WorkoutDefinition workoutDefinition) {
		workoutDefinition.setWorkout(null);
		if (workoutDefinitions != null) {
			workoutDefinitions.remove(workoutDefinition);
		}
	}

}
