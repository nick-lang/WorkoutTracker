package entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "workout_definition")
public class WorkoutDefinition{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "workout_id")
	private Workout workout;

	@ManyToOne
	@JoinColumn(name = "exercise_id")
	private Exercise exercise;

	public Exercise getExercise() {
		return exercise;
	}

	public void setExercise(Exercise exercise) {
		this.exercise = exercise;
	}

	private int set;

	private Date date;

	@ManyToOne
	@JoinColumn(name = "account_association")
	private Account account;

	@Column(name = "exercise_ordinal")
	private Integer exerciseOrdinal;

	private Integer weight;

	private Integer reps;

	private Integer level;

	private Double time;

	private Double pace;

	private Double distance;

	private Double incline;

	public Workout getWorkout() {
		return workout;
	}

	public void setWorkout(Workout workout) {
		this.workout = workout;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
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

	// @Override
	// public String toString() {
	// return "WorkoutDefinition [workoutId=" + workoutId + ", exerciseId=" +
	// exerciseId + ", set=" + set + ", date="
	// + date + ", exerciseOrdinal=" + exerciseOrdinal + ", weight="
	// + weight + ", reps=" + reps + ", level=" + level + ", time=" + time + ",
	// pace=" + pace + ", distance="
	// + distance + ", incline=" + incline + "]";
	// }

}
