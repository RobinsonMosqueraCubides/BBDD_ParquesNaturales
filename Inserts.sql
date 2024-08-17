-- ##############################
-- ########## Inserts ###########
-- ########## Tayrona ###########
-- ##############################

-- Entidad responsable
INSERT INTO entidad_responsable(nombre, direccion, telefono)
VALUES ('Alberto Mario Garzón Wilches', 'Calle 17 No. 1-C-78 Santa Marta',313395031);

-- Departamento
INSERT INTO departamentos (nombre, entidad_responsable) VALUES 
('Magdalena', 1),
('Amazonas', NULL),
('Antioquia', NULL),
('Arauca', NULL),
('Atlántico', NULL),
('Bolívar', NULL),
('Boyacá', NULL),
('Caldas', NULL),
('Caquetá', NULL),
('Casanare', NULL),
('Cauca', NULL),
('Cesar', NULL),
('Chocó', NULL),
('Córdoba', NULL),
('Cundinamarca', NULL),
('Guainía', NULL),
('Guaviare', NULL),
('Huila', NULL),
('La Guajira', NULL),
('Meta', NULL),
('Nariño', NULL),
('Norte de Santander', NULL),
('Putumayo', NULL),
('Quindío', NULL),
('Risaralda', NULL),
('San Andrés y Providencia', NULL),
('Santander', NULL),
('Sucre', NULL),
('Tolima', NULL),
('Valle del Cauca', NULL),
('Vaupés', NULL),
('Vichada', NULL);


-- Parque
INSERT INTO parques_naturales(nombre, fecha_declaracion)
VALUES
    ('Tayrona', '1988-11-17'),
    ('Sierra Nevada de Santa Marta', '1977-11-17');

-- puntos de acceso del parque
INSERT INTO punto_acceso (parque, nombre) VALUES
(1, 'Zaino'),
(1, 'Calabazo'),
(1, 'Palangana'),
(1, 'Neguanje'),
(1, 'Cabo San Juan'),
(1, 'Playa Cristal'),
(2, 'Sector de Mamey (Ruta Pueblito)'),
(2, 'Sector de Calabazo (Ruta Taironaka)'),
(2, 'Sector de Palomino'),
(2, 'Sector de San Lorenzo'),
(2, 'Sector de Minca');

-- departamento del parque
INSERT INTO departamento_parque(departamento, parque)
VALUES 
(1, 1),
(1, 2);
-- areas del parque tayrona
INSERT INTO area(nombre, extension, parque)
VALUES
('SAN JUAN DEL GUÍA', 100.00, 1),
('LA PISCINA', 75.00, 1),
('ARENILLA', 50.00, 1),
('ARRECIFE', 120.00, 1),
('CAÑAVERAL', 90.00, 1),
('concha', 110.00, 1),
('CHENGUE', 80.00, 1),
('GAYRACA', 95.00, 1),
('NEGUANJE', 150.00, 1),
('7 OLAS', 65.00, 1),
('CINTO', 45.00, 1),
('GUACHAKYTA', 55.00, 1),
('PALMARITO', 30.00, 1),
('BRAVA', 40.00, 1),
('BOCA DEL SACO', 25.00, 1),
('CASTILLETE', 20.00, 1),
('Cerro Nevada', 200.00, 2),
('Valle del Río Frío', 180.00, 2),
('Bosque de Niebla', 150.00, 2),
('Laguna de los Milagros', 120.00, 2),
('Cascada Esmeralda', 90.00, 2),
('Pico Bolívar', 300.00, 2),
('Laguna Seca', 80.00, 2),
('Quebrada del Diablo', 65.00, 2),
('Monte Verde', 110.00, 2),
('Bosque de Palmas', 75.00, 2),
('Río Gaira', 100.00, 2),
('Sendero del Cóndor', 45.00, 2),
('Páramo del Sol', 55.00, 2),
('Ciénaga de Oro', 40.00, 2),
('Cascada del Arcoíris', 25.00, 2),
('Quebrada Cristalina', 35.00, 2),
('Pico Cristóbal Colón', 320.00, 2),
('Laguna Encantada', 70.00, 2),
('Bosque Encantado', 85.00, 2),
('Mirador del Cóndor', 50.00, 2);

-- Alojamientos parque tayrona
INSERT INTO alojamientos(nombre, capacidad, categoria,parque)
VALUES
('Senda Koguiwa', 20, 'hotel',1),
('ECOHABS Tayrona Park', 30, 'hotel',1),
('CASA Tayrona Los Naranjos', 15, 'hotel',1),
('CABAÑA Barlovento', 10, 'cabaña',1),
('MALOKA Barlovento', 8, 'cabaña',1),
('SENDA Watapuy', 12, 'hotel',1),
('EcoLodge Sierra Nevada', 25, 'hotel', 2),
('Cabañas Neblina', 12, 'cabaña', 2),
('Casa Montaña', 18, 'hotel', 2),
('Refugio Pico Bolívar', 8, 'cabaña', 2),
('Hotel Vista Verde', 30, 'hotel', 2),
('Cabañas El Dorado', 10, 'cabaña', 2);


-- especies del parque tayrona
	-- Inserción de datos para especies animales
	INSERT INTO especies(nombre_cientifico, nombre_vulgar, categoria) VALUES
		('Choloepus hoffmanni', 'Perezoso de tres dedos', 'animal'),
		('Choloepus didactylus', 'Perezoso de dos dedos', 'animal'),
		('Leopardus tigrinus', 'Tigrillo', 'animal'),
		('Leopardus pardalis', 'Ocelote', 'animal'),
		('Puma concolor', 'Puma', 'animal'),
		('Alouatta seniculus', 'Mono aullador', 'animal'),
		('Saguinus oedipus', 'Mono tití', 'animal'),
		('Eretmochelys imbricata', 'Tortuga carey', 'animal'),
		('Chelonia mydas', 'Tortuga verde', 'animal'),
		('Dermochelys coriacea', 'Tortuga laúd', 'animal'),
		('Delfines', 'Delfines', 'animal'),
		('Ballenas', 'Ballenas', 'animal'),
		('Peces coralinos', 'Peces diversos', 'animal');
        

	-- Inserción de datos para especies vegetales
	INSERT INTO especies(nombre_cientifico, nombre_vulgar, categoria) VALUES
		('Ceroxylon quindiuense', 'Palma de cera', 'vegetal'),
		('Ceroxylon ceriferum', 'Palma de cera', 'vegetal'),
		('Bromeliaceae', 'Bromelias', 'vegetal'),
		('Orchidaceae', 'Orquídeas', 'vegetal'),
		('Manglares', 'Manglares', 'vegetal'),
		('Cactaceae', 'Cactus', 'vegetal'),
		('Algas marinas', 'Algas marinas', 'vegetal'),
		('Especies arbóreas diversas', 'Especies arbóreas diversas', 'vegetal');

	-- Inserción de datos para especies minerales
	INSERT INTO especies(nombre_cientifico, nombre_vulgar, categoria) VALUES
		('Arenisca', 'Arenisca', 'mineral'),
		('Granito', 'Granito', 'mineral'),
		('Arcilla', 'Arcilla', 'mineral'),
		('Cuarcita', 'Cuarcita', 'mineral'),
		('Carbón', 'Carbón', 'mineral'),
		('Rocas metamórficas', 'Rocas metamórficas', 'mineral'),
		('Minerales de hierro', 'Minerales de hierro', 'mineral');


-- Inserción de datos para especies animales del Parque Sierra Nevada de Santa Marta
INSERT INTO especies(nombre_cientifico, nombre_vulgar, categoria) VALUES
    ('Leopardus wampus', 'Gato Andino', 'animal'),
    ('Panthera onca', 'Jaguar', 'animal'),
    ('Pudu mephistophiles', 'Venadito', 'animal'),
    ('Ateles hybridus', 'Mono araña', 'animal'),
    ('Harpia harpyja', 'Águila Arpía', 'animal'),
    ('Tremarctos ornatus', 'Oso de anteojos', 'animal'),
    ('Tapirus terrestris', 'Tapir', 'animal');

-- Inserción de datos para especies vegetales del Parque Sierra Nevada de Santa Marta
INSERT INTO especies(nombre_cientifico, nombre_vulgar, categoria) VALUES
    ('Espeletia argentea', 'Frailejón plateado', 'vegetal'),
    ('Bromelia laciniosa', 'Bromelia', 'vegetal'),
    ('Passiflora quadrangularis', 'Flor de maracuyá', 'vegetal'),
    ('Quercus humboldtii', 'Roble Andino', 'vegetal'),
    ('Weinmannia tomentosa', 'Cedro Rosado', 'vegetal');


-- Inserción de datos para especies minerales del Parque Sierra Nevada de Santa Marta
INSERT INTO especies(nombre_cientifico, nombre_vulgar, categoria) VALUES
    ('Esmaragdo', 'Esmaragdo', 'mineral'),
    ('Cuarzo', 'Cuarzo', 'mineral'),
    ('Ammolita', 'Ammolita', 'mineral');

-- vehiculos
INSERT INTO vehiculos(tipo, marca)
VALUES
('Moto todo terreno', 'Honda'),
('Camioneta 4x4', 'Toyota'),
('Bicicleta de montaña', 'Specialized'),
('Embarcación', 'Yamaha');

-- proyectos de investigacion del parque tayrona
-- Proyectos de investigación del parque Tayrona con presupuestos en COP
INSERT INTO proyectos_investigacion (nombre, presupuesto, fecha_inicio, fecha_fin, especie) VALUES
    ('Conservación del Perezoso de tres dedos', 200000000, '2024-01-15', '2024-12-15', 1),
    ('Estudio de hábitos del Tigrillo', 300000000, '2024-02-01', '2024-11-01', 3),
    ('Reforestación con Palma de cera', 240000000, '2024-03-01', '2024-12-01', 14),
    ('Protección de la Tortuga carey', 340000000, '2024-04-01', '2025-03-01', 8),
    ('Investigación sobre Manglares', 360000000, '2024-05-01', '2025-04-01', 18),
    ('Monitoreo de Delfines en la costa', 280000000, '2024-06-01', '2025-05-01', 11),
    ('Preservación de Orquídeas', 220000000, '2024-07-01', '2025-06-01', 17),
    ('Estudio de impacto en Minerales de hierro', 380000000, '2024-08-01', '2025-07-01', 28),
    ('Conservación de Especies arbóreas diversas', 320000000, '2024-09-01', '2025-08-01', 21),
    ('Investigación sobre Rocas metamórficas', 272000000, '2024-10-01', '2025-09-01', 27),
      ('Estudio de hábitos del Gato Andino', 250000000, '2024-01-15', '2024-12-15', 29),
    ('Conservación del Jaguar', 300000000, '2024-02-01', '2024-11-01', 30),
    ('Investigación sobre el Venadito', 180000000, '2024-03-01', '2024-12-01', 31),
    ('Protección del Mono araña', 350000000, '2024-04-01', '2025-03-01', 32),
    ('Estudio de la Águila Arpía', 280000000, '2024-05-01', '2025-04-01', 33),
    ('Monitoreo del Oso de anteojos', 320000000, '2024-06-01', '2025-05-01', 34),
    ('Preservación del Tapir', 200000000, '2024-07-01', '2025-06-01', 35),
    ('Reforestación con Frailejón plateado', 400000000, '2024-08-01', '2025-07-01', 36),
    ('Investigación sobre Bromelias', 220000000, '2024-09-01', '2025-08-01', 37),
    ('Estudio de la Flor de maracuyá', 180000000, '2024-10-01', '2025-09-01', 38),
    ('Conservación del Roble Andino', 300000000, '2024-11-01', '2025-10-01', 39),
    ('Protección del Cedro Rosado', 260000000, '2024-12-01', '2025-11-01', 40),
    ('Investigación sobre Esmaragdo', 380000000, '2025-01-01', '2025-12-01', 41),
    ('Estudio de la Cuarcita', 240000000, '2025-02-01', '2025-11-01', 42),
    ('Monitoreo de la Ammolita', 280000000, '2025-03-01', '2025-12-01', 43);

    
    
    
-- visitantes
INSERT INTO visitantes (Nombre, direccion, profesion) VALUES
    ('Camila López', 'Carrera 7 # 72-54, Bogotá', 'Ingeniera'),
    ('Juan Ramírez', 'Calle 10 # 33-25, Medellín', 'Médico'),
    ('María González', 'Avenida 5 # 15-10, Cali', 'Profesora'),
    ('Carlos Rodríguez', 'Carrera 25 # 50-15, Barranquilla', 'Abogado'),
    ('Laura Martínez', 'Carrera 30 # 40-20, Bucaramanga', 'Arquitecta'),
    ('Santiago Gómez', 'Calle 50 # 12-30, Cartagena', 'Economista'),
    ('Valentina Sánchez', 'Avenida 3 # 8-12, Manizales', 'Estudiante'),
    ('Jorge Pérez', 'Carrera 15 # 22-35, Pereira', 'Artista'),
    ('Ana Ramírez', 'Calle 7 # 5-10, Armenia', 'Actor'),
    ('Diego Vargas', 'Carrera 2 # 4-5, Santa Marta', 'Empresario'),
    ('Isabella Castro', 'Avenida 10 # 25-30, Villavicencio', 'Diseñadora'),
    ('Sebastián Herrera', 'Carrera 12 # 15-18, Cúcuta', 'Programador'),
    ('Natalia Díaz', 'Calle 80 # 90-45, Ibague', 'Consultora'),
    ('Andrés Rojas', 'Carrera 45 # 35-25, Pasto', 'Investigador'),
    ('Carolina Gutiérrez', 'Avenida 20 # 10-5, Neiva', 'Escritora'),
    ('David Torres', 'Calle 22 # 18-20, Tunja', 'Científico'),
    ('Valeria Muñoz', 'Carrera 18 # 12-8, Popayán', 'Periodista'),
    ('Felipe Ortiz', 'Calle 33 # 40-22, Quibdó', 'Chef'),
    ('Diana Gómez', 'Avenida 7 # 6-5, Montería', 'Psicóloga'),
    ('Alejandro Varela', 'Carrera 12 # 15-10, Florencia', 'Piloto'),
    ('Paola Jiménez', 'Calle 10 # 8-5, Sincelejo', 'Bióloga'),
    ('Andrea Castañeda', 'Avenida 5 # 4-3, Leticia', 'Geólogo'),
    ('Manuel Ramírez', 'Carrera 8 # 10-12, Yopal', 'Traductora'),
    ('Laura Soto', 'Calle 15 # 20-25, Valledupar', 'Historiador'),
    ('Gabriel Montoya', 'Avenida 25 # 30-35, Mocoa', 'Marketing'),
    ('Daniela García', 'Carrera 40 # 50-60, Riohacha', 'Emprendedor'),
    ('Julian Zapata', 'Calle 7 # 6-5, Arauca', 'Influencer'),
    ('Sofía Rojas', 'Avenida 10 # 12-15, Quindío', 'Fotógrafo'),
    ('Luisa Pérez', 'Carrera 30 # 35-40, Tolima', 'Pintor'),
    ('Martín Silva', 'Calle 5 # 8-10, Caquetá', 'Ingeniero'),
    ('Valentina López', 'Avenida 6 # 10-12, Guaviare', 'Nutricionista'),
    ('Juan Carlos Ramírez', 'Carrera 20 # 25-30, Vaupés', 'Músico'),
    ('Valeria Guzmán', 'Calle 15 # 18-20, Amazonas', 'Político'),
    ('Esteban Ríos', 'Avenida 7 # 8-10, San Andrés', 'Empresaria'),
    ('Natalia Quintero', 'Carrera 12 # 15-20, Providencia', 'Financiero'),
    ('Miguel Gómez', 'Calle 25 # 30-35, Chocó', 'Consultora'),
    ('Ana María Ramírez', 'Avenida 20 # 25-30, Guainía', 'Director'),
    ('Carlos Rojas', 'Carrera 18 # 15-10, Casanare', 'Estilista'),
    ('Carolina García', 'Calle 30 # 35-40, Vichada', 'Gastrónomo'),
    ('Camila López', 'Carrera 7 # 72-54, Bogotá', 'Ingeniera'),
    ('Juan Ramírez', 'Calle 10 # 33-25, Medellín', 'Médico'),
    ('María González', 'Avenida 5 # 15-10, Cali', 'Profesora'),
    ('Carlos Rodríguez', 'Carrera 25 # 50-15, Barranquilla', 'Abogado'),
    ('Laura Martínez', 'Carrera 30 # 40-20, Bucaramanga', 'Arquitecta'),
    ('Santiago Gómez', 'Calle 50 # 12-30, Cartagena', 'Economista'),
    ('Valentina Sánchez', 'Avenida 3 # 8-12, Manizales', 'Estudiante'),
    ('Jorge Pérez', 'Carrera 15 # 22-35, Pereira', 'Artista'),
    ('Ana Ramírez', 'Calle 7 # 5-10, Armenia', 'Actor'),
    ('Diego Vargas', 'Carrera 2 # 4-5, Santa Marta', 'Empresario'),
    ('Isabella Castro', 'Avenida 10 # 25-30, Villavicencio', 'Diseñadora'),
    ('Sebastián Herrera', 'Carrera 12 # 15-18, Cúcuta', 'Programador'),
    ('Natalia Díaz', 'Calle 80 # 90-45, Ibague', 'Consultora'),
    ('Andrés Rojas', 'Carrera 45 # 35-25, Pasto', 'Investigador'),
    ('Carolina Gutiérrez', 'Avenida 20 # 10-5, Neiva', 'Escritora'),
    ('David Torres', 'Calle 22 # 18-20, Tunja', 'Científico'),
    ('Valeria Muñoz', 'Carrera 18 # 12-8, Popayán', 'Periodista'),
    ('Felipe Ortiz', 'Calle 33 # 40-22, Quibdó', 'Chef'),
    ('Diana Gómez', 'Avenida 7 # 6-5, Montería', 'Psicóloga'),
    ('Alejandro Varela', 'Carrera 12 # 15-10, Florencia', 'Piloto'),
    ('Paola Jiménez', 'Calle 10 # 8-5, Sincelejo', 'Bióloga'),
    ('Andrea Castañeda', 'Avenida 5 # 4-3, Leticia', 'Geólogo'),
    ('Manuel Ramírez', 'Carrera 8 # 10-12, Yopal', 'Traductora'),
    ('Laura Soto', 'Calle 15 # 20-25, Valledupar', 'Historiador'),
    ('Gabriel Montoya', 'Avenida 25 # 30-35, Mocoa', 'Marketing'),
    ('Daniela García', 'Carrera 40 # 50-60, Riohacha', 'Emprendedor'),
    ('Julian Zapata', 'Calle 7 # 6-5, Arauca', 'Influencer'),
    ('Sofía Rojas', 'Avenida 10 # 12-15, Quindío', 'Fotógrafo'),
    ('Luisa Pérez', 'Carrera 30 # 35-40, Tolima', 'Pintor'),
    ('Martín Silva', 'Calle 5 # 8-10, Caquetá', 'Ingeniero'),
    ('Valentina López', 'Avenida 6 # 10-12, Guaviare', 'Nutricionista'),
    ('Juan Carlos Ramírez', 'Carrera 20 # 25-30, Vaupés', 'Músico'),
    ('Valeria Guzmán', 'Calle 15 # 18-20, Amazonas', 'Político'),
    ('Esteban Ríos', 'Avenida 7 # 8-10, San Andrés', 'Empresaria'),
    ('Natalia Quintero', 'Carrera 12 # 15-20, Providencia', 'Financiero'),
    ('Miguel Gómez', 'Calle 25 # 30-35, Chocó', 'Consultora'),
    ('Ana María Ramírez', 'Avenida 20 # 25-30, Guainía', 'Director'),
    ('Carlos Rojas', 'Carrera 18 # 15-10, Casanare', 'Estilista'),
    ('Carolina García', 'Calle 30 # 35-40, Vichada', 'Gastrónomo');
    
    
    -- inventario especie
	-- Inserción de datos para especies animales
	INSERT INTO inventario_especie(numero_individuos, area, especie)
	VALUES
		(10, 1, 1),    -- Perezoso de tres dedos en SAN JUAN DEL GUÍA
		(15, 2, 2),    -- Perezoso de dos dedos en LA PISCINA
		(20, 3, 3),    -- Tigrillo en ARENILLA
		(25, 4, 4),    -- Ocelote en ARRECIFE
		(30, 5, 5),    -- Puma en CAÑAVERAL
		(5, 6, 6),     -- Mono aullador en concha
		(8, 7, 7),     -- Mono tití en CHENGUE
		(3, 8, 8),     -- Tortuga carey en GAYRACA
		(12, 9, 9),    -- Tortuga verde en NEGUANJE
		(7, 10, 10),   -- Tortuga laúd en 7 OLAS
		(50, 11, 11),  -- Delfines en CINTO
		(40, 12, 12),  -- Ballenas en GUACHAKYTA
		(100, 13, 13), 
        (10, 17, 29),   -- Gato Andino en Cerro Nevada
		(15, 18, 30),   -- Jaguar en Valle del Río Frío
		(20, 19, 31),   -- Venadito en Bosque de Niebla
		(25, 20, 32),   -- Mono araña en Laguna de los Milagros
		(30, 21, 33),   -- Águila Arpía en Cascada Esmeralda
		(5, 22, 34),    -- Oso de anteojos en Pico Bolívar
		(8, 23, 35),    -- Tapir en Laguna Seca
		(3, 24, 36),    -- Frailejón plateado en Quebrada del Diablo
		(12, 25, 37),   -- Bromelia en Monte Verde
		(7, 26, 38),    -- Flor de maracuyá en Bosque de Palmas
		(50, 27, 39),   -- Roble Andino en Río Gaira
		(40, 28, 40),   -- Cedro Rosado en Sendero del Cóndor
		(100, 29, 41);  -- Esmaragdo en Páramo del Sol
	-- Inserción de datos para especies vegetales
	INSERT INTO inventario_especie(numero_individuos, area, especie)
	VALUES
		(200, 1, 14),   -- Palma de cera en SAN JUAN DEL GUÍA
		(150, 2, 14),   -- Palma de cera en LA PISCINA
		(100, 3, 15),   -- Bromelias en ARENILLA
		(80, 4, 16),    -- Orquídeas en ARRECIFE
		(120, 5, 17),   -- Manglares en CAÑAVERAL
		(300, 6, 18),   -- Cactus en concha
		(250, 7, 19),   -- Algas marinas en CHENGUE
		(180, 8, 20);   -- Especies arbóreas diversas en GAYRACA

	-- Inserción de datos para especies minerales
	INSERT INTO inventario_especie(numero_individuos, area, especie)
	VALUES
		(500, 9, 21),   -- Arenisca en NEGUANJE
		(300, 10, 22),  -- Granito en 7 OLAS
		(400, 11, 23),  -- Arcilla en CINTO
		(150, 12, 24),  -- Cuarcita en GUACHAKYTA
		(200, 13, 25),  -- Carbón en PALMARITO
		(100, 14, 26),  -- Rocas metamórficas en BRAVA
		(80, 15, 27);   -- Minerales de hierro en BOCA DEL SACO
        
-- personal
-- Insertar 4 registros de Personal de Gestión (tipo '001')
INSERT INTO personal (documento, nombre, direccion, telefono, sueldo, tipo, parque)
VALUES 
    (123456789, 'Carlos Sánchez', 'Carrera 5 #10-15, Santa Marta', '3012345678', 4000000.00, 'Personal de Gestión', 1),
    (234567890, 'Ana Gómez', 'Calle 23 #8-12, Santa Marta', '3056789012', 4100000.00, 'Personal de Gestión', 1),
    (345678901, 'Pedro Rodríguez', 'Avenida Libertador #15-30, Santa Marta', '3001234567', 4200000.00, 'Personal de Gestión', 1),
    (456789012, 'María Pérez', 'Carrera 7 #12-25, Santa Marta', '3045678901', 4300000.00, 'Personal de Gestión', 1);

-- Insertar 20 registros de Personal de Vigilancia (tipo '002')
INSERT INTO personal (documento, nombre, direccion, telefono, sueldo, tipo, parque)
VALUES 
    (567890123, 'Luis Martínez', 'Calle 45 #20-10, Santa Marta', '3012345678', 3500000.00, 'Personal de Vigilancia', 1),
    (678901234, 'Juan López', 'Avenida Circunvalar #30-40, Santa Marta', '3056789012', 3600000.00, 'Personal de Vigilancia', 1),
    (789012345, 'Elena Ramírez', 'Carrera 15 #5-25, Santa Marta', '3001234567', 3700000.00, 'Personal de Vigilancia', 1),
    (890123456, 'Gabriel Herrera', 'Calle 60 #18-12, Santa Marta', '3045678901', 3800000.00, 'Personal de Vigilancia', 1),
    (901234567, 'Sofía González', 'Carrera 10 #22-30, Santa Marta', '3012345678', 3900000.00, 'Personal de Vigilancia', 1),
    (123456780, 'Diego Castro', 'Calle 70 #35-15, Santa Marta', '3056789012', 4000000.00, 'Personal de Vigilancia', 1),
    (234567891, 'Laura Díaz', 'Avenida del Río #40-50, Santa Marta', '3001234567', 4100000.00, 'Personal de Vigilancia', 1),
    (345678902, 'Andrés Montoya', 'Carrera 25 #12-18, Santa Marta', '3045678901', 4200000.00, 'Personal de Vigilancia', 1),
    (456789013, 'Marta Jiménez', 'Calle 80 #28-30, Santa Marta', '3012345678', 4300000.00, 'Personal de Vigilancia', 1),
    (567890124, 'Javier Vargas', 'Carrera 30 #15-20, Santa Marta', '3056789012', 4400000.00, 'Personal de Vigilancia', 1),
    (678901235, 'Camila Restrepo', 'Avenida del Mar #50-60, Santa Marta', '3001234567', 4500000.00, 'Personal de Vigilancia', 1),
    (789012346, 'Felipe Soto', 'Calle 90 #38-42, Santa Marta', '3045678901', 4600000.00, 'Personal de Vigilancia', 1),
    (890123457, 'Valentina Sierra', 'Carrera 35 #22-28, Santa Marta', '3012345678', 4700000.00, 'Personal de Vigilancia', 1),
    (901234568, 'Daniel Cruz', 'Calle 100 #45-50, Santa Marta', '3056789012', 4800000.00, 'Personal de Vigilancia', 1),
    (123456781, 'Juliana Medina', 'Avenida Libertadores #60-70, Santa Marta', '3001234567', 4900000.00, 'Personal de Vigilancia', 1),
    (234567892, 'Roberto Torres', 'Carrera 40 #18-22, Santa Marta', '3045678901', 5000000.00, 'Personal de Vigilancia', 1),
    (345678903, 'Carolina Duarte', 'Calle 110 #48-52, Santa Marta', '3012345678', 5100000.00, 'Personal de Vigilancia', 1),
    (456789014, 'Fernando Varela', 'Carrera 45 #25-30, Santa Marta', '3056789012', 5200000.00, 'Personal de Vigilancia', 1),
    (567890125, 'Natalia Rojas', 'Calle 120 #58-62, Santa Marta', '3001234567', 5300000.00, 'Personal de Vigilancia', 1),
    (678901236, 'Ricardo Gómez', 'Avenida del Bosque #70-80, Santa Marta', '3045678901', 5400000.00, 'Personal de Vigilancia', 1);

-- Insertar 10 registros de Personal de Conservación (tipo '003')
INSERT INTO personal (documento, nombre, direccion, telefono, sueldo, tipo, parque)
VALUES 
    (789012348, 'Antonio Herrera', 'Calle 50 #30-10, Santa Marta', '3012345678', 4200000.00, 'Personal de Conservación', 1),
    (890123459, 'Isabel Cruz', 'Carrera 20 #10-5, Santa Marta', '3056789012', 4300000.00, 'Personal de Conservación', 1),
    (901234560, 'Jorge Sánchez', 'Avenida Sierra Nevada #15-20, Santa Marta', '3001234567', 4400000.00, 'Personal de Conservación', 1),
    (123456783, 'Ana María Giraldo', 'Calle 55 #25-30, Santa Marta', '3045678901', 4500000.00, 'Personal de Conservación', 1),
    (234567894, 'Gustavo Ríos', 'Carrera 22 #12-18, Santa Marta', '3012345678', 4600000.00, 'Personal de Conservación', 1),
    (345678905, 'Mariana Ramírez', 'Avenida del Prado #30-35, Santa Marta', '3056789012', 4700000.00, 'Personal de Conservación', 1),
    (456789016, 'Sebastián López', 'Calle 60 #28-32, Santa Marta', '3001234567', 4800000.00, 'Personal de Conservación', 1),
    (567890127, 'Valeria Gutiérrez', 'Carrera 25 #15-20, Santa Marta', '3045678901', 4900000.00, 'Personal de Conservación', 1),
    (678901238, 'Rafaela Castro', 'Avenida del Mar #40-45, Santa Marta', '3012345678', 5000000.00, 'Personal de Conservación', 1),
    (789012349, 'Martín Duque', 'Calle 70 #35-40, Santa Marta', '3056789012', 5100000.00, 'Personal de Conservación', 1);

-- Insertar 10 registros de Personal Investigador (tipo '004')
INSERT INTO personal (documento, nombre, direccion, telefono, sueldo, tipo, parque)
VALUES 
    (890123461, 'Luisa Martínez', 'Carrera 15 #5-10, Santa Marta', '3001234567', 6000000.00, 'Personal Investigador', 1),
    (123456784, 'Andrés Herrera', 'Calle 25 #10-15, Santa Marta', '3045678901', 6100000.00, 'Personal Investigador', 1),
    (234567895, 'Valentín Gómez', 'Avenida Libertadores #20-25, Santa Marta', '3012345678', 6200000.00, 'Personal Investigador', 1),
    (345678906, 'Camilo Ramírez', 'Carrera 30 #15-20, Santa Marta', '3056789012', 6300000.00, 'Personal Investigador', 1),
    (456789017, 'Carolina López', 'Calle 45 #18-22, Santa Marta', '3001234567', 6400000.00, 'Personal Investigador', 1),
    (567890128, 'Santiago Castro', 'Avenida del Río #25-30, Santa Marta', '3045678901', 6500000.00, 'Personal Investigador', 1),
    (678901239, 'Daniela Duarte', 'Carrera 40 #22-25, Santa Marta', '3012345678', 6600000.00, 'Personal Investigador', 1),
    (789012350, 'Roberto Gutiérrez', 'Calle 55 #30-35, Santa Marta', '3056789012', 6700000.00, 'Personal Investigador', 1),
    (890123462, 'Laura Ramírez', 'Avenida del Bosque #35-40, Santa Marta', '3001234567', 6800000.00, 'Personal Investigador', 1),
    (123456785, 'Juan Pablo Martínez', 'Calle 65 #28-32, Santa Marta', '3045678901', 6900000.00, 'Personal Investigador', 1);
    
    -- Insertar 4 registros de Personal de Gestión (tipo '001')
INSERT INTO personal (documento, nombre, direccion, telefono, sueldo, tipo, parque)
VALUES 
    (123456790, 'Carlos Sánchez', 'Carrera 5 #10-15, Santa Marta', '3012345678', 4000000.00, 'Personal de Gestión', 2),
    (234567891, 'Ana Gómez', 'Calle 23 #8-12, Santa Marta', '3056789012', 4100000.00, 'Personal de Gestión', 2),
    (345678902, 'Pedro Rodríguez', 'Avenida Libertador #15-30, Santa Marta', '3001234567', 4200000.00, 'Personal de Gestión', 2),
    (456789013, 'María Pérez', 'Carrera 7 #12-25, Santa Marta', '3045678901', 4300000.00, 'Personal de Gestión', 2);

-- Insertar 20 registros de Personal de Vigilancia (tipo '002')
INSERT INTO personal (documento, nombre, direccion, telefono, sueldo, tipo, parque)
VALUES 
    (567890134, 'Luis Martínez', 'Calle 45 #20-10, Santa Marta', '3012345678', 3500000.00, 'Personal de Vigilancia', 2),
    (678901245, 'Juan López', 'Avenida Circunvalar #30-40, Santa Marta', '3056789012', 3600000.00, 'Personal de Vigilancia', 2),
    (789012356, 'Elena Ramírez', 'Carrera 15 #5-25, Santa Marta', '3001234567', 3700000.00, 'Personal de Vigilancia', 2),
    (890123467, 'Gabriel Herrera', 'Calle 60 #18-12, Santa Marta', '3045678901', 3800000.00, 'Personal de Vigilancia', 2),
    (901234578, 'Sofía González', 'Carrera 10 #22-30, Santa Marta', '3012345678', 3900000.00, 'Personal de Vigilancia', 2),
    (123456790, 'Diego Castro', 'Calle 70 #35-15, Santa Marta', '3056789012', 4000000.00, 'Personal de Vigilancia', 2),
    (234567891, 'Laura Díaz', 'Avenida del Río #40-50, Santa Marta', '3001234567', 4100000.00, 'Personal de Vigilancia', 2),
    (345678902, 'Andrés Montoya', 'Carrera 25 #12-18, Santa Marta', '3045678901', 4200000.00, 'Personal de Vigilancia', 2),
    (456789013, 'Marta Jiménez', 'Calle 80 #28-30, Santa Marta', '3012345678', 4300000.00, 'Personal de Vigilancia', 2),
    (567890124, 'Javier Vargas', 'Carrera 30 #15-20, Santa Marta', '3056789012', 4400000.00, 'Personal de Vigilancia', 2),
    (678901235, 'Camila Restrepo', 'Avenida del Mar #50-60, Santa Marta', '3001234567', 4500000.00, 'Personal de Vigilancia', 2),
    (789012346, 'Felipe Soto', 'Calle 90 #38-42, Santa Marta', '3045678901', 4600000.00, 'Personal de Vigilancia', 2),
    (890123457, 'Valentina Sierra', 'Carrera 35 #22-28, Santa Marta', '3012345678', 4700000.00, 'Personal de Vigilancia', 2),
    (901234568, 'Daniel Cruz', 'Calle 100 #45-50, Santa Marta', '3056789012', 4800000.00, 'Personal de Vigilancia', 2),
    (123456791, 'Juliana Medina', 'Avenida Libertadores #60-70, Santa Marta', '3001234567', 4900000.00, 'Personal de Vigilancia', 2),
    (234567892, 'Roberto Torres', 'Carrera 40 #18-22, Santa Marta', '3045678901', 5000000.00, 'Personal de Vigilancia', 2),
    (345678903, 'Carolina Duarte', 'Calle 110 #48-52, Santa Marta', '3012345678', 5100000.00, 'Personal de Vigilancia', 2),
    (456789014, 'Fernando Varela', 'Carrera 45 #25-30, Santa Marta', '3056789012', 5200000.00, 'Personal de Vigilancia', 2),
    (567890135, 'Natalia Rojas', 'Calle 120 #58-62, Santa Marta', '3001234567', 5300000.00, 'Personal de Vigilancia', 2),
    (678901246, 'Ricardo Gómez', 'Avenida del Bosque #70-80, Santa Marta', '3045678901', 5400000.00, 'Personal de Vigilancia', 2);

-- Insertar 10 registros de Personal de Conservación (tipo '003')
INSERT INTO personal (documento, nombre, direccion, telefono, sueldo, tipo, parque)
VALUES 
    (789012358, 'Antonio Herrera', 'Calle 50 #30-10, Santa Marta', '3012345678', 4200000.00, 'Personal de Conservación', 2),
    (890123469, 'Isabel Cruz', 'Carrera 20 #10-5, Santa Marta', '3056789012', 4300000.00, 'Personal de Conservación', 2),
    (901234570, 'Jorge Sánchez', 'Avenida Sierra Nevada #15-20, Santa Marta', '3001234567', 4400000.00, 'Personal de Conservación', 2),
    (123456793, 'Ana María Giraldo', 'Calle 55 #25-30, Santa Marta', '3045678901', 4500000.00, 'Personal de Conservación', 2),
    (234567894, 'Gustavo Ríos', 'Carrera 22 #12-18, Santa Marta', '3012345678', 4600000.00, 'Personal de Conservación', 2),
    (345678905, 'Mariana Ramírez', 'Avenida del Prado #30-35, Santa Marta', '3056789012', 4700000.00, 'Personal de Conservación', 2),
    (456789016, 'Sebastián López', 'Calle 60 #28-32, Santa Marta', '3001234567', 4800000.00, 'Personal de Conservación', 2),
    (567890127, 'Valeria Gutiérrez', 'Carrera 25 #15-20, Santa Marta', '3045678901', 4900000.00, 'Personal de Conservación', 2),
    (678901238, 'Rafaela Castro', 'Avenida del Mar #40-45, Santa Marta', '3012345678', 5000000.00, 'Personal de Conservación', 2),
    (789012359, 'Martín Duque', 'Calle 70 #35-40, Santa Marta', '3056789012', 5100000.00, 'Personal de Conservación', 2);

-- Insertar 10 registros de Personal Investigador (tipo '004')
INSERT INTO personal (documento, nombre, direccion, telefono, sueldo, tipo, parque)
VALUES 
    (890123470, 'Luisa Martínez', 'Carrera 15 #5-10, Santa Marta', '3001234567', 6000000.00, 'Personal Investigador', 2),
    (123456794, 'Andrés Herrera', 'Calle 25 #10-15, Santa Marta', '3045678901', 6100000.00, 'Personal Investigador', 2),
    (234567895, 'Valentín Gómez', 'Avenida Libertadores #20-25, Santa Marta', '3012345678', 6200000.00, 'Personal Investigador', 2),
    (345678906, 'Camilo Ramírez', 'Carrera 30 #15-20, Santa Marta', '3056789012', 6300000.00, 'Personal Investigador', 2),
    (456789017, 'Carolina López', 'Calle 40 #20-25, Santa Marta', '3001234567', 6400000.00, 'Personal Investigador', 2),
    (567890128, 'Santiago Gutiérrez', 'Avenida del Bosque #25-30, Santa Marta', '3045678901', 6500000.00, 'Personal Investigador', 2),
    (678901239, 'Diana Castro', 'Carrera 50 #30-35, Santa Marta', '3012345678', 6600000.00, 'Personal Investigador', 2),
    (789012350, 'Felipe Duarte', 'Calle 60 #35-40, Santa Marta', '3056789012', 6700000.00, 'Personal Investigador', 2),
    (890123461, 'Luis Gómez', 'Avenida del Río #40-45, Santa Marta', '3001234567', 6800000.00, 'Personal Investigador', 2),
    (901234572, 'Mónica Sánchez', 'Carrera 55 #20-25, Santa Marta', '3045678901', 6900000.00, 'Personal Investigador', 2);


-- investigador - proyecto
INSERT INTO investigador_proyecto (investigador, proyecto) VALUES
    (39, 1), -- Luisa Martínez en Conservación del Perezoso de tres dedos
    (39, 2), -- Luisa Martínez en Estudio de hábitos del Tigrillo
    (40, 3), -- Andrés Herrera en Reforestación con Palma de cera
    (40, 4), -- Andrés Herrera en Protección de la Tortuga carey
    (41, 5), -- Valentín Gómez en Investigación sobre Manglares
    (41, 6), -- Valentín Gómez en Monitoreo de Delfines en la costa
    (42, 7), -- Camilo Ramírez en Preservación de Orquídeas
    (42, 8), -- Camilo Ramírez en Estudio de impacto en Minerales de hierro
    (43, 9), -- Carolina López en Conservación de Especies arbóreas diversas
    (43, 10), -- Carolina López en Investigación sobre Rocas metamórficas
    (44, 1), -- Santiago Castro en Conservación del Perezoso de tres dedos
    (44, 3), -- Santiago Castro en Reforestación con Palma de cera
    (39, 5), -- Luisa Martínez en Investigación sobre Manglares
    (40, 7), -- Andrés Herrera en Preservación de Orquídeas
    (41, 9), -- Valentín Gómez en Conservación de Especies arbóreas diversas
    (42, 2), -- Camilo Ramírez en Estudio de hábitos del Tigrillo
    (43, 4), -- Carolina López en Protección de la Tortuga carey
    (44, 6), -- Santiago Castro en Monitoreo de Delfines en la costa
    (39, 8), -- Luisa Martínez en Estudio de impacto en Minerales de hierro
    (40, 10); -- Andrés Herrera en Investigación sobre Rocas metamórficas


-- visitantes parque
-- Insertar registros en la tabla visitante_parque en desorden y sin usar todos los visitantes
INSERT INTO visitante_parque (visitante, parque, punto_acceso) VALUES
(1, 1, 3),  -- Camila López visitó Palangana
(5, 1, 2),  -- Laura Martínez visitó Calabazo
(7, 1, 4),  -- Valentina Sánchez visitó Neguanje
(10, 1, 1), -- Diego Vargas visitó Zaino
(12, 1, 6), -- Sebastián Herrera visitó Playa Cristal
(15, 1, 5), -- Carolina Gutiérrez visitó Cabo San Juan
(18, 1, 2), -- Diana Gómez visitó Calabazo
(21, 1, 3), -- Andrea Castañeda visitó Palangana
(25, 1, 1), -- Gabriel Montoya visitó Zaino
(28, 1, 5); -- Julian Zapata visitó Cabo San Juan

-- visitante - alojamiento
-- Insertando relaciones entre visitantes y alojamientos
INSERT INTO visitante_alojamiento (visitante, alojamiento) 
VALUES 
    (1, 1),   -- Camila López se aloja en Senda Koguiwa
    (5, 2),   -- Laura Martínez se aloja en ECOHABS Tayrona Park
    (7, 3),   -- Valentina Sánchez se aloja en CASA Tayrona Los Naranjos
    (10, 4),  -- Diego Vargas se aloja en CABAÑA Barlovento
    (12, 5),  -- Sebastián Herrera se aloja en MALOKA Barlovento
    (15, 6),  -- Carolina Gutiérrez se aloja en SENDA Watapuy
    (18, 1),  -- Diana Gómez se aloja en Senda Koguiwa
    (21, 2),  -- Andrea Castañeda se aloja en ECOHABS Tayrona Park
    (25, 3),  -- Gabriel Montoya se aloja en CASA Tayrona Los Naranjos
    (28, 4);  -- Otro ejemplo (ajusta según tus datos)


-- Actualizar los datos existentes en la tabla personal_conservacion con áreas y especialidades asignadas aleatoriamente
UPDATE personal_conservacion SET area = 5, especialidad = 'Botánica' WHERE id = 25;
UPDATE personal_conservacion SET area = 3, especialidad = 'Zoología' WHERE id = 26;
UPDATE personal_conservacion SET area = 8, especialidad = 'Ecología' WHERE id = 27;
UPDATE personal_conservacion SET area = 12, especialidad = 'Geología' WHERE id = 28;
UPDATE personal_conservacion SET area = 2, especialidad = 'Hidrología' WHERE id = 29;
UPDATE personal_conservacion SET area = 7, especialidad = 'Microbiología' WHERE id = 30;
UPDATE personal_conservacion SET area = 6, especialidad = 'Ornitología' WHERE id = 31;
UPDATE personal_conservacion SET area = 1, especialidad = 'Entomología' WHERE id = 32;
UPDATE personal_conservacion SET area = 4, especialidad = 'Climatología' WHERE id = 33;
UPDATE personal_conservacion SET area = 9, especialidad = 'Biología Marina' WHERE id = 34;



-- Actualizar los datos existentes en la tabla personal_gestion con punto de acceso
UPDATE personal_gestion SET punto_acceso = 1 WHERE id = 1;
UPDATE personal_gestion SET punto_acceso = 2 WHERE id = 2;
UPDATE personal_gestion SET punto_acceso = 3 WHERE id = 3;
UPDATE personal_gestion SET punto_acceso = 4 WHERE id = 4;

-- Agregar titulacion a los registros especificados
UPDATE personal_investigacion SET titulacion = 'Biología' WHERE id = 35;
UPDATE personal_investigacion SET titulacion = 'Ecología' WHERE id = 36;
UPDATE personal_investigacion SET titulacion = 'Gestión Ambiental' WHERE id = 37;
UPDATE personal_investigacion SET titulacion = 'Zoología' WHERE id = 38;
UPDATE personal_investigacion SET titulacion = 'Botánica' WHERE id = 39;
UPDATE personal_investigacion SET titulacion = 'Biología Marina' WHERE id = 40;
UPDATE personal_investigacion SET titulacion = 'Geología' WHERE id = 41;
UPDATE personal_investigacion SET titulacion = 'Conservación' WHERE id = 42;
UPDATE personal_investigacion SET titulacion = 'Ciencias Ambientales' WHERE id = 43;
UPDATE personal_investigacion SET titulacion = 'Ingeniería Forestal' WHERE id = 44;

-- Asignación aleatoria de área y vehículo al personal de vigilancia

UPDATE personal_vigilancia SET area = 8, vehiculo = 3 WHERE id = 5;
UPDATE personal_vigilancia SET area = 4, vehiculo = 4 WHERE id = 6;
UPDATE personal_vigilancia SET area = 14, vehiculo = 2 WHERE id = 7;
UPDATE personal_vigilancia SET area = 6, vehiculo = 1 WHERE id = 8;
UPDATE personal_vigilancia SET area = 11, vehiculo = 3 WHERE id = 9;
UPDATE personal_vigilancia SET area = 9, vehiculo = 2 WHERE id = 10;
UPDATE personal_vigilancia SET area = 12, vehiculo = 4 WHERE id = 11;
UPDATE personal_vigilancia SET area = 3, vehiculo = 1 WHERE id = 12;
UPDATE personal_vigilancia SET area = 5, vehiculo = 3 WHERE id = 13;
UPDATE personal_vigilancia SET area = 7, vehiculo = 4 WHERE id = 14;
UPDATE personal_vigilancia SET area = 16, vehiculo = 2 WHERE id = 15;
UPDATE personal_vigilancia SET area = 1, vehiculo = 1 WHERE id = 16;
UPDATE personal_vigilancia SET area = 15, vehiculo = 3 WHERE id = 17;
UPDATE personal_vigilancia SET area = 2, vehiculo = 4 WHERE id = 18;
UPDATE personal_vigilancia SET area = 10, vehiculo = 1 WHERE id = 19;
UPDATE personal_vigilancia SET area = 13, vehiculo = 2 WHERE id = 20;
UPDATE personal_vigilancia SET area = 8, vehiculo = 3 WHERE id = 21;
UPDATE personal_vigilancia SET area = 8, vehiculo = 3 WHERE id = 21;
UPDATE personal_vigilancia SET area = 4, vehiculo = 4 WHERE id = 22;
UPDATE personal_vigilancia SET area = 14, vehiculo = 1 WHERE id = 23;
UPDATE personal_vigilancia SET area = 6, vehiculo = 2 WHERE id = 24;
