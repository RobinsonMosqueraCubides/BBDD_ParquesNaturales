-- ##############################
-- ####### BBDD y tablas ########
-- ##############################


-- ### base de datos ###
-- Crear base de datos
create database ParquesNaturalesColombia;
-- Usar base de datos
use ParquesNaturalesColombia;



-- ### Tablas ###
-- ##### Tablas sin foreign key #####
-- Creacion de la tabla (visitantes)
create table visitantes(
	id int primary key auto_increment,
	Nombre varchar(50) not null,
	direccion varchar(50) not null,
	profesion varchar(50)
);



-- creacion de la tabla (entidad_responsable)
create table entidad_responsable(
	id int primary key auto_increment,
	nombre varchar(50) not null,
	direccion varchar(50) not null,
	telefono int
);


-- Creacion de la tabla (especies)
create table especies(
	id int primary key auto_increment,
	nombre_cientifico varchar(50) not null,
	nombre_vulgar varchar(50) not null,
	categoria enum('vegetal','animal','mineral') not null
);

-- creacion de la tabla (proyectos_investigacion)
create table proyectos_investigacion (
	id int primary key auto_increment,
    nombre varchar(50) not null,
	presupuesto decimal(15,2) not null,
	fecha_inicio date not null,
	fecha_fin date not null,
    especie int,
    foreign key (especie) references especies(id)
);

-- Creacion de la tabla (vehiculos)
create table vehiculos(
	id int primary key auto_increment,
	tipo varchar(25) not null,
	marca varchar(25) not null
);



-- creacion de la tabla (parques_naturales)
create table parques_naturales(
	id int primary key auto_increment,
	nombre varchar(50) not null,
	fecha_declaracion date not null
);

-- creacion de la tabla (alojamientos)
create table alojamientos(
	id int primary key auto_increment,
    nombre varchar(25) not null,
	capacidad int not null,
	categoria ENUM('hotel', 'cabaña') NOT NULL,
    parque int,
    foreign key (parque) references parques_naturales(id)
);

create table punto_acceso(
id int primary key auto_increment,
parque int not null,
foreign key(parque) references parques_naturales(id),
nombre varchar (50) not null
);

-- ##### Tablas con foreign key #####
-- creacion de tabla (departamentos)
create table departamentos(
	id int primary key auto_increment,
	nombre varchar(25) not null,
	entidad_responsable int,
	foreign key(entidad_responsable) references entidad_responsable(id)
);

-- creacion de la tabla (area)
create table area(
	id int primary key auto_increment,
	nombre varchar(25) not null,
	extension decimal(10,2) not null,
	parque int,
	foreign key(parque) references parques_naturales(id)
);

-- creacion de la tabla (personal)
create table personal(
	id int primary key auto_increment,
	documento int not null,
	nombre varchar(50) not null,
	direccion varchar(50) not null,
	telefono varchar(15) not null,
	sueldo decimal(10,2) not null,
	tipo enum('Personal de Gestión','Personal de Vigilancia','Personal de Conservación','Personal Investigador') not null,
	parque int,
	foreign key(parque) references parques_naturales(id)
);


-- ##### Tablas con mas de 1 foreign key #####
-- creacion de la tabla (inventario especie)
create table inventario_especie(
	id int primary key auto_increment,
	numero_individuos int not null,
	area int,
	foreign key(area) references area(id),
	especie int,
	foreign key(especie) references especies(id)
);

-- creacion de tabla (personal_gestion)
CREATE TABLE personal_gestion (
    id INT,
    nombre VARCHAR(50) NOT NULL,
    punto_acceso INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES personal(id),
    foreign key (punto_acceso) references punto_acceso(id)
);
-- creacion de la tabla (personal_investigacion)
CREATE TABLE personal_investigacion (
    id INT,
    nombre VARCHAR(50) NOT NULL,
    titulacion varchar(25),
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES personal(id)
);

-- creacion de la tabla (personal_conservacion)
CREATE TABLE personal_conservacion (
    id INT,
    nombre VARCHAR(50) NOT NULL,
    area int,
    especialidad varchar(25),
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES personal(id),
    foreign key (area) references area(id)
);


-- creacion de la tabla (personal_vigilancia)
CREATE TABLE personal_vigilancia (
    id INT,
    nombre VARCHAR(50) NOT NULL,
    area int,
    vehiculo int,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES personal(id),
    foreign key (area) references area(id),
    foreign key (vehiculo) references vehiculos(id)
);

-- ### relaciones ###
-- creacion de la tabla de relacion entre departamento y parque
CREATE TABLE departamento_parque (
    departamento INT,
    parque INT,
    PRIMARY KEY (departamento, parque),
    FOREIGN KEY (departamento) REFERENCES departamentos(id),
    FOREIGN KEY (parque) REFERENCES parques_naturales(id)
);
-- creacion de la tabla de relacion entre investigador y proyecto
CREATE TABLE investigador_proyecto (
    investigador INT,
    proyecto INT,
    PRIMARY KEY (investigador, proyecto),
    FOREIGN KEY (investigador) REFERENCES personal_investigacion(id),
    FOREIGN KEY (proyecto) REFERENCES proyectos_investigacion(id)
);

-- creacion de la tabla de relacion entre visitante y alojamiento
CREATE TABLE visitante_alojamiento (
    visitante INT,
    alojamiento INT,
    PRIMARY KEY (visitante, alojamiento),
    FOREIGN KEY (visitante) REFERENCES visitantes(id),
    FOREIGN KEY (alojamiento) REFERENCES alojamientos(id)
);

-- creacion de la tabla de relacion entre visitante y parque
CREATE TABLE visitante_parque (
    visitante INT,
    parque INT,
    punto_acceso int,
    fecha_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (visitante, parque),
    FOREIGN KEY (visitante) REFERENCES visitantes(id),
    FOREIGN KEY (parque) REFERENCES parques_naturales(id),
    FOREIGN KEY (punto_acceso) REFERENCES punto_acceso(id)
);



-- crear tabla para el registro de las acciones del administrador

CREATE TABLE history_administrador (
    accion VARCHAR(10) NOT NULL,
	registro enum('entidad_responsable','departamento','parque'),
    hora_actual TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    
);


-- crear tabla para el registro de las acciones del administrador_parque

CREATE TABLE history_administrador_parque (
    accion VARCHAR(10) NOT NULL, -- agregar -elimiar -modificar
	registro enum('alojamiento','punto_acceso','area'),
    hora_actual TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- crear tala para el registro de las acciones del administrador_personal
CREATE TABLE history_administrador_personal (
    accion VARCHAR(10) NOT NULL, -- agregar -elimiar -modificar
	registro varchar(50),  -- Nombre del personal eliminado agregado o modificado 
    hora_actual TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- crear tala para el registro de las acciones del administrador_alojamiento
CREATE TABLE history_administrador_alojamiento (
    accion VARCHAR(10) NOT NULL, -- agregar -elimiar
	registro varchar(50),  -- Nombre del personal eliminado o agregado del alojamiento
    hora_actual TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


create table history_personal_gestion(
accion VARCHAR(10) NOT NULL, -- agregar -elimiar o modificar
hora_actual TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
