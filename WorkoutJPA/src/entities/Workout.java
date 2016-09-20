package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Workout {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;
	
	@Column(name = "account_association")
	private Integer accountAssociation;
	
	public Integer getAccountAssociation() {
		return accountAssociation;
	}

	public void setAccountAssociation(Integer accountAssociation) {
		this.accountAssociation = accountAssociation;
	}

	@OneToMany(mappedBy="workout")
	private List<WorkoutDefinition> workoutDefinitions;

	public List<WorkoutDefinition> getWorkoutDefinitions() {
		return workoutDefinitions;
	}

	public void setWorkoutDefinitions(List<WorkoutDefinition> workoutDefinitions) {
		this.workoutDefinitions = workoutDefinitions;
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

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Workout [id=" + id + ", name=" + name + ", description=" + description + "]";
	}

}
