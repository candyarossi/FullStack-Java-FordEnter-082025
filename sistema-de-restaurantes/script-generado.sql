-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Restaurantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Restaurantes` (
  `id_restaurante` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(80) NULL,
  `telefono` VARCHAR(20) NULL,
  PRIMARY KEY (`id_restaurante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mesas` (
  `id_mesa` INT NOT NULL AUTO_INCREMENT,
  `nro_mesa` INT NOT NULL,
  `capacidad` INT NOT NULL,
  `disponibilidad` VARCHAR(45) NULL,
  PRIMARY KEY (`id_mesa`),
  UNIQUE INDEX `nro_mesa_UNIQUE` (`nro_mesa` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(80) NULL,
  `telefono` VARCHAR(20) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Facturas` (
  `id_factura` INT NOT NULL AUTO_INCREMENT,
  `total` DOUBLE NOT NULL,
  `metodo_pago` VARCHAR(45) NULL,
  `fecha` DATETIME NOT NULL DEFAULT NOW(),
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_factura`, `id_cliente`),
  INDEX `fk_Facturas_Clientes_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Facturas_Clientes`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `mydb`.`Clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedidos` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `fecha_hora` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` VARCHAR(45) NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_mesa` INT NOT NULL,
  `id_factura` INT NOT NULL,
  PRIMARY KEY (`id_pedido`, `id_cliente`, `id_mesa`, `id_factura`),
  INDEX `fk_Pedidos_Clientes_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_Pedidos_Mesas_idx` (`id_mesa` ASC) VISIBLE,
  INDEX `fk_Pedidos_Facturas_idx` (`id_factura` ASC) VISIBLE,
  CONSTRAINT `fk_Pedidos_Clientes`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `mydb`.`Clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_Mesas`
    FOREIGN KEY (`id_mesa`)
    REFERENCES `mydb`.`Mesas` (`id_mesa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_Facturas`
    FOREIGN KEY (`id_factura`)
    REFERENCES `mydb`.`Facturas` (`id_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menus` (
  `id_menu` INT NOT NULL AUTO_INCREMENT,
  `nombre_articulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NULL,
  `precio` DOUBLE NOT NULL,
  PRIMARY KEY (`id_menu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cocineros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cocineros` (
  `id_cocinero` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `especialidad` VARCHAR(45) NULL,
  PRIMARY KEY (`id_cocinero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ingredientes` (
  `id_ingrediente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `stock` INT NOT NULL,
  PRIMARY KEY (`id_ingrediente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Preparaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Preparaciones` (
  `id_preparacion` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `fecha_preparacion` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`id_preparacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reservas` (
  `id_reserva` INT NOT NULL AUTO_INCREMENT,
  `fecha_hora` DATETIME NOT NULL,
  `cantidad` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_reserva`, `id_cliente`),
  INDEX `fk_Reservas_Clientes_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Reservas_Clientes`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `mydb`.`Clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ingredientes_Preparaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ingredientes_Preparaciones` (
  `id_ingrediente` INT NOT NULL,
  `id_preparacion` INT NOT NULL,
  PRIMARY KEY (`id_ingrediente`, `id_preparacion`),
  INDEX `fk_Ingredientes_has_Preparaciones_Preparaciones_idx` (`id_preparacion` ASC) VISIBLE,
  INDEX `fk_Ingredientes_has_Preparaciones_Ingredientes_idx` (`id_ingrediente` ASC) VISIBLE,
  CONSTRAINT `fk_Ingredientes_has_Preparaciones_Ingredientes`
    FOREIGN KEY (`id_ingrediente`)
    REFERENCES `mydb`.`Ingredientes` (`id_ingrediente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingredientes_has_Preparaciones_Preparaciones`
    FOREIGN KEY (`id_preparacion`)
    REFERENCES `mydb`.`Preparaciones` (`id_preparacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Preparaciones_Cocineros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Preparaciones_Cocineros` (
  `id_preparacion` INT NOT NULL,
  `id_cocinero` INT NOT NULL,
  PRIMARY KEY (`id_preparacion`, `id_cocinero`),
  INDEX `fk_Preparaciones_has_Cocineros_Cocineros_idx` (`id_cocinero` ASC) VISIBLE,
  INDEX `fk_Preparaciones_has_Cocineros_Preparaciones_idx` (`id_preparacion` ASC) VISIBLE,
  CONSTRAINT `fk_Preparaciones_has_Cocineros_Preparaciones`
    FOREIGN KEY (`id_preparacion`)
    REFERENCES `mydb`.`Preparaciones` (`id_preparacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Preparaciones_has_Cocineros_Cocineros`
    FOREIGN KEY (`id_cocinero`)
    REFERENCES `mydb`.`Cocineros` (`id_cocinero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
