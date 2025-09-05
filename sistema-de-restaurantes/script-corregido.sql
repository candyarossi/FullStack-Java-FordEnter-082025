-- Script corregido y compatible con MySQL 5.7+

DROP SCHEMA IF EXISTS mydb;
CREATE SCHEMA mydb DEFAULT CHARACTER SET utf8;
USE mydb;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Table Restaurantes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurantes` (
  `id_restaurante` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(80) NULL,
  `telefono` VARCHAR(20) NULL,
  PRIMARY KEY (`id_restaurante`),
  UNIQUE KEY `uq_id_restaurante` (`id_restaurante`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table Mesas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mesas` (
  `id_mesa` INT NOT NULL AUTO_INCREMENT,
  `nro_mesa` INT NOT NULL,
  `capacidad` INT NOT NULL,
  `disponibilidad` VARCHAR(45) NULL,
  PRIMARY KEY (`id_mesa`),
  UNIQUE KEY `uq_id_mesa` (`id_mesa`),
  UNIQUE KEY `nro_mesa_UNIQUE` (`nro_mesa`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table Clientes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(80) NULL,
  `telefono` VARCHAR(20) NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `uq_id_cliente` (`id_cliente`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table Facturas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facturas` (
  `id_factura` INT NOT NULL AUTO_INCREMENT,
  `total` DOUBLE NOT NULL,
  `metodo_pago` VARCHAR(45) NULL,
  `fecha` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `uq_id_factura` (`id_factura`),
  INDEX `fk_Facturas_Clientes_idx` (`id_cliente`),
  CONSTRAINT `fk_Facturas_Clientes`
    FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id_cliente`)
    ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table Pedidos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedidos` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `fecha_hora` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` VARCHAR(45) NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_mesa` INT NOT NULL,
  `id_factura` INT NOT NULL,
  PRIMARY KEY (`id_pedido`),
  UNIQUE KEY `uq_id_pedido` (`id_pedido`),
  INDEX `fk_Pedidos_Clientes_idx` (`id_cliente`),
  INDEX `fk_Pedidos_Mesas_idx` (`id_mesa`),
  INDEX `fk_Pedidos_Facturas_idx` (`id_factura`),
  CONSTRAINT `fk_Pedidos_Clientes`
    FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id_cliente`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_Mesas`
    FOREIGN KEY (`id_mesa`) REFERENCES `Mesas` (`id_mesa`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_Facturas`
    FOREIGN KEY (`id_factura`) REFERENCES `Facturas` (`id_factura`)
    ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table Menus
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Menus` (
  `id_menu` INT NOT NULL AUTO_INCREMENT,
  `nombre_articulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NULL,
  `precio` DOUBLE NOT NULL,
  PRIMARY KEY (`id_menu`),
  UNIQUE KEY `uq_id_menu` (`id_menu`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table Cocineros
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cocineros` (
  `id_cocinero` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `especialidad` VARCHAR(45) NULL,
  PRIMARY KEY (`id_cocinero`),
  UNIQUE KEY `uq_id_cocinero` (`id_cocinero`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table Ingredientes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingredientes` (
  `id_ingrediente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `stock` INT NOT NULL,
  PRIMARY KEY (`id_ingrediente`),
  UNIQUE KEY `uq_id_ingrediente` (`id_ingrediente`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table Preparaciones
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Preparaciones` (
  `id_preparacion` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `fecha_preparacion` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_preparacion`),
  UNIQUE KEY `uq_id_preparacion` (`id_preparacion`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table Reservas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Reservas` (
  `id_reserva` INT NOT NULL AUTO_INCREMENT,
  `fecha_hora` DATETIME NOT NULL,
  `cantidad` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_reserva`),
  UNIQUE KEY `uq_id_reserva` (`id_reserva`),
  INDEX `fk_Reservas_Clientes_idx` (`id_cliente`),
  CONSTRAINT `fk_Reservas_Clientes`
    FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id_cliente`)
    ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table Ingredientes_Preparaciones (N:M)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingredientes_Preparaciones` (
  `id_ingrediente` INT NOT NULL,
  `id_preparacion` INT NOT NULL,
  PRIMARY KEY (`id_ingrediente`, `id_preparacion`),
  INDEX `fk_Ingredientes_Preparaciones_Preparaciones_idx` (`id_preparacion`),
  INDEX `fk_Ingredientes_Preparaciones_Ingredientes_idx` (`id_ingrediente`),
  CONSTRAINT `fk_Ingredientes_Preparaciones_Ingredientes`
    FOREIGN KEY (`id_ingrediente`) REFERENCES `Ingredientes` (`id_ingrediente`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingredientes_Preparaciones_Preparaciones`
    FOREIGN KEY (`id_preparacion`) REFERENCES `Preparaciones` (`id_preparacion`)
    ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table Preparaciones_Cocineros (N:M)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Preparaciones_Cocineros` (
  `id_preparacion` INT NOT NULL,
  `id_cocinero` INT NOT NULL,
  PRIMARY KEY (`id_preparacion`, `id_cocinero`),
  INDEX `fk_Preparaciones_Cocineros_Cocineros_idx` (`id_cocinero`),
  INDEX `fk_Preparaciones_Cocineros_Preparaciones_idx` (`id_preparacion`),
  CONSTRAINT `fk_Preparaciones_Cocineros_Preparaciones`
    FOREIGN KEY (`id_preparacion`) REFERENCES `Preparaciones` (`id_preparacion`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Preparaciones_Cocineros_Cocineros`
    FOREIGN KEY (`id_cocinero`) REFERENCES `Cocineros` (`id_cocinero`)
    ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Restore settings
-- -----------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
