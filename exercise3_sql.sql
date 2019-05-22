-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exercise3_exam_220519
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercise3_exam_220519
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercise3_exam_220519` ;
USE `exercise3_exam_220519` ;

-- -----------------------------------------------------
-- Table `exercise3_exam_220519`.`syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise3_exam_220519`.`syndrome` (
  `syndrome_id` INT NOT NULL,
  `description` TEXT(100) NULL,
  PRIMARY KEY (`syndrome_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise3_exam_220519`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise3_exam_220519`.`patient` (
  `patient_id` INT NOT NULL,
  `patient_name` VARCHAR(45) NULL,
  `age` INT NULL,
  `gender` ENUM('M', 'F') NULL,
  `age_of diagnosis` INT NULL,
  `syndrome_id` INT NULL,
  PRIMARY KEY (`patient_id`),
  INDEX `FK_syndrome_idx` (`syndrome_id` ASC) VISIBLE,
  CONSTRAINT `FK_syndrome`
    FOREIGN KEY (`syndrome_id`)
    REFERENCES `exercise3_exam_220519`.`syndrome` (`syndrome_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise3_exam_220519`.`gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise3_exam_220519`.`gene` (
  `gene_id` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `decription` TEXT(100) NULL,
  `chromosome` VARCHAR(45) NULL,
  `start` BIGINT(1000000000) NULL,
  `end` BIGINT(1000000000) NULL,
  PRIMARY KEY (`gene_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise3_exam_220519`.`sequence experiment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise3_exam_220519`.`sequence experiment` (
  `experiment_id` INT NOT NULL,
  `gene_id` INT NULL,
  `patient_id` INT NULL,
  PRIMARY KEY (`experiment_id`),
  INDEX `FK_patient_idx` (`patient_id` ASC) VISIBLE,
  INDEX `FK_gene_idx` (`gene_id` ASC) VISIBLE,
  CONSTRAINT `FK_patient`
    FOREIGN KEY (`patient_id`)
    REFERENCES `exercise3_exam_220519`.`patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_gene`
    FOREIGN KEY (`gene_id`)
    REFERENCES `exercise3_exam_220519`.`gene` (`gene_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
