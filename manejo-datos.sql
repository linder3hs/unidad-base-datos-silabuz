use classicmodels;
/*
Listar a los contactos y sus direcciones, 
considerar concatenar el primer nombre y 
primer apellido en un solo campo.
*/
SELECT concat(contactFirstname,' ',contactLastName) AS "Nombre Completo", 
addressLine1 as "Direccion"
FROM customers;


/*
De la consulta anterior observamos algunos 
espacios en blanco denominados trailing 
spaces. Depurar dichos campos para que la 
concatenación de la consulta 
anterior sea más pulcra.
*/
SELECT concat(RTRIM(contactFirstname),' ', RTRIM(contactLastName)) AS 
"Nombre Completo", 
addressLine1 as "Direccion"
FROM customers;

/*
De la consulta anterior ahora nos solicitan 
que el nuevo campo (obtenido de la concatenación)
 se exprese en mayúsculas.
*/
SELECT UPPER(CONCAT(RTRIM(contactFirstname),' ', RTRIM(contactLastName))) 
AS "Nombre Completo", 
addressLine1 as "Direccion"
FROM customers;
/*
De la consulta anterior agregar otra columna
que indique el número de caracteres del 
campo addressLine1 y ordenar los datos en 
base a esta nueva columna de mayor a menor.
*/

SELECT UPPER(CONCAT(RTRIM(contactFirstname),' ', RTRIM(contactLastName))) 
AS "Nombre Completo", 
addressLine1 as "Direccion",
length(addressLine1) as cantidad
FROM customers
order by cantidad desc;

SELECT * FROM products;
/*
Mostrar el precio medio de los vehículos de cada
proveedor.
*/ 
SELECT productVendor, 
avg(buyPrice) AS "Precio Medio" 
FROM products
GROUP BY productVendor;

/*
Mostrar el precio mínimo de los vehículos
de cada proveedor.
*/
SELECT productVendor, 
MIN(buyPrice) AS "Precio min" 
FROM products
GROUP BY productVendor;

/*
Mostrar el precio máximo de los vehículos de 
cada proveedor.
*/
SELECT productVendor, 
MAX(buyPrice) AS "Precio max" 
FROM products
GROUP BY productVendor;

/*
Mostrar la distribución de precios 
(mínimo, máximo, valor medio y acumulado) 
de los vehículos de cada proveedor.
*/
SELECT productVendor,  
min(buyPrice) AS 'Precio min', 
max(buyPrice) AS 'Precio max',
avg(buyPrice) AS 'Precio Promedio', 
sum(buyPrice) AS 'Suma de precios' 
from products 
group BY productVendor;

/*
Mostrar la distribución del número de 
estados en las órdenes (tabla orders). 
Dicha distribución debe ser mostrada ordenadamente 
de mayor a menor.
*/
SELECT status, count(*) as cantidad
FROM orders
group by status
order by cantidad desc;
