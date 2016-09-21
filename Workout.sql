-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema workoutdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `workoutdb` ;

-- -----------------------------------------------------
-- Schema workoutdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `workoutdb` DEFAULT CHARACTER SET utf8 ;
USE `workoutdb` ;

-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL,
  `category_name` VARCHAR(45) NULL,
  `weight` TINYINT(1) NULL,
  `reps` TINYINT(1) NULL,
  `time` TINYINT(1) NULL,
  `pace` TINYINT(1) NULL,
  `distance` TINYINT(1) NULL,
  `incline` TINYINT(1) NULL,
  `level` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exercise` ;

CREATE TABLE IF NOT EXISTS `exercise` (
  `id` INT NOT NULL,
  `exercise_name` VARCHAR(45) NULL,
  `description` VARCHAR(500) NULL,
  `image_url` VARCHAR(500) NULL,
  `video_url` VARCHAR(500) NULL,
  `category_id` INT NULL,
  `account_association` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_category_idx` (`category_id` ASC),
  CONSTRAINT `fk_exercise_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `workout`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `workout` ;

CREATE TABLE IF NOT EXISTS `workout` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(200) NULL,
  `account_association` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `account` ;

CREATE TABLE IF NOT EXISTS `account` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL,
  `address` VARCHAR(45) NULL,
  `address2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip` VARCHAR(15) NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `account_id` INT NOT NULL,
  `gender` VARCHAR(1) NOT NULL,
  `height` DOUBLE NOT NULL,
  `weight` DOUBLE NOT NULL,
  `bmi` DOUBLE NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `age` INT NULL,
  `email` VARCHAR(45) NULL,
  `address_id` INT NULL,
  PRIMARY KEY (`account_id`),
  INDEX `fk_user_address_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_account`
    FOREIGN KEY (`account_id`)
    REFERENCES `account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `workout_definition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `workout_definition` ;

CREATE TABLE IF NOT EXISTS `workout_definition` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `workout_id` INT NOT NULL,
  `exercise_id` INT NOT NULL,
  `set` INT NOT NULL,
  `date` DATE NOT NULL,
  `account_association` INT NOT NULL,
  `exercise_ordinal` INT NOT NULL,
  `weight` INT NULL,
  `reps` INT NULL,
  `time` VARCHAR(45) NULL,
  `pace` VARCHAR(45) NULL,
  `distance` VARCHAR(45) NULL,
  `incline` VARCHAR(45) NULL,
  `level` VARCHAR(45) NULL,
  INDEX `fk_exercise_idx` (`exercise_id` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_ua_account_idx` (`account_association` ASC),
  CONSTRAINT `fk_workout`
    FOREIGN KEY (`workout_id`)
    REFERENCES `workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exercise`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ua_account`
    FOREIGN KEY (`account_association`)
    REFERENCES `account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO admin;
 DROP USER admin;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'admin' IDENTIFIED BY 'admin';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'admin';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `workoutdb`;
INSERT INTO `category` (`id`, `category_name`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (1, 'rest', false, false, true, false, false, false, false);
INSERT INTO `category` (`id`, `category_name`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (4, 'Plyometrics', true, true, true, false, false, false, false);
INSERT INTO `category` (`id`, `category_name`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (2, 'Cardio(outside)', false, false, true, true, true, true, false);
INSERT INTO `category` (`id`, `category_name`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (6, 'Strength', true, true, false, false, false, false, true);
INSERT INTO `category` (`id`, `category_name`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (5, 'Powerlifting', true, true, false, false, false, false, true);
INSERT INTO `category` (`id`, `category_name`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (3, 'Weightlifting', true, true, false, false, false, false, false);
INSERT INTO `category` (`id`, `category_name`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (7, 'Stretching', false, false, true, false, false, false, false);
INSERT INTO `category` (`id`, `category_name`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (8, 'Crossfit', true, true, true, true, true, true, true);
INSERT INTO `category` (`id`, `category_name`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (9, 'Cardio (inside)', false, false, true, true, true, true, true);

COMMIT;


-- -----------------------------------------------------
-- Data for table `exercise`
-- -----------------------------------------------------
START TRANSACTION;
USE `workoutdb`;
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (1, 'rest', NULL, NULL, NULL, 1, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (2, 'Bicycling', 'Cycling offers convenience, cardiovascular benefits, and has less impact than other activities. A 150 lb person will burn about 280 calories cycling at a moderate rate for 30 minutes, compared to 450 calories or more running.', 'http://www.bodybuilding.com/exercises/exerciseImages/sequences/646/Male/m/646_3.jpg', 'http://videocdn.bodybuilding.com/video/mp4/70000/71742m.mp4', 2, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (3, 'Elliptical Trainer', 'Ellipticals offer convenience, cardiovascular benefits, and have far less impact on joints than ground-based cardio such as running. A 150 lb person will burn on average 387 calories in 30 minutes, compared to more than 450-700 calories running. It’s recommended that you use the arms on the elliptical to create more movement, if your elliptical has them.', 'http://www.bodybuilding.com/exercises/exerciseImages/sequences/648/Male/m/648_2.jpg', 'http://videocdn.bodybuilding.com/video/mp4/70000/71772m.mp4', 9, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (4, 'Recumbent Bike', 'Recumbent bikes offer convenience, cardiovascular benefits, and have less impact than other activities. A 150 lb person will burn about 230 calories cycling at a moderate rate for 30 minutes, compared to 450 calories or more running.', 'http://www.bodybuilding.com/exercises/exerciseImages/sequences/650/Male/m/650_1.jpg', 'http://videocdn.bodybuilding.com/video/mp4/70000/71812m.mp4', 9, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (5, 'Trail Running/Walking', 'Running or hiking on trails will get the blood pumping and heart beating almost immediately. Make sure you have good shoes. While you use the muscles in your calves and buttocks to pull yourself up a hill, the knees, joints and ankles absorb the bulk of the pounding coming back down. Take smaller steps as you walk downhill, keep your knees bent to reduce the impact and slow down to avoid falling.', 'http://www.bodybuilding.com/exercises/exerciseImages/sequences/657/Male/m/657_1.jpg', 'http://videocdn.bodybuilding.com/video/mp4/72000/72402m.mp4', 2, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (6, 'Hang Snatch', 'With a snatch grip, lift the bar to the standing position. Lower the bar under control to the chosen hang position (most often mid-thigh, knee or right below the knee). Once reaching the hang position, initiate the snatch by pushing against the floor with the legs first. Drive the legs against the floor and extend the hips aggressively, keeping the bar in close proximity to the body and bringing it into contact with the hips as you reach complete extension. After extending, pick up and move your feet into your squat stance while pulling your elbows high and to the sides to move yourself down into a squat under the bar while keeping the bar and your body as close to each other as possible. Punch straight up against the bar overhead as you sit into the squat, stabilize, and recover to a standing position with the bar overhead.', 'http://www.bodybuilding.com/exercises/exerciseImages/sequences/690/Male/m/690_3.jpg', 'http://videocdn.bodybuilding.com/video/mp4/76000/77602m.mp4', 3, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (7, 'Kneeling Jump Squat', 'Jump training is one of the best and easiest ways to develop explosive power. Begin kneeling on the floor with a barbell racked across the back of your shoulders, or you can use your body weight for this exercise. This can be done inside of a power rack to make unracking easier.', 'http://www.bodybuilding.com/exercises/exerciseImages/sequences/749/Male/m/749_2.jpg', 'http://videocdn.bodybuilding.com/video/mp4/76000/76872m.mp4', 3, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (8, 'Bar Push-Up Smith Machine', 'Basic push-up using an incline device.', 'http://www.bodybuilding.com/exercises/exerciseImages/sequences/4951/Male/m/4951_1.jpg', 'http://videocdn.bodybuilding.com/video/mp4/122000/122831m.mp4', 4, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (9, 'Catch and Overhead Throw', 'Also known as the Medicine Ball Throw. Ensure that you follow your throw through, being prepared to receive your rebound from your throw. If you are throwing against the wall, make sure that you stand close enough to the wall to receive the rebound, and aim a little higher than you would with a partner.', 'http://www.bodybuilding.com/exercises/exerciseImages/sequences/768/Male/m/768_1.jpg', 'http://videocdn.bodybuilding.com/video/mp4/90000/91192m.mp4', 4, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (10, 'Band Good Morning (Pull Through)', 'This exercise builds the hamstrings. Start by looping a band around a post. Standing a little ways away, loop the opposite end around the neck. Your hands can help hold the band in position. Watch the video for details.', 'http://www.bodybuilding.com/exercises/exerciseImages/sequences/740/Male/m/740_1.jpg', 'http://videocdn.bodybuilding.com/video/mp4/78000/78842m.mp4', 5, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (11, 'Deadlift with Bands', 'To deadlift with short bands, simply loop them over the bar before you start, and step into them to set up. For long bands, they will need to be anchored to a secure base, such as heavy dumbbells or a rack.', 'http://www.bodybuilding.com/exercises/exerciseImages/sequences/677/Male/m/677_2.jpg', 'http://videocdn.bodybuilding.com/video/mp4/76000/77122m.mp4', 5, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (12, 'Alternating Deltoid Raise', 'This exercise isolates the shoulder muscle group. Start in a standing position, with a pair of dumbbells at your side. Keeping your elbows slightly bent, raise the weights directly in front of you to shoulder height, avoiding any swinging or cheating. Return the weights to your side. On the next repetition, raise the weights laterally, raising them out to your side to about shoulder height. Return the weights to the starting position and continue alternating to the front and side.', 'http://www.bodybuilding.com/exercises/exerciseImages/sequences/880/Male/m/880_4.jpg', 'http://videocdn.bodybuilding.com/video/mp4/94000/94162m.mp4', 6, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (13, 'Ball Leg Curl', 'This exercise isolates the hamstrings. Start by laying on your back with your feet on top of the ball.\nPosition the ball so that when your legs are extended your ankles are on top of the ball. This will be your starting position.\nRaise your hips off of the ground, keeping your weight on the shoulder blades and your feet.\nFlex the knees, pulling the ball as close to you as you can, contracting the hamstrings.\nAfter a brief pause, return to the starting position.', 'http://www.bodybuilding.com/exercises/exerciseImages/sequences/861/Male/m/861_2.jpg', 'http://videocdn.bodybuilding.com/video/mp4/92000/93962m.mp4', 6, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (14, 'Cat Stretch', 'Also Known As: Back Stretch', 'http://www.bodybuilding.com/exercises/exerciseImages/sequences/392/Male/m/392_2.jpg', 'http://videocdn.bodybuilding.com/video/mp4/58000/59672m.mp4', 7, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (15, 'Chest and front of shoulder Stretch', 'Also Known As: broomstick stretch', 'http://www.bodybuilding.com/exercises/exerciseImages/sequences/421/Male/m/421_2.jpg', 'http://videocdn.bodybuilding.com/video/mp4/58000/59722m.mp4', 7, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (16, 'Farmer\'s Walk', 'Also Known As: Farmer\'s Carry', 'http://www.bodybuilding.com/exercises/exerciseImages/sequences/682/Male/m/682_2.jpg', 'http://videocdn.bodybuilding.com/video/mp4/76000/77312m.mp4', 8, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (17, 'Sled Drag - Harness', 'Also Known As: Sled Pull', 'http://www.bodybuilding.com/exercises/exerciseImages/sequences/713/Male/m/713_1.jpg', 'http://videocdn.bodybuilding.com/video/mp4/76000/77942m.mp4', 8, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `workout`
-- -----------------------------------------------------
START TRANSACTION;
USE `workoutdb`;
INSERT INTO `workout` (`id`, `name`, `description`, `account_association`) VALUES (1, 'Strength', NULL, 1);
INSERT INTO `workout` (`id`, `name`, `description`, `account_association`) VALUES (2, 'Bodyweight', NULL, 1);
INSERT INTO `workout` (`id`, `name`, `description`, `account_association`) VALUES (3, 'Cardio', NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `account`
-- -----------------------------------------------------
START TRANSACTION;
USE `workoutdb`;
INSERT INTO `account` (`id`, `username`, `password`) VALUES (1, 'admin', 'admin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `workoutdb`;
INSERT INTO `address` (`id`, `address`, `address2`, `city`, `state`, `zip`, `phone`) VALUES (1, 'place street', 'other place', 'denver', 'CO', '12345', '1234567');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `workoutdb`;
INSERT INTO `user` (`account_id`, `gender`, `height`, `weight`, `bmi`, `first_name`, `last_name`, `age`, `email`, `address_id`) VALUES (1, 'm', 73, 175, 22.5, 'nick', 'lang', 27, 'thisistotallyanemail', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `workout_definition`
-- -----------------------------------------------------
START TRANSACTION;
USE `workoutdb`;
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (1, 1, 14, 1, '1000-01-01', 1, 1, NULL, 3, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (2, 1, 15, 1, '1000-01-01', 1, 2, NULL, 3, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (3, 1, 11, 2, '1000-01-01', 1, 3, 45, 3, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (4, 1, 11, 1, '1000-01-01', 1, 4, 55, 3, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (5, 1, 1, 1, '1000-01-01', 1, 5, NULL, NULL, '2', NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (6, 1, 12, 3, '1000-01-01', 1, 6, 30, 3, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (7, 1, 1, 1, '1000-01-01', 1, 7, NULL, NULL, '2', NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (8, 1, 8, 3, '1000-01-01', 1, 8, NULL, 10, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (9, 1, 1, 1, '1000-01-01', 1, 9, NULL, NULL, '2', NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (10, 1, 9, 3, '1000-01-01', 1, 10, 10, 3, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (11, 1, 1, 1, '1000-01-01', 1, 11, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (12, 1, 6, 3, '1000-01-01', 1, 12, 25, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (13, 1, 14, 1, '1000-01-01', 1, 13, NULL, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (14, 1, 15, 1, '1000-01-01', 1, 14, NULL, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (15, 3, 14, 1, '1000-01-01', 1, 1, NULL, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (16, 3, 15, 1, '1000-01-01', 1, 2, NULL, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (17, 3, 5, 1, '1000-01-01', 1, 3, NULL, NULL, '45', '3', NULL, NULL, NULL);
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (18, 2, 14, 1, '1000-01-01', 1, 1, NULL, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (19, 2, 15, 1, '1000-01-01', 1, 2, NULL, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (20, 2, 3, 1, '1000-01-01', 1, 3, NULL, NULL, '10', NULL, '2', NULL, NULL);
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (21, 2, 8, 4, '1000-01-01', 1, 4, NULL, 10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (22, 2, 1, 1, '1000-01-01', 1, 5, NULL, NULL, '5', NULL, NULL, NULL, NULL);
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (23, 2, 9, 3, '1000-01-01', 1, 6, 10, 3, NULL, NULL, NULL, NULL, NULL);

COMMIT;

