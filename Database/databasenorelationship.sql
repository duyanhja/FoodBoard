-- MySQL Script generated by MySQL Workbench
-- 05/16/18 12:49:49
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Foodboard
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Foodboard
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Foodboard` DEFAULT CHARACTER SET utf8 ;
USE `Foodboard` ;

-- -----------------------------------------------------
-- Table `Foodboard`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Foodboard`.`Users` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL COMMENT 'Holds contact first name',
  `lastName` VARCHAR(45) NOT NULL COMMENT 'Holds user last name',
  `email` VARCHAR(45) NOT NULL COMMENT 'Holds user email\n',
  `suiteNumber` INT(10) NOT NULL COMMENT 'Holds user\'s apartment suite number\n',
  `password` VARCHAR(61) NOT NULL COMMENT 'Holds user\'s password\n',
  `createdAt` DATETIME NOT NULL COMMENT 'Holds creation time of the user',
  `updatedAt` DATETIME NOT NULL COMMENT 'Holds the time the user last updated',
  `role` TINYINT NOT NULL DEFAULT 0 COMMENT 'Stores the role of the user\nAdmin = 0, User = 1\n',
  PRIMARY KEY (`userID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Foodboard`.`FoodItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Foodboard`.`FoodItem` (
  `itemID` INT NOT NULL AUTO_INCREMENT,
  `foodName` VARCHAR(45) NOT NULL COMMENT 'Holds the name of the food item\n',
  `foodDescription` VARCHAR(255) NOT NULL COMMENT 'Holds the description of the item (time of pickup, description)',
  `foodGroup` VARCHAR(45) NOT NULL COMMENT 'Holds the food group of the item',
  `foodExpiryTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Holds the expiry date of the food item\n',
  `foodImage` VARCHAR(255) NOT NULL COMMENT 'Holds the image of the food item\n',
  `Users_userID` VARCHAR(45) NOT NULL,
  `Users_claimerUserID` VARCHAR(45) NULL,
  PRIMARY KEY (`itemID`));


-- -----------------------------------------------------
-- Table `Foodboard`.`Sessions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Foodboard`.`Sessions` (
  `sessionID` VARCHAR(255) NOT NULL COMMENT 'Holds the sessionID of the logged in user',
  `Users_userID` INT NOT NULL COMMENT 'Holds the userID of the logged in user',
  PRIMARY KEY (`sessionID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;