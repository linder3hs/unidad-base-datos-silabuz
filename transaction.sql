use silabuz_3;

show tables;

select * from salones;

-- Debemos saber que en mysql el auto commit estan activados por default
set autocommit = 0;

-- Vamos a iniciar el modo transacion 
start transaction;

insert into salones (id, aula, horaEntrada) values 
(24, 'E', '18:00:00'),
(25, 'F', '08:00:00');

-- Para poder guardar nuestra hasta un punto usamos commit
commit;

drop table alumnosSalones;
drop table salones;

show tables;
-- Si estan en el safe mode posiblemente no los deje hacer un update si in where
-- para quitar el modo seguro puede hacer esto

SET SQL_SAFE_UPDATES = 0;

update salones set aula = 'Z';

rollback;

-- DELETE 	   => Elimina registros
-- DROP TABLE  => Elimina la tabla
