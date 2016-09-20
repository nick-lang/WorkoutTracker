package entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Exercise {

	@Id
	private int id;

	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;

	@OneToMany(mappedBy = "exercise")
	private List<WorkoutDefinition> workoutDefinitions;

	@Column(name = "exercise_name")
	private String exerciseName;

	private String description;

	@Column(name = "video_url")
	private String videoURL;

	@Column(name = "image_url")
	private String imageURL;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<WorkoutDefinition> getWorkoutDefinitions() {
		return workoutDefinitions;
	}

	public void setWorkoutDefinitions(List<WorkoutDefinition> workoutDefinitions) {
		this.workoutDefinitions = workoutDefinitions;
	}

	public String getExerciseName() {
		return exerciseName;
	}

	public void setExerciseName(String exerciseName) {
		this.exerciseName = exerciseName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getVideoURL() {
		return videoURL;
	}

	public void setVideoURL(String videoURL) {
		this.videoURL = videoURL;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public void addWorkoutDefinition(WorkoutDefinition workoutDefinition) {
		if (workoutDefinitions == null) {
			workoutDefinitions = new ArrayList<>();
		}
		if (!workoutDefinitions.contains(workoutDefinition))
			if (workoutDefinition.getExercise() != null) {
				workoutDefinition.getExercise().getWorkoutDefinitions().remove(workoutDefinition);
			}
		workoutDefinition.setExercise(this);
	}

	public void removeUser(WorkoutDefinition workoutDefinition) {
		workoutDefinition.setExercise(null);
		if (workoutDefinitions != null) {
			workoutDefinitions.remove(workoutDefinition);
		}
	}


	
}
