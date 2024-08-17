-- ###########################
-- ###### Administrador ###### 
-- ###########################
use ParquesNaturalesColombia;

-- ver historial de actividad de los usuarios
select * from history_administrador;
select * from history_administrador_alojamiento;
select * from history_administrador_parque;
select * from history_administrador_personal;
select * from history_personal_gestion;

-- numero de parques en cada departamento
SELECT d.nombre AS Departamento, COUNT(dp.parque) AS NumeroDeParques
FROM departamentos d
LEFT JOIN departamento_parque dp ON d.id = dp.departamento
GROUP BY d.nombre;

-- Agregar departamento
CALL agregar_eliminar_departamento('agregar', 'panama',1);

-- Eliminar departamento (solo se necesita el nombre)
CALL agregar_eliminar_departamento('eliminar', 'panama', NULL);

-- Agregar entidad responsable
CALL agregar_eliminar_modificar_entidad_responsable('agregar', 'eduar', 'Calle Ejemplo 123', 123456789);

-- Eliminar entidad responsable (solo se necesita el nombre)
CALL agregar_eliminar_modificar_entidad_responsable('eliminar', 'eduar', NULL,null);

-- Modificar entidad responsable (se necesita el nombre para identificar y los nuevos valores)
CALL agregar_eliminar_modificar_entidad_responsable('modificar', 'eduar', 'Nueva Dirección', 987654321);

-- Agregar parque natural
CALL agregar_eliminar_modificar_parque('agregar', 'pepe', '2024-01-01');

-- Eliminar parque natural (solo se necesita el nombre)
CALL agregar_eliminar_modificar_parque('eliminar', 'pepe', NULL);

-- Modificar parque natural (se necesita el nombre para identificar y la nueva fecha)
CALL agregar_eliminar_modificar_parque('modificar', 'pepe', '2023-01-01');
