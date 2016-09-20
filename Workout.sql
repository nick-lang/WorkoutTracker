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
  `description` VARCHAR(200) NULL,
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
  `exercise_set` INT NOT NULL,
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
  INDEX `fk_ua_workout_idx` (`account_association` ASC),
  PRIMARY KEY (`id`),
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
INSERT INTO `category` (`id`, `category_name`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (1, 'weights', true, true, false, false, false, false, false);
INSERT INTO `category` (`id`, `category_name`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (2, 'outdoor_running', false, false, true, true, true, false, false);
INSERT INTO `category` (`id`, `category_name`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (3, 'treadmill', false, false, true, true, true, true, true);
INSERT INTO `category` (`id`, `category_name`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (4, 'bike', false, false, true, true, true, false, true);
INSERT INTO `category` (`id`, `category_name`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (5, 'cardio_machine', false, false, true, true, true, false, true);
INSERT INTO `category` (`id`, `category_name`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (6, 'rest', false, false, true, false, false, false, false);

COMMIT;


-- -----------------------------------------------------
-- Data for table `exercise`
-- -----------------------------------------------------
START TRANSACTION;
USE `workoutdb`;
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (1, 'deadlift', 'The best exercise ever', NULL, NULL, 1, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (2, 'squat', 'The other best exercise', NULL, NULL, 1, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (3, 'benchpress', 'The second best exercise', NULL, NULL, 1, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (4, 'overhead press', 'press weight above your head', NULL, NULL, 1, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (5, 'running', 'Falling forwards', NULL, NULL, 2, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (6, 'treadmill', NULL, NULL, NULL, 3, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (7, 'bike', NULL, NULL, NULL, 4, 1);
INSERT INTO `exercise` (`id`, `exercise_name`, `description`, `image_url`, `video_url`, `category_id`, `account_association`) VALUES (8, 'rest', NULL, NULL, NULL, 6, 1);

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
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (1, 1, 1, 1, '1000-01-01', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (2, 1, 2, 1, '1000-01-01', 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (3, 1, 3, 1, '1000-01-01', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (4, 1, 4, 1, '1000-01-01', 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (5, 1, 1, 2, '1000-01-01', 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (6, 1, 2, 2, '1000-01-01', 1, 11, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (7, 1, 3, 2, '1000-01-01', 1, 13, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (8, 1, 4, 2, '1000-01-01', 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (9, 1, 1, 3, '1000-01-01', 1, 17, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (10, 1, 2, 3, '1000-01-01', 1, 19, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (11, 1, 3, 3, '1000-01-01', 1, 21, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (12, 1, 4, 3, '1000-01-01', 1, 23, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (13, 1, 8, 1, '1000-01-01', 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (14, 1, 8, 2, '1000-01-01', 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (15, 1, 8, 3, '1000-01-01', 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (16, 1, 8, 4, '1000-01-01', 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (17, 1, 8, 5, '1000-01-01', 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (18, 1, 8, 6, '1000-01-01', 1, 12, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (19, 1, 8, 7, '1000-01-01', 1, 14, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (20, 1, 8, 8, '1000-01-01', 1, 16, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (21, 1, 8, 9, '1000-01-01', 1, 18, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (22, 1, 8, 10, '1000-01-01', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `workout_definition` (`id`, `workout_id`, `exercise_id`, `exercise_set`, `date`, `account_association`, `exercise_ordinal`, `weight`, `reps`, `time`, `pace`, `distance`, `incline`, `level`) VALUES (23, 1, 8, 11, '1000-01-01', 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, '1');

COMMIT;

