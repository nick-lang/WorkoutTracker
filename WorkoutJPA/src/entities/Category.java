package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="category_name")
	private String categoryName;
	
	@OneToMany(mappedBy="category")
	private List<Exercise> exercises;
	
	private Boolean reps;

	private Boolean time;
	
	private Boolean pace;
	
	private Boolean distance;
	
	private Boolean weight;
	
	private Boolean incline;
	
	private Boolean level;

	public List<Exercise> getExercises() {
		return exercises;
	}

	public void setExercises(List<Exercise> exercises) {
		this.exercises = exercises;
	}

	public Boolean getWeight() {
		return weight;
	}

	public void setWeight(Boolean weight) {
		this.weight = weight;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Boolean getReps() {
		return reps;
	}

	public void setReps(Boolean reps) {
		this.reps = reps;
	}

	public Boolean getTime() {
		return time;
	}

	public void setTime(Boolean time) {
		this.time = time;
	}

	public Boolean getPace() {
		return pace;
	}

	public void setPace(Boolean pace) {
		this.pace = pace;
	}

	public Boolean getDistance() {
		return distance;
	}

	public void setDistance(Boolean distance) {
		this.distance = distance;
	}

	public Boolean getIncline() {
		return incline;
	}

	public void setIncline(Boolean incline) {
		this.incline = incline;
	}

	public Boolean getLevel() {
		return level;
	}

	public void setLevel(Boolean level) {
		this.level = level;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", categoryName=" + categoryName + ", reps=" + reps + ", time=" + time + ", pace="
				+ pace + ", distance=" + distance + ", weight=" + weight + ", incline=" + incline + ", level=" + level
				+ "]";
	}

}
