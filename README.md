# WorkoutTracker
Created by:
Rod Hammond
Nick Lang

This is our week 9 project for Skill Distillery. Workout Tracker is a persistant web application that utilizes Spring MVC, JPA, MySQL, and HTML/CSS. Workout Tracker allows a logged in user the ability to track their workouts in a calendar view. Users are also able to edit the stats about their workouts such as weight and reps.

This project can be found running at:
http://rodhammond.info:8080/WorkoutDWP

## Future Features
#### Workouts:
List workouts

Create customizable workout plans

#### Exercise:
Add new exercises

Partnering relationship with local fitness orgs

Using fitness API’s to pull new information

#### Nutrition:
Meal planning

Calorie tracking

##Stumbling Points
We initially attempted to make the workout tracking table of our database use a composite primary key, but did not have enough time to fully implement this concept. As our database grows, this table will become the bottleneck of our application. With a time complexity of n, this could be improved to ![Alt text](http://www.sciweavers.org/tex2img.php?eq=%20%5CTheta%20%20%5Cbig%28log%20%5Cbig%28n%5Cbig%29%20%5Cbig%29%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0) by using the table with a composite key. This is because when SQL is searching for only primary keys it uses a binary tree searching method.
