package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Exercise {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "category_id")
	private int categoryId;

	@Column(name = "user_association")
	private Integer userAssociation;

	@Column(name = "exercise_name")
	private String exerciseName;

	private String description;

	@Column(name = "video_url")
	private String videoURL;

	@Column(name = "image_url")
	private String imageURL;

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getUserAssociation() {
		return userAssociation;
	}

	public void setUserAssociation(Integer userAssociation) {
		this.userAssociation = userAssociation;
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

	@Override
	public String toString() {
		return "Exercise [id=" + id + ", categoryId=" + categoryId + ", userAssociation=" + userAssociation
				+ ", exerciseName=" + exerciseName + ", description=" + description + ", videoURL=" + videoURL
				+ ", imageURL=" + imageURL + "]";
	}

}
