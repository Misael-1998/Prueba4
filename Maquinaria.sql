create database Maquinaria;
use Maquinaria;

/* creacion de la tabla rol y usuario */
CREATE TABLE usuarios (
  id_Usuario int primary key auto_increment,
  nombre_Usuario varchar(50) NOT NULL,
  contrasena varchar(10) NOT NULL,
  tipo_Usuario varchar(20) NOT NULL
);
insert into usuarios values(1, 'AdminNoe', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrador');
insert into usuarios values(2, 'AdminMisael', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrador');
insert into usuarios values(3, 'UserRafa', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Empleado');
insert into usuarios values(4, 'UserEdenilson', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Empleado');
insert into usuarios values(5, 'usuario', 'b665e217b51994789b02b1838e730d6b93baa30f', 'Empleado');
insert into usuarios values(6, 'Admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrador');
insert into usuarios values(7,'Alejandro','admin','Administrador');
select * from usuarios;

/* creacion de la tabla Ubuacion(Tabla INDEPENDIENTE) */
create table Ubicacion(
codigoUbicacion int primary key auto_increment,
latitudUbicacion varchar(100)not null,
longitudUbicacion varchar(100)not null,
comentarios varchar(100)not null
);
insert into Ubicacion values(1,'Viernes','sabado','domingo');
/* creacion de la tabla Cliente(Tabla INDEPENDIENTE) */
create table Cliente(
codigoCliente int primary key auto_increment,
nombreCliente varchar(100)not null,
apellidoCliente varchar(100)not null,
edadCliente int not null,
direccionCliente varchar(100)not null,
telefonoCliente varchar(20)not null,
correoCliente varchar(50) not null
);
INSERT INTO Cliente VALUES(1,'David','Guzman',30,'Santa Ana','1234-5678','Itca@gmail.com');
INSERT INTO Cliente VALUES(2,'David','Guzman',30,'Santa Ana','1234-5678','Itca@gmail.com');

create table estadoProyecto(
codigoEstadoProyecto int primary key auto_increment,
Descripcion varchar(100)not null
);

insert into estadoProyecto values(1,'Viernes');
insert into estadoProyecto values(2,'sabado');
insert into estadoProyecto values(3,'lunes');
insert into estadoProyecto values(4,'martes');
insert into estadoProyecto values(5,'jueves');

/* creacion de la tabla Proyecto con las FK de las tablas Independientes */
create table Proyecto(
codigoProyecto int primary key auto_increment,
nombreProyecto varchar(100)not null,
fechaInicio varchar(100)not null,
fechaFin varchar(100)not null,
codigoUbicacion int null,
foreign key(codigoUbicacion)
references Ubicacion(codigoUbicacion) on delete cascade on update cascade,
codigoCliente int,
foreign key(codigoCliente)
references Cliente(codigoCliente) on delete cascade on update cascade,
codigoEstadoProyecto int,
foreign key(codigoEstadoProyecto)
references estadoProyecto(codigoEstadoProyecto) on delete cascade on update cascade
);

insert into Proyecto values(1,'sabado','10/12/2018','10/12/2018',1,1,1);
insert into Proyecto values(2,'viernes','10/12/2018','10/12/2018',1,1,1);
insert into Proyecto values(3,'lunes','10/12/2018','10/12/2018',1,1,1);
insert into Proyecto values(4,'diomingo','10/12/2018','10/12/2018',1,1,1);

create table Inconvenientes(
codigoInconveniente int primary key auto_increment,
posibleSolucion varchar(100)not null,
solventado varchar(100)not null,
codigoProyecto int,
foreign key(codigoProyecto)
references Proyecto(codigoProyecto) on delete cascade on update cascade
);

create table Empleado(
codigoEmpleado int primary key auto_increment,
nombreEmpleado varchar(100)not null,
apellidoEmpleado varchar(100)not null,
genero varchar(100) not null,
edadEmpleado int not null,
direccionEmpleado varchar(100)not null,
telefonoEmpleado varchar(20)not null,
nit varchar(15) not null,
dui varchar(15) not null,
cargoEmpleado varchar(100)not null
);
insert into Empleado values(1,'Misael','Gonzalez','Masculino',10,'Santa Tecla','1234-5678','12345678-9','123-45678-789-9','Conductor');
insert into Empleado values(2,'Alejandro','Gonzalez','Masculino',10,'Santa Tecla','1234-5678','12345678-9','123-45678-789-9','Obrero');
select * from Empleado;

create table RecursoHumanoProyecto(
codigoRecursoHumano int primary key,
salario double not null,
funciones varchar(200)not null,
codigoEmpleado int,
foreign key (codigoEmpleado)
references Empleado(codigoEmpleado)on delete cascade on update cascade,
codigoProyecto int,
foreign key (codigoProyecto)
references Proyecto(codigoProyecto)on delete cascade on update cascade
);
insert into RecursoHumanoProyecto values(1,100.12,'viernes',1,1);
insert into RecursoHumanoProyecto values(2,100.12,'viernes',1,2);
insert into RecursoHumanoProyecto values(3,100.12,'viernes',1,3);
insert into RecursoHumanoProyecto values(4,100.12,'viernes',1,4);
select * from RecursoHumanoProyecto;


create table categoriaMaquinaria(
codigocategoriaMaquinaria int primary key auto_increment,
categoriaMaquinaria varchar(100)not null
);

insert into categoriaMaquinaria values(1,'lunes');
insert into categoriaMaquinaria values(2,'lunes');
insert into categoriaMaquinaria values(3,'lunes');
insert into categoriaMaquinaria values(4,'lunes');


create table Maquinaria(
codigoMaquinaria int primary key auto_increment,
stock int not null,
marcaMaquinaria varchar(100)not null,
modeloMaquinaria varchar(100)not null,
kilometrajeMaquinaria double not null,
codigocategoriaMaquinaria int,
foreign key (codigocategoriaMaquinaria)
references categoriaMaquinaria(codigocategoriaMaquinaria)on delete cascade on update cascade
);

insert into Maquinaria values(1,100,'lunes','martes',12.12,1);
insert into Maquinaria values(2,100,'lunes','martes',12.12,2);
insert into Maquinaria values(3,100,'lunes','martes',12.12,3);
insert into Maquinaria values(4,100,'lunes','martes',12.12,4);

create table InventarioMaquinaria(
codigoInventarioMaquinaria int primary key auto_increment,
cantidad int not null,
fechaIngreso varchar(100)not null,
fechaSalida varchar(100)not null,
codigoProyecto int,
foreign key (codigoProyecto)
references Proyecto(codigoProyecto)on delete cascade on update cascade,
codigoMaquinaria int,
foreign key (codigoMaquinaria)
references Maquinaria(codigoMaquinaria)on delete cascade on update cascade 
);

create table MateriaPrima(
codigoMateriaPrima int primary key auto_increment,
existencia varchar(100)not null,
stock int not null,
precio double not null,
unidades varchar(100)not null
);

insert into MateriaPrima values(1,'Si',100,10.2,'si');

create table InventarioMateriaPrima(
codigoInventarioMateriaPrima int primary key auto_increment,
cantidadAsignada double not null,
gastos double not null,
codigoProyecto int,
foreign key (codigoProyecto)
references Proyecto(codigoProyecto)on delete cascade on update cascade,
codigoMateriaPrima int,
foreign key(codigoMateriaPrima)
references MateriaPrima(codigoMateriaPrima)on delete cascade on update cascade
);

select * from Empleado;
ALTER TABLE `inconvenientes` ADD `inconveniente` VARCHAR(100) NULL AFTER `codigoInconveniente`;