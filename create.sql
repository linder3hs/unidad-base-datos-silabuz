create database explorando_create_view;
use explorando_create_view;

create table aulas(
	id int primary key auto_increment,
    aula char(1),
    horaEntrada time
);

create table alumnos(
	id int primary key auto_increment,
    nombre varchar(255),
    apellido varchar(255),
    idAula int,
    foreign key (idAula) references aulas(id)
);


show tables;

describe alumnos;

insert into aulas(aula, horaEntrada)
values
('A', '07:30:00'),
('B', '08:30:00'),
('C', '07:00:00'),
('D', '07:10:00');

select * from aulas;

insert into alumnos(nombre, apellido, idAula)
values 
('Mijail', 'Zavala', 2),
('Piero', 'Marin', 1);

select au.aula as Aula, 
concat(al.nombre, " ", al.apellido) as "Nombre Completo"
from alumnos al
join aulas au 
on al.idAula = au.id;

create table notas(
	id int primary key auto_increment,
    nota_1 float not null,
    nota_2 float not null,
    nota_3 float not null,
    idAlumno int not null,
    foreign key (idAlumno) references alumnos(id)
);

describe notas;

insert into notas (nota_1, nota_2, nota_3, idAlumno)
values 
(18, 12, 18, 1),
(15, 19, 14, 2);

insert into notas (nota_1, nota_2, nota_3, idAlumno) 
values  (18, 12, 18, 3), (15, 19, 14, 2);

select * from notas;

