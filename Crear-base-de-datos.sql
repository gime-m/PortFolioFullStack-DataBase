SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `portfolio` DEFAULT CHARACTER SET utf8mb3 ;
USE `portfolio` ;

CREATE TABLE IF NOT EXISTS `portfolio`.`persona` (
  `id` BIGINT NOT NULL,
  `apellido` VARCHAR(25) NOT NULL,
  `banner` VARCHAR(60) NOT NULL,
  `descripcion` VARCHAR(500) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `github` VARCHAR(60) NOT NULL,
  `imagen_perfil` VARCHAR(60) NOT NULL,
  `lugar_trabajo` VARCHAR(60) NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  `ocupacion` VARCHAR(60) NOT NULL,
  `telefono` VARCHAR(25) NOT NULL,
  `ubicacion` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `portfolio`.`educacion` (
  `id` BIGINT NOT NULL,
  `descripcion` VARCHAR(250) NULL DEFAULT NULL,
  `fecha_fin` DATE NULL DEFAULT NULL,
  `fecha_inicio` DATE NULL DEFAULT NULL,
  `imagen` VARCHAR(60) NULL DEFAULT NULL,
  `institucion` VARCHAR(60) NULL DEFAULT NULL,
  `is_current` BIT(1) NULL DEFAULT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `persona_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK8co4tldnpfbl6l8oc06veg4jr` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `FK8co4tldnpfbl6l8oc06veg4jr`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio`.`persona` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `portfolio`.`experiencia` (
  `id` BIGINT NOT NULL,
  `descripcion` VARCHAR(250) NULL DEFAULT NULL,
  `fecha_fin` DATE NULL DEFAULT NULL,
  `fecha_inicio` DATE NULL DEFAULT NULL,
  `imagen` VARCHAR(60) NOT NULL,
  `is_current` BIT(1) NULL DEFAULT NULL,
  `lugar` VARCHAR(50) NULL DEFAULT NULL,
  `titulo` VARCHAR(60) NOT NULL,
  `persona_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK30e9aa2tv4x2kirmadmmggsme` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `FK30e9aa2tv4x2kirmadmmggsme`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio`.`persona` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `portfolio`.`proyecto` (
  `id` BIGINT NOT NULL,
  `descripcion` VARCHAR(250) NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `imagen` VARCHAR(60) NULL DEFAULT NULL,
  `link` VARCHAR(60) NULL DEFAULT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `persona_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKh9q3ib0v2a6x56ch8dbcw40by` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `FKh9q3ib0v2a6x56ch8dbcw40by`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio`.`persona` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `portfolio`.`rol` (
  `id` BIGINT NOT NULL,
  `nombre` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `portfolio`.`skill` (
  `id` BIGINT NOT NULL,
  `tipo` VARCHAR(10) NOT NULL,
  `titulo` VARCHAR(25) NOT NULL,
  `valor` INT NOT NULL,
  `persona_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKq5lt52vexik5gkhcy4v6r03eb` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `FKq5lt52vexik5gkhcy4v6r03eb`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio`.`persona` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `portfolio`.`usuario` (
  `id` BIGINT NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `username` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `portfolio`.`usuario_roles` (
  `usuario_id` BIGINT NOT NULL,
  `roles_id` BIGINT NOT NULL,
  INDEX `FK861wr18rjyh6pmadvor1u36vb` (`roles_id` ASC) VISIBLE,
  INDEX `FKqblnumndby0ftm4c7sg6uso6p` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `FK861wr18rjyh6pmadvor1u36vb`
    FOREIGN KEY (`roles_id`)
    REFERENCES `portfolio`.`rol` (`id`),
  CONSTRAINT `FKqblnumndby0ftm4c7sg6uso6p`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `portfolio`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
