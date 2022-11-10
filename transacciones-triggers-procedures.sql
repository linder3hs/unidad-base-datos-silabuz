CREATE DATABASE silabuz_3;

USE silabuz_3;

SELECT * FROM salones;

SELECT * FROM alumnossalones;

DELIMITER //
CREATE PROCEDURE salones()
BEGIN
	select * from salones;
END; //
DELIMITER ;

call salones();

-- Creamos un nuevo procedire
-- Donde vamos listar los alumnos junto a la letra de su aula
-- IN es para definir una variable de entrada
DELIMITER //
CREATE PROCEDURE alumnos_salones(IN alumno_nombre VARCHAR(100), IN CONDICION BOOLEAN) 
BEGIN	
	IF CONDICION THEN
		SELECT concat(a.nombre, " ", a.apellido) as Nombre, s.aula
		FROM alumnosSalones a
		JOIN salones s 
		ON a.idAula = s.id
		WHERE a.nombre = alumno_nombre;
	ELSE
		SELECT concat(a.nombre, " ", a.apellido) as Nombre, s.aula
		FROM alumnosSalones a
		JOIN salones s 
		ON a.idAula = s.id;
	END IF;
END; // 
DELIMITER ;

DROP PROCEDURE alumnos_salones;

CALL alumnos_salones('Rocio', true);
CALL alumnos_salones('Maritza', false);

-- IN => ENTRADA
-- OUT => SALIDA

SELECT * FROM alumnosSalones;

-- QUEREMOS AL PRIMER Y ULTIMOS ALUMNO QUE FUE REGISTRADOS

DELIMITER //
CREATE PROCEDURE alumnos_min_max(
	OUT minimo INT,
    OUT maximo INT
)
BEGIN
	SELECT MIN(id) INTO minimo FROM alumnosSalones;
    SELECT MAX(id) INTO maximo FROM alumnosSalones;
END; //
DELIMITER ;
-- Llamar al procedure e indicar que variables estamos recibiendo
-- Recordemos que recibo todo lo que digo OUT
-- Nota: Para poder guardar lo que recibimos de nuestro
-- store procedure usamos el "@nombre_variable"
-- minimo, maximo 
-- CALL alumnos_min_max(@minimo, @maximo)
CALL alumnos_min_max(@minimo, @maximo);
-- Para poder acceder a la data del procedure usamos un select
-- SELECT @minimo, @maximo
SELECT @minimo AS IdMinimo, @maximo AS IdMaximo;
-- DROP PROCEDURE alumnos_min_max;
-- CURSORES

CREATE TABLE usuarios(
	id int primary key auto_increment,
    nombre varchar(100),
    apellido varchar(100),
    correo varchar(100),
    created_at timestamp,
    updated_at timestamp
);

INSERT INTO usuarios (nombre, apellido, correo) VALUES ('Linder', 'Hassinger', 'linder@gmail.com');

SELECT * FROM usuarios;

-- VAMOS A CREAR UN TRIGGER que actualice la fecha de update

UPDATE usuarios SET nombre = 'Linder' WHERE id = 1;

-- Es una funcion que se ejecuta cuando hacemos un 
-- UPDATE
-- INSERT
-- DELETE
-- BEFORE => ANTES
-- AFTER => DESPUES

CREATE TRIGGER update_usarios_field
BEFORE UPDATE
ON usuarios
FOR EACH ROW 
SET NEW.updated_at = NOW();
