package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Exercise {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;

	@OneToMany(mappedBy="exercise")
	private List<WorkoutDefinition> workoutDefinitions;

	@Column(name = "exercise_name")
	private String exerciseName;

	private String description;

	@Column(name = "video_url")
	private String videoURL;

	@Column(name = "image_url")
	private String imageURL;

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

	public int getId() {
		return id;
	}

//	@Override
//	public String toString() {
//		return "Exercise [id=" + id + ", categoryId=" + categoryId + ", account=" + account + ", exerciseName="
//				+ exerciseName + ", description=" + description + ", videoURL=" + videoURL + ", imageURL=" + imageURL
//				+ "]";
//	}

}
