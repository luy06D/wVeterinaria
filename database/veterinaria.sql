create database veterinaria;
use veterinaria;

create table clientes
(
idcliente 	int auto_increment primary key,
apellidos 	varchar(40) not null,
nombres 	varchar(40) not null,
dni 		char(8) not null,
claveacceso varchar(100) not null
)
engine = innodb;

insert into clientes (apellidos, nombres, dni , claveacceso) values
			('Cusi','Luis David', 73195465 , '123'),
            ('Gallardo','Alejandro Jesus', 73195423 , '123');

create table animales
(
idanimal	int auto_increment primary key,
nombreanimal		varchar(40) not null
)
engine = innodb;

insert into animales (nombreanimal) values
					('Perro'),
                    ('Gato'),
                    ('Loro');
	
create table razas 
(
idraza	int auto_increment primary key,
idanimal int not null,
nombreraza	varchar(40),
constraint fk_ida_ra foreign key (idanimal) references animales (idanimal)
)
engine = innodb;

insert into razas (idanimal ,nombreraza) values
					(1, 'Pastor aleman'),
                    (1, 'Pitbul');

create table mascotas
(
idmascota int auto_increment primary key,
idcliente int not null,
idraza 	int not null,
nombre	varchar(40) not null,
fotografia	varchar(200) null,
color	varchar(30) not null,
genero	varchar(30) not null,
constraint fk_idc_ma foreign key (idcliente) references clientes(idcliente),
constraint fk_idr_ma foreign key (idraza) references razas (idraza)

)
engine = innodb;

insert into mascotas (idcliente , idraza, nombre, color, genero) values
					(1, 1 , 'Destructor', 'Crema', 'Macho'),
                    (2, 2 , 'Princesa', 'Blanco' , 'Macho') ;
                    
								
DELIMITER $$
create procedure spu_add_clientes
(
IN _apellidos varchar(40),
IN _nombres	varchar(40),
IN _dni		char(8),
IN _claveacceso varchar(100)
)
begin
	insert into clientes (apellidos, nombres, dni, claveacceso) values
			(_apellidos, _nombres, _dni, _claveacceso);
end $$


DELIMITER $$
create procedure spu_add_mascotas
(
IN _idcliente int,
IN _idraza int ,
IN _nombre varchar(40),
IN _fotografia varchar(200),
IN _color varchar(30),
IN _genero varchar(30)
)
begin
	insert into mascotas (idcliente, idraza, nombre, fotografia, color, genero) values
			(_idcliente, _idraza, _nombre, _fotografia, _color, _genero);
end $$

-- BUSCAR CLIENTE (Muestra detalle mascota)

DELIMITER $$
create procedure spu_buscar_mascota(IN _idcliente int)
begin 

	select RA.nombreraza, MA.nombre, MA.color, MA.genero
	from clientes CLI
	inner join mascotas MA on MA.idcliente = CLI.idcliente
    inner join razas RA on RA.idraza = MA.idraza
    where CLI.idcliente = _idcliente;

end $$

call spu_buscar_mascota(2);




