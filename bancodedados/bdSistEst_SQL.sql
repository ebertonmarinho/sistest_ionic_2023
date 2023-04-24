-- MySQL Script generated by MySQL Workbench
-- Mon Apr 24 11:03:50 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bdsistest
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bdsistest` ;

-- -----------------------------------------------------
-- Schema bdsistest
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdsistest` DEFAULT CHARACTER SET utf8 ;
USE `bdsistest` ;

-- -----------------------------------------------------
-- Table `bdsistest`.`Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bdsistest`.`Usuarios` ;

CREATE TABLE IF NOT EXISTS `bdsistest`.`Usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(300) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `num_CNH` VARCHAR(15) NULL,
  `validade_CNH` DATE NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(300) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdsistest`.`Carros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bdsistest`.`Carros` ;

CREATE TABLE IF NOT EXISTS `bdsistest`.`Carros` (
  `idCarro` INT NOT NULL,
  `placa` VARCHAR(10) NOT NULL,
  `marca_modelo` VARCHAR(300) NOT NULL,
  `cor` VARCHAR(50) NOT NULL,
  `fk_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idCarro`),
  INDEX `fk_carros_usuarios_idx` (`fk_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_carros_usuarios`
    FOREIGN KEY (`fk_idUsuario`)
    REFERENCES `bdsistest`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdsistest`.`Estacionamentos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bdsistest`.`Estacionamentos` ;

CREATE TABLE IF NOT EXISTS `bdsistest`.`Estacionamentos` (
  `idEstacionamento` INT NOT NULL,
  `fk_idCarro` INT NOT NULL,
  `data_entrada` DATE NOT NULL,
  `hora_entrada` TIME NOT NULL,
  `data_saida` DATE NULL,
  `hora_saida` TIME NULL,
  PRIMARY KEY (`idEstacionamento`),
  INDEX `fk_Estacionamentos_Carros1_idx` (`fk_idCarro` ASC) VISIBLE,
  CONSTRAINT `fk_Estacionamentos_Carros1`
    FOREIGN KEY (`fk_idCarro`)
    REFERENCES `bdsistest`.`Carros` (`idCarro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;