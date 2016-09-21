package data;

import java.util.List;

import entities.Account;
import entities.Address;
import entities.User;
import entities.Workout;
import entities.WorkoutDefinition;
import helpers.WorkoutEditor;

public interface WorkoutDao {

	public int createUserAccount(Account account, User user, Address address);

	public void  updateUserAccount(Account account, User user, Address address);

	public Account userHasAccount(String username, String password);

	public boolean userIsAdmin(String username, String password);

	public Account getAccount(int id);

	public List<Account> getAllAccounts();

	public User getUser(int id);

	public User getUser(String username);
	
	public List<User> getAllUsers();

	public int removeUserAccount(int id);

	public Account getAccount(String username);
	
//	Nick
//	3. Pick a preDefined Workout
//	4. Build a new User Designed Workout
	public WorkoutDefinition getUserWorkout(int year, int monthInt, int i, int id);
	
	public List<Workout> getAdminWorkouts();

	public void makeUserWorkoutDef(int year, int month, int day, int accountID, int workoutId);

	public List<WorkoutDefinition> getWorkoutForEdit(int year, int monthInt, int dayInt, int accountId, int workoutId);

	void editWorkout(int year, int month, int day, int accountId, int workoutId, WorkoutEditor catVars);
	
//	Backlog
//	5. Add/Remove Exercises from Predefined or User Designed Workout
//	6. Record the  REPs and SETs performed during the selected Exercise.
//	7. Record past or plan future anticipated workouts through a calendar view.
//	8. User can add personally created Exercises that are not added to overall database.
//	9. Add/Remove Workouts form Calendar.
	
	
}
