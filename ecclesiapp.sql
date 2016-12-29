-- MySQL Script generated by MySQL Workbench
-- mar 20 dic 2016 22:55:40 CST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ecclesiapp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecclesiapp` DEFAULT CHARACTER SET utf8 ;
USE `ecclesiapp` ;

-- -----------------------------------------------------
-- Table `ecclesiapp`.`diocesis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`diocesis` (
  `id_diocesis` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_diocesis`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`zona_pastoral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`zona_pastoral` (
  `id_zona_pastoral` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `id_diocesis` INT(11) NOT NULL,
  PRIMARY KEY (`id_zona_pastoral`),
  INDEX `id_diocesis` (`id_diocesis` ASC),
  CONSTRAINT `id_diocesis`
    FOREIGN KEY (`id_diocesis`)
    REFERENCES `ecclesiapp`.`diocesis` (`id_diocesis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`zona_parroquial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`zona_parroquial` (
  `id_zona_parroquial` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `id_zona_pastoral` INT(11) NOT NULL,
  PRIMARY KEY (`id_zona_parroquial`),
  INDEX `id_zona_pastoral` (`id_zona_pastoral` ASC),
  CONSTRAINT `id_zona_pastoral`
    FOREIGN KEY (`id_zona_pastoral`)
    REFERENCES `ecclesiapp`.`zona_pastoral` (`id_zona_pastoral`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`departamento` (
  `id_departamento` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_departamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`municipio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`municipio` (
  `id_municipio` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `id_departamento` INT(11) NOT NULL,
  PRIMARY KEY (`id_municipio`),
  INDEX `id_departamento` (`id_departamento` ASC),
  CONSTRAINT `id_departamento`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `ecclesiapp`.`departamento` (`id_departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`templo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`templo` (
  `id_templo` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `nombre_popular` VARCHAR(50) NULL DEFAULT NULL,
  `direccion` VARCHAR(500) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `historia` VARCHAR(500) NULL DEFAULT NULL,
  `nombre_institucion` VARCHAR(100) NOT NULL,
  `portada` VARCHAR(45) NULL,
  `institucion` VARCHAR(45) NULL,
  `id_zona_parroquial` INT(11) NOT NULL,
  `id_municipio` INT(11) NOT NULL,
  `id_categoria` INT(11) NOT NULL,
  PRIMARY KEY (`id_templo`),
  INDEX `id_zona_parroquial` (`id_zona_parroquial` ASC),
  INDEX `id_municipio` (`id_municipio` ASC),
  INDEX `id_categoria` (`id_categoria` ASC),
  CONSTRAINT `id_zona_parroquial`
    FOREIGN KEY (`id_zona_parroquial`)
    REFERENCES `ecclesiapp`.`zona_parroquial` (`id_zona_parroquial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_municipio`
    FOREIGN KEY (`id_municipio`)
    REFERENCES `ecclesiapp`.`municipio` (`id_municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `ecclesiapp`.`categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`actividad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`actividad` (
  `id_actividad` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `dia` INT(11) NOT NULL,
  `hora` INT(11) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `id_templo` INT(11) NOT NULL,
  PRIMARY KEY (`id_actividad`),
  INDEX `id_templo` (`id_templo` ASC),
  CONSTRAINT `actividad_id_templo`
    FOREIGN KEY (`id_templo`)
    REFERENCES `ecclesiapp`.`templo` (`id_templo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`galeria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`galeria` (
  `id_galeria` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `portada` VARCHAR(45) NULL,
  `id_templo` INT(11) NOT NULL,
  PRIMARY KEY (`id_galeria`),
  INDEX `id_templo` (`id_templo` ASC),
  CONSTRAINT `galeria_id_templo`
    FOREIGN KEY (`id_templo`)
    REFERENCES `ecclesiapp`.`templo` (`id_templo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`foto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`foto` (
  `id_foto` INT(11) NOT NULL,
  `foto` VARCHAR(50) NOT NULL,
  `ubicacion` VARCHAR(45) NOT NULL,
  `id_galeria` INT(11) NOT NULL,
  PRIMARY KEY (`id_foto`),
  INDEX `id_galeria` (`id_galeria` ASC),
  CONSTRAINT `fk_foto_galeria1`
    FOREIGN KEY (`id_galeria`)
    REFERENCES `ecclesiapp`.`galeria` (`id_galeria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`servicio_religioso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`servicio_religioso` (
  `id_servicio_religioso` INT(11) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `templo_id_templo` INT(11) NOT NULL,
  PRIMARY KEY (`id_servicio_religioso`),
  INDEX `fk_oficio_religioso_templo1_idx` (`templo_id_templo` ASC),
  CONSTRAINT `fk_oficio_religioso_templo1`
    FOREIGN KEY (`templo_id_templo`)
    REFERENCES `ecclesiapp`.`templo` (`id_templo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`horario` (
  `id_horario` INT(11) NOT NULL AUTO_INCREMENT,
  `hora` INT(11) NOT NULL,
  `dia` INT(11) NOT NULL,
  `id_servicio_religioso` INT(11) NOT NULL,
  PRIMARY KEY (`id_horario`),
  INDEX `id_servicio_religioso` (`id_servicio_religioso` ASC),
  CONSTRAINT `id_servicio_religioso`
    FOREIGN KEY (`id_servicio_religioso`)
    REFERENCES `ecclesiapp`.`servicio_religioso` (`id_servicio_religioso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`noticia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`noticia` (
  `id_noticia` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL DEFAULT NULL,
  `noticia` VARCHAR(45) NULL DEFAULT NULL,
  `imagen` VARCHAR(45) NULL DEFAULT NULL,
  `id_templo` INT(11) NOT NULL,
  PRIMARY KEY (`id_noticia`),
  INDEX `id_templo` (`id_templo` ASC),
  CONSTRAINT `noticia_id_templo`
    FOREIGN KEY (`id_templo`)
    REFERENCES `ecclesiapp`.`templo` (`id_templo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`privilegio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`privilegio` (
  `id_privilegio` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_privilegio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`tipo_usuario` (
  `id_tipo_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `id_privilegio` INT(11) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`),
  INDEX `id_privilegio` (`id_privilegio` ASC),
  CONSTRAINT `id_privilegio`
    FOREIGN KEY (`id_privilegio`)
    REFERENCES `ecclesiapp`.`privilegio` (`id_privilegio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`usuario` (
  `id_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `id_tipo_usuario` INT(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `id_tipo_usuario` (`id_tipo_usuario` ASC),
  CONSTRAINT `id_tipo_usuario`
    FOREIGN KEY (`id_tipo_usuario`)
    REFERENCES `ecclesiapp`.`tipo_usuario` (`id_tipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`presbistero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`presbistero` (
  `id_presbistero` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `cane_confer` VARCHAR(45) NOT NULL,
  `nombre_popular` VARCHAR(45) NOT NULL,
  `fecha_ordenacion` INT(11) NOT NULL,
  `foto_portada` VARCHAR(45) NULL DEFAULT NULL,
  `id_usuario` INT(11) NOT NULL,
  `id_templo` INT(11) NOT NULL,
  PRIMARY KEY (`id_presbistero`),
  INDEX `id_usuario` (`id_usuario` ASC),
  INDEX `id_templo` (`id_templo` ASC),
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `ecclesiapp`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `presbistero_id_templo`
    FOREIGN KEY (`id_templo`)
    REFERENCES `ecclesiapp`.`templo` (`id_templo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`oficio_eclesiastico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`oficio_eclesiastico` (
  `id_oficio_eclesiastico` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `id_presbistero` INT(11) NOT NULL,
  PRIMARY KEY (`id_oficio_eclesiastico`),
  INDEX `id_presbistero` (`id_presbistero` ASC),
  CONSTRAINT `id_presbistero`
    FOREIGN KEY (`id_presbistero`)
    REFERENCES `ecclesiapp`.`presbistero` (`id_presbistero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ecclesiapp`.`tipo_actividad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecclesiapp`.`tipo_actividad` (
  `id_tipo_actividad` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `id_actividad` INT(11) NOT NULL,
  PRIMARY KEY (`id_tipo_actividad`),
  INDEX `id_actividad` (`id_actividad` ASC),
  CONSTRAINT `id_actividad`
    FOREIGN KEY (`id_actividad`)
    REFERENCES `ecclesiapp`.`actividad` (`id_actividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
