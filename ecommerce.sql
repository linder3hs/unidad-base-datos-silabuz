CREATE DATABASE ecommerce;

SHOW DATABASES;

USE ecommerce; 

CREATE TABLE newProductos(
	id INT auto_increment primary key,
    nombre varchar(100),
    marca varchar(50),
    talla varchar(50),
    codigo varchar(50),
    precio float,
    estado boolean,
    created_at timestamp,
    updated_at timestamp,
    categoria_id int
);

SHOW TABLES;

INSERT INTO productos (nombre, marca, talla, codigo, 
	precio, estado, categoria_id
) VALUES 
('Jordan', 'Adidas', '10', 'Z110', 800, true, 1),
('Ultraboost2', 'Adidas2', '112', 'C5202', 802.2, true, 2),
('Yeezys', 'Adidas', '10', 'Z110', 800, true, 1),
('Ultraboost', 'Adidas', '11', 'C520', 800, true, 2);

-- Lista todos los elementos de mi tabla
SELECT * FROM productos;

CREATE TABLE usuarios(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(200),
    correo VARCHAR(200),
    contrasena TEXT,
    estado BOOLEAN
);
-- * Todas las columnas
SELECT precio, estado, nombre, id FROM productos;

SELECT distinct nombre from productos;

SELECT * from productos LIMIT 2, 1;

-- INSERT FROM SELECT
INSERT INTO productos (nombre, marca, talla)
SELECT nombre, marca, talla FROM newProductos;

SELECT nombre, SUM(precio) FROM productos GROUP BY nombre;



SELECT * FROM productos;

-- Por defecto mysqlw esta en modo seguro
UPDATE productos SET estado = true WHERE precio is not null;
-- QUITANDO EL MODO SEGURP
SET SQL_SAFE_UPDATES = 0;

-- Ejemplo2 Actualizando lar marca Adidas a Nike
UPDATE productos SET marca = "Nike" WHERE marca = "adidas";

DELETE FROM productos WHERE estado = false;
DELETE FROM productos;

SELECT nombre, length(nombre) as "Nombre Producto", precio as "Precio 
Producto", estado FROM productos;

SELECT UPPER(CONCAT(nombre," ", precio)) as "Nombre y Precio", estado FROM 
productos;

SELECT 
nombre as "Nombre de Producto",
SUM(precio) as "Suma de todos los precio",
AVG(precio) as "Promedio de Precios",
count(precio) as "Cantidad de Productos"
FROM productos 
GROUP BY nombre
-- having es como es el where pero se usa con group by
having SUM(precio) > 2000;

SELECT count(*) from productos;
SELECT max(precio) from productos;
SELECT min(precio) from productos;
