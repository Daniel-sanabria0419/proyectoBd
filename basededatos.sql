-- Crear base de datos
CREATE DATABASE IF NOT EXISTS tiendadb;
USE tiendadb;
 
-- Tabla: Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    latitud DECIMAL(10, 8),
    longitud DECIMAL(11, 8)
);
 
-- Tabla: Productos
CREATE TABLE IF NOT EXISTS Productos (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);
 
-- Tabla: Sucursales
CREATE TABLE IF NOT EXISTS Sucursales (
    sucursal_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    latitud DECIMAL(10, 8),
    longitud DECIMAL(11, 8)
);
 
-- Tabla: Compras
CREATE TABLE IF NOT EXISTS Compras (
    compra_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    producto_id INT NOT NULL,
    sucursal_id INT NOT NULL,
    cantidad INT NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id) ON DELETE CASCADE,
    FOREIGN KEY (sucursal_id) REFERENCES Sucursales(sucursal_id) ON DELETE CASCADE
);