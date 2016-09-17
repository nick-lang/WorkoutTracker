package entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="workout_definition")
public class WorkoutDefinition {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="workout_id")
	private int workoutId;
	
	@Column(name="exercise_id")
	private int exerciseId;
	
	private int set;
	
	private Date date;
	
	@Column(name="user_association")
	private int userAssociation;
	
	@Column(name="exercise_ordinal")
	private Integer exerciseOrdinal;

	private Integer weight;
	
	private Integer reps;
	
	private Integer level;
	
	private Double time;
	
	private Double pace;
	
	private Double distance;
	
	private Double incline;

	public int getWorkoutId() {
		return workoutId;
	}

	public void setWorkoutId(int workoutId) {
		this.workoutId = workoutId;
	}

	public int getExerciseId() {
		return exerciseId;
	}

	public void setExerciseId(int exerciseId) {
		this.exerciseId = exerciseId;
	}

	public int getSet() {
		return set;
	}

	public void setSet(int set) {
		this.set = set;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getUserAssociation() {
		return userAssociation;
	}

	public void setUserAssociation(int userAssociation) {
		this.userAssociation = userAssociation;
	}

	public Integer getExerciseOrdinal() {
		return exerciseOrdinal;
	}

	public void setExerciseOrdinal(Integer exerciseOrdinal) {
		this.exerciseOrdinal = exerciseOrdinal;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public Integer getReps() {
		return reps;
	}

	public void setReps(Integer reps) {
		this.reps = reps;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Double getTime() {
		return time;
	}

	public void setTime(Double time) {
		this.time = time;
	}

	public Double getPace() {
		return pace;
	}

	public void setPace(Double pace) {
		this.pace = pace;
	}

	public Double getDistance() {
		return distance;
	}

	public void setDistance(Double distance) {
		this.distance = distance;
	}

	public Double getIncline() {
		return incline;
	}

	public void setIncline(Double incline) {
		this.incline = incline;
	}

	@Override
	public String toString() {
		return "WorkoutDefinition [workoutId=" + workoutId + ", exerciseId=" + exerciseId + ", set=" + set + ", date="
				+ date + ", userAssociation=" + userAssociation + ", exerciseOrdinal=" + exerciseOrdinal + ", weight="
				+ weight + ", reps=" + reps + ", level=" + level + ", time=" + time + ", pace=" + pace + ", distance="
				+ distance + ", incline=" + incline + "]";
	}
	
}
