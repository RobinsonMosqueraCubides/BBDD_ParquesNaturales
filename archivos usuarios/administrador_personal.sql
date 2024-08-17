-- ####################################
-- ########## administrador ###########
-- ############ personal ##############
-- ####################################

select * from history_administrador_personal;

use ParquesNaturalesColombia;
-- Llamar al procedimiento para agregar personal
CALL agregar_personal(12345678, 'Juan Pérez', 'Calle 123', '555-1234', 2500.00, 'Personal de Vigilancia', 1);

-- Llamar al procedimiento para modificar personal
CALL modificar_personal(45, 12345678, 'Juan andres', 'Calle 123', '555-5678', 2800.00, 'Personal de Vigilancia', 1);

-- Llamar al procedimiento para eliminar personal
CALL eliminar_personal(45);

-- Llamar al procedimiento para agregar titulación al personal de investigación
CALL actualizar_titulacion(35, 'pan');

-- Llamar al procedimiento para agregar área y especialidad al personal de conservación
CALL actualizar_area_especialidad(1, 1, 'Biología');

-- Llamar al procedimiento para agregar área y vehículo al personal de vigilancia
CALL actualizar_area_vehiculo(1, 1, 1);


-- asignar punto de acceso
CALL actualizar_punto_acceso(1, 1);


-- Supongamos que el investigador con ID 1 y el proyecto con ID 1 existen en sus respectivas tablas
CALL asignar_proyecto_a_investigador(40, 1);

