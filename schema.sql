-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema goit-rdb-hw-02
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema goit-rdb-hw-02
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `goit-rdb-hw-02` ;
USE `goit-rdb-hw-02` ;

-- -----------------------------------------------------
-- Table `goit-rdb-hw-02`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goit-rdb-hw-02`.`clients` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goit-rdb-hw-02`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goit-rdb-hw-02`.`orders` (
  `id` INT NOT NULL,
  `date` DATETIME NULL,
  `client_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `order_client_fk_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `order_client_fk`
    FOREIGN KEY (`client_id`)
    REFERENCES `goit-rdb-hw-02`.`clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goit-rdb-hw-02`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goit-rdb-hw-02`.`products` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goit-rdb-hw-02`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goit-rdb-hw-02`.`order_items` (
  `order_id` INT NULL,
  `product_id` INT NULL,
  `quantity` INT NULL,
  UNIQUE INDEX `order_product_pk` (`order_id` ASC, `product_id` ASC) VISIBLE,
  INDEX `item_product_fk_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `item_order_fk`
    FOREIGN KEY (`order_id`)
    REFERENCES `goit-rdb-hw-02`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `item_product_fk`
    FOREIGN KEY (`product_id`)
    REFERENCES `goit-rdb-hw-02`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
