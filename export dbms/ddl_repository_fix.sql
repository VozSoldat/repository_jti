-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema repository_jti
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema repository_jti
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `repository_jti` DEFAULT CHARACTER SET utf8 ;
USE `repository_jti` ;

-- -----------------------------------------------------
-- Table `repository_jti`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `repository_jti`.`user` (
  `id_user` VARCHAR(15) NOT NULL,
  `user_name` VARCHAR(45) NULL,
  `role` ENUM("Mahasiswa", "Dosen", "Admin") NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `repository_jti`.`document`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `repository_jti`.`document` (
  `id_document` VARCHAR(10) NOT NULL,
  `doc_name` VARCHAR(150) NULL,
  `doc_type` VARCHAR(15) NULL,
  `abstract` VARCHAR(1000) NULL,
  `upload_date` DATE NULL,
  `id_user` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_document`),
  INDEX `fk_document_user_idx` (`id_user` ASC),
  CONSTRAINT `fk_document_user`
    FOREIGN KEY (`id_user`)
    REFERENCES `repository_jti`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `repository_jti`.`view`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `repository_jti`.`view` (
  `total_view` INT NULL,
  `id_user` VARCHAR(15) NOT NULL,
  `id_document` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_user`, `id_document`),
  INDEX `fk_view_document1_idx` (`id_document` ASC),
  CONSTRAINT `fk_view_user1`
    FOREIGN KEY (`id_user`)
    REFERENCES `repository_jti`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_view_document1`
    FOREIGN KEY (`id_document`)
    REFERENCES `repository_jti`.`document` (`id_document`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `repository_jti`.`download`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `repository_jti`.`download` (
  `total_download` INT NULL,
  `id_user` VARCHAR(15) NOT NULL,
  `id_document` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_user`, `id_document`),
  INDEX `fk_download_document1_idx` (`id_document` ASC),
  CONSTRAINT `fk_download_user1`
    FOREIGN KEY (`id_user`)
    REFERENCES `repository_jti`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_download_document1`
    FOREIGN KEY (`id_document`)
    REFERENCES `repository_jti`.`document` (`id_document`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `repository_jti`.`trakcing_doc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `repository_jti`.`trakcing_doc` (
  `id_tracking` INT NOT NULL AUTO_INCREMENT,
  `status` ENUM("Success", "Pending") NULL,
  `description` VARCHAR(150) NULL,
  `id_user` VARCHAR(15) NOT NULL,
  `id_document` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_tracking`),
  INDEX `fk_trakcing_doc_user1_idx` (`id_user` ASC),
  INDEX `fk_trakcing_doc_document1_idx` (`id_document` ASC),
  CONSTRAINT `fk_trakcing_doc_user1`
    FOREIGN KEY (`id_user`)
    REFERENCES `repository_jti`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trakcing_doc_document1`
    FOREIGN KEY (`id_document`)
    REFERENCES `repository_jti`.`document` (`id_document`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `repository_jti`.`notification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `repository_jti`.`notification` (
  `id_user` VARCHAR(15) NOT NULL,
  `id_document` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_user`, `id_document`),
  INDEX `fk_notification_document1_idx` (`id_document` ASC),
  CONSTRAINT `fk_notification_user1`
    FOREIGN KEY (`id_user`)
    REFERENCES `repository_jti`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notification_document1`
    FOREIGN KEY (`id_document`)
    REFERENCES `repository_jti`.`document` (`id_document`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `repository_jti`.`mentioned_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `repository_jti`.`mentioned_user` (
  `id_user` VARCHAR(15) NOT NULL,
  `id_document` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_user`, `id_document`),
  INDEX `fk_mentioned_user_document1_idx` (`id_document` ASC),
  CONSTRAINT `fk_mentioned_user_user1`
    FOREIGN KEY (`id_user`)
    REFERENCES `repository_jti`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mentioned_user_document1`
    FOREIGN KEY (`id_document`)
    REFERENCES `repository_jti`.`document` (`id_document`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
