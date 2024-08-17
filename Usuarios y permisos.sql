-- #################################
-- ###### usuarios y permisos ###### 
-- #################################
-- crear usuario Administrador
CREATE USER 'administrador'@'%' IDENTIFIED BY 'administrador123';
-- permisos
GRANT ALL PRIVILEGES ON ParquesNaturalesColombia.* TO 'administrador'@'%';


-- Crear el usuario administrador_parque
CREATE USER 'administrador_parque'@'%' IDENTIFIED BY 'administradorparque123';
-- Otorgar permisos para usar la base de datos
GRANT USAGE ON ParquesNaturalesColombia.* TO 'administrador_parque'@'%';


-- Otorgar permisos para ejecutar procedimientos específicos
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.agregar_alojamiento TO 'administrador_parque'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.eliminar_alojamiento TO 'administrador_parque'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.modificar_alojamiento TO 'administrador_parque'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.agregar_punto_acceso TO 'administrador_parque'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.eliminar_punto_acceso TO 'administrador_parque'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.modificar_punto_acceso TO 'administrador_parque'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.agregar_area TO 'administrador_parque'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.eliminar_area TO 'administrador_parque'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.modificar_area TO 'administrador_parque'@'%';


-- crear usuario administrador personal
CREATE USER 'administrador_personal'@'%' IDENTIFIED BY 'administradorpersonal123';
-- Otorgar permisos para usar la base de datos
GRANT USAGE ON ParquesNaturalesColombia.* TO 'administrador_personal'@'%';
-- Asignar permisos para ejecutar procedimientos específicos
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.agregar_personal TO 'administrador_personal'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.modificar_personal TO 'administrador_personal'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.eliminar_personal TO 'administrador_personal'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.actualizar_titulacion TO 'administrador_personal'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.actualizar_area_especialidad TO 'administrador_personal'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.actualizar_area_vehiculo TO 'administrador_personal'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.actualizar_punto_acceso TO 'administrador_personal'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.asignar_proyecto_a_investigador TO 'administrador_personal'@'%';
grant select on ParquesNaturalesColombia.personal to 'administrador_personal'@'%';
grant select on ParquesNaturalesColombia.personal_conservacion to 'administrador_personal'@'%';
grant select on ParquesNaturalesColombia.personal_gestion to 'administrador_personal'@'%';
grant select on ParquesNaturalesColombia.personal_investigacion to 'administrador_personal'@'%';
grant select on ParquesNaturalesColombia.personal_vigilancia to 'administrador_personal'@'%';
grant select on ParquesNaturalesColombia.history_administrador_personal to 'administrador_personal'@'%';


-- crear usuario administrador alojamiento
create user 'administrador_alojamiento'@'%' identified by 'administradoralojamiento123';

-- otorgar permiso para utilizar la base de datos
GRANT USAGE ON ParquesNaturalesColombia.* TO 'administrador_alojamiento'@'%';
-- Asignar permisos para ejecutar procedimientos específicos
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.agregar_visitante_a_alojamiento TO 'administrador_alojamiento'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.eliminar_visitante_de_alojamiento TO 'administrador_alojamiento'@'%';
grant select on ParquesNaturalesColombia.alojamientos TO 'administrador_alojamiento'@'%';
grant select on ParquesNaturalesColombia.visitante_alojamiento TO 'administrador_alojamiento'@'%';


-- Crear usuario personal_gestion 
CREATE USER 'personal_gestion'@'%' IDENTIFIED BY 'personalgestion123';

-- Otorgar permisos para acceder a la base de datos ParquesNaturalesColombia
GRANT USAGE ON ParquesNaturalesColombia.* TO 'personal_gestion'@'%';

-- Otorgar permisos para ejecutar los procedimientos mencionados
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.AgregarVisitante TO 'personal_gestion'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.ModificarVisitante TO 'personal_gestion'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.EliminarVisitante TO 'personal_gestion'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.AgregarRelacionVisitanteParque TO 'personal_gestion'@'%';
GRANT EXECUTE ON PROCEDURE ParquesNaturalesColombia.EliminarRelacionVisitanteParque TO 'personal_gestion'@'%';

-- Otorgar permisos para ver las tablas afectadas
GRANT SELECT ON ParquesNaturalesColombia.visitantes TO 'personal_gestion'@'%';
GRANT SELECT ON ParquesNaturalesColombia.visitante_parque TO 'personal_gestion'@'%';
GRANT SELECT ON ParquesNaturalesColombia.history_personal_gestion TO 'personal_gestion'@'%';
GRANT SELECT ON ParquesNaturalesColombia.history_administrador_personal TO 'personal_gestion'@'%';
GRANT SELECT ON ParquesNaturalesColombia.history_administrador_parque TO 'personal_gestion'@'%';





