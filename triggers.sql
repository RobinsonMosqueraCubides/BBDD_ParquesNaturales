-- ###############################
-- ########## triggers ###########
-- ###############################

DELIMITER //
-- Trigger para auto llenar las tablas segun el personal
CREATE TRIGGER after_personal_insert
AFTER INSERT ON personal
FOR EACH ROW
BEGIN
    DECLARE tipo_persona VARCHAR(50);
    
    -- Determinar el tipo de persona según el campo 'tipo' en la tabla 'personal'
    SELECT CASE NEW.tipo
        WHEN 'Personal de Gestión' THEN 'gestion'
        WHEN 'Personal de Vigilancia' THEN 'vigilancia'
        WHEN 'Personal de Conservación' THEN 'conservacion'
        WHEN 'Personal Investigador' THEN 'investigacion'
        ELSE NULL
    END INTO tipo_persona;
    
    -- Insertar en la tabla correspondiente según el tipo
    IF tipo_persona = 'gestion' THEN
        INSERT INTO personal_gestion (id, nombre, punto_acceso)
        VALUES (NEW.id, NEW.nombre, NULL);
        
    ELSEIF tipo_persona = 'vigilancia' THEN
        INSERT INTO personal_vigilancia (id, nombre, area, vehiculo)
        VALUES (NEW.id, NEW.nombre, NULL, NULL);
        
    ELSEIF tipo_persona = 'conservacion' THEN
        INSERT INTO personal_conservacion (id, nombre, area, especialidad)
        VALUES (NEW.id, NEW.nombre, NULL, NULL);
        
    ELSEIF tipo_persona = 'investigacion' THEN
        INSERT INTO personal_investigacion (id, nombre, titulacion)
        VALUES (NEW.id, NEW.nombre, NULL);
        
    END IF;
    
END //

DELIMITER ;




-- trigger para comprobar la capacidad de un hotel

DELIMITER //

CREATE TRIGGER check_capacity_before_insert
BEFORE INSERT ON visitante_alojamiento
FOR EACH ROW
BEGIN
    DECLARE current_count INT;
    DECLARE max_capacity INT;

    -- Contar el número actual de visitantes en el alojamiento específico
    SELECT COUNT(*) INTO current_count
    FROM visitante_alojamiento
    WHERE alojamiento = NEW.alojamiento;

    -- Verificar la capacidad máxima del alojamiento
    SELECT capacidad INTO max_capacity
    FROM alojamientos
    WHERE id = NEW.alojamiento;

    -- Si el número actual de visitantes es mayor o igual a la capacidad máxima, lanzar un error
    IF current_count >= max_capacity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Capacidad máxima del alojamiento alcanzada';
    END IF;
END; //

DELIMITER ;





-- trigger para comprobar que el punto de acceso si pertenece a ese parque
DELIMITER //
CREATE TRIGGER trigger_validar_punto_acceso
BEFORE INSERT ON visitante_parque
FOR EACH ROW
BEGIN
    CALL validar_punto_acceso(NEW.parque, NEW.punto_acceso);
END //
DELIMITER ;



-- comprobar alojamiento y parque del visitante
DELIMITER //

CREATE TRIGGER validar_visitante_en_parque
BEFORE INSERT ON visitante_alojamiento
FOR EACH ROW
BEGIN
    DECLARE parque_alojamiento INT;

    -- Obtener el parque correspondiente al alojamiento
    SELECT parque INTO parque_alojamiento
    FROM alojamientos
    WHERE id = NEW.alojamiento;

    -- Verificar que el visitante esté en el parque correspondiente
    IF NOT EXISTS (
        SELECT 1
        FROM visitante_parque
        WHERE visitante = NEW.visitante
        AND parque = parque_alojamiento
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El visitante no se encuentra en el parque correspondiente al alojamiento.';
    END IF;
END //

DELIMITER ;



DELIMITER //
-- trigger para revisar que el area seleccionada para el personal de conservacion si pertenezca al parque
CREATE TRIGGER check_area_before_update
BEFORE UPDATE ON personal_conservacion
FOR EACH ROW
BEGIN
    DECLARE parque_area INT;
    DECLARE parque_personal INT;

    -- Obtener el parque asociado al área seleccionada
    SELECT parque INTO parque_area
    FROM area
    WHERE id = NEW.area;

    -- Obtener el parque asociado al personal
    SELECT parque INTO parque_personal
    FROM personal
    WHERE id = NEW.id;

    -- Verificar si el parque del área coincide con el parque del personal
    IF parque_area != parque_personal THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El área seleccionada no se encuentra en el parque donde trabaja el personal.';
    END IF;
END//

DELIMITER ;


-- Trigger para registrar acciones en history_personal_gestion
DELIMITER //

CREATE TRIGGER trg_history_personal_gestion
AFTER INSERT ON visitantes
FOR EACH ROW
BEGIN
    INSERT INTO history_personal_gestion (accion)
    VALUES ('agregar');
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_history_personal_gestion_modificar
AFTER UPDATE ON visitantes
FOR EACH ROW
BEGIN
    INSERT INTO history_personal_gestion (accion)
    VALUES ('modificar');
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_history_personal_gestion_eliminar
AFTER DELETE ON visitantes
FOR EACH ROW
BEGIN
    INSERT INTO history_personal_gestion (accion)
    VALUES ('eliminar');
END //

DELIMITER ;


DELIMITER //
-- trigger para revisar que el punto de acceso si pertenece al parque
CREATE TRIGGER check_punto_acceso_before_update
BEFORE UPDATE ON personal_gestion
FOR EACH ROW
BEGIN
    DECLARE parque_punto_acceso INT;
    DECLARE parque_personal INT;

    -- Obtener el parque asociado al punto de acceso seleccionado
    SELECT parque INTO parque_punto_acceso
    FROM punto_acceso
    WHERE id = NEW.punto_acceso;

    -- Obtener el parque asociado al personal
    SELECT parque INTO parque_personal
    FROM personal
    WHERE id = NEW.id;

    -- Verificar si el parque del punto de acceso coincide con el parque del personal
    IF parque_punto_acceso != parque_personal THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El punto de acceso seleccionado no se encuentra en el parque donde trabaja el personal.';
    END IF;
END//

DELIMITER ;




-- ############################ triggers para las acciones del administrador ############################
DELIMITER //

CREATE TRIGGER trg_history_administrador
AFTER INSERT ON departamentos
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador (accion, registro)
    VALUES ('agregar', 'departamento');
END //

CREATE TRIGGER trg_history_administrador_update_departamentos
AFTER DELETE ON departamentos
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador (accion, registro)
    VALUES ('eliminar', 'departamento');
END //

CREATE TRIGGER trg_history_administrador_insert_entidad_responsable
AFTER INSERT ON entidad_responsable
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador (accion, registro)
    VALUES ('agregar', 'entidad_responsable');
END //

CREATE TRIGGER trg_history_administrador_delete_entidad_responsable
AFTER DELETE ON entidad_responsable
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador (accion, registro)
    VALUES ('eliminar', 'entidad_responsable');
END //

CREATE TRIGGER trg_history_administrador_update_entidad_responsable
AFTER UPDATE ON entidad_responsable
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador (accion, registro)
    VALUES ('modificar', 'entidad_responsable');
END //

CREATE TRIGGER trg_history_administrador_insert_parque
AFTER INSERT ON parques_naturales
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador (accion, registro)
    VALUES ('agregar', 'parque');
END //

CREATE TRIGGER trg_history_administrador_delete_parque
AFTER DELETE ON parques_naturales
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador (accion, registro)
    VALUES ('eliminar', 'parque');
END //

CREATE TRIGGER trg_history_administrador_update_parque
AFTER UPDATE ON parques_naturales
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador (accion, registro)
    VALUES ('modificar', 'parque');
END //

DELIMITER ;




DELIMITER //

-- Trigger para evitar duplicados al agregar departamento
CREATE TRIGGER trg_check_duplicate_departamento
BEFORE INSERT ON departamentos
FOR EACH ROW
BEGIN
    DECLARE count_departamentos INT;
    SELECT COUNT(*) INTO count_departamentos FROM departamentos WHERE nombre = NEW.nombre;
    
    IF count_departamentos > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe un departamento con este nombre.';
    END IF;
END //

-- Trigger para evitar duplicados al agregar entidad responsable
CREATE TRIGGER trg_check_duplicate_entidad_responsable
BEFORE INSERT ON entidad_responsable
FOR EACH ROW
BEGIN
    DECLARE count_entidades INT;
    SELECT COUNT(*) INTO count_entidades FROM entidad_responsable WHERE nombre = NEW.nombre;
    
    IF count_entidades > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe una entidad responsable con este nombre.';
    END IF;
END //

-- Trigger para evitar duplicados al agregar parque natural
CREATE TRIGGER trg_check_duplicate_parque
BEFORE INSERT ON parques_naturales
FOR EACH ROW
BEGIN
    DECLARE count_parques INT;
    SELECT COUNT(*) INTO count_parques FROM parques_naturales WHERE nombre = NEW.nombre;
    
    IF count_parques > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe un parque natural con este nombre.';
    END IF;
END //

DELIMITER ;



-- trigger para la tabla history_administrador_parque

-- Triggers para la tabla alojamientos
DELIMITER //

CREATE TRIGGER after_insert_alojamiento
AFTER INSERT ON alojamientos
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador_parque (accion, registro)
    VALUES ('agregar', 'alojamiento');
END//

CREATE TRIGGER after_update_alojamiento
AFTER UPDATE ON alojamientos
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador_parque (accion, registro)
    VALUES ('modificar', 'alojamiento');
END//

CREATE TRIGGER after_delete_alojamiento
AFTER DELETE ON alojamientos
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador_parque (accion, registro)
    VALUES ('eliminar', 'alojamiento');
END//

-- Triggers para la tabla punto_acceso
CREATE TRIGGER after_insert_punto_acceso
AFTER INSERT ON punto_acceso
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador_parque (accion, registro)
    VALUES ('agregar', 'punto_acceso');
END//

CREATE TRIGGER after_update_punto_acceso
AFTER UPDATE ON punto_acceso
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador_parque (accion, registro)
    VALUES ('modificar', 'punto_acceso');
END//

CREATE TRIGGER after_delete_punto_acceso
AFTER DELETE ON punto_acceso
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador_parque (accion, registro)
    VALUES ('eliminar', 'punto_acceso');
END//

-- Triggers para la tabla area
CREATE TRIGGER after_insert_area
AFTER INSERT ON area
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador_parque (accion, registro)
    VALUES ('agregar', 'area');
END//

CREATE TRIGGER after_update_area
AFTER UPDATE ON area
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador_parque (accion, registro)
    VALUES ('modificar', 'area');
END//

CREATE TRIGGER after_delete_area
AFTER DELETE ON area
FOR EACH ROW
BEGIN
    INSERT INTO history_administrador_parque (accion, registro)
    VALUES ('eliminar', 'area');
END//

DELIMITER ;


-- registro de alojamiento
DELIMITER //

CREATE TRIGGER trg_history_administrador_alojamiento
AFTER INSERT ON visitante_alojamiento
FOR EACH ROW
BEGIN
    DECLARE accion VARCHAR(10);

    IF NEW.visitante IS NOT NULL THEN
        SET accion = 'agregar';
    ELSE
        SET accion = 'eliminar';
    END IF;

    INSERT INTO history_administrador_alojamiento (accion, registro)
    VALUES (accion, CONCAT('Visitante ID: ', NEW.visitante, ', Alojamiento ID: ', NEW.alojamiento));
END //

DELIMITER ;
