-- #####################################
-- ########## procedimientos ###########
-- #####################################

-- Procedimiento para agregar o eliminar departamento sin especificar ID
DELIMITER //

CREATE PROCEDURE agregar_eliminar_departamento(
    IN opcion VARCHAR(10),  -- 'agregar' o 'eliminar'
    IN nombre_departamento VARCHAR(50),
    IN id_entidad_responsable INT
)
BEGIN
    IF opcion = 'agregar' THEN
        INSERT INTO departamentos (nombre, entidad_responsable)
        VALUES (nombre_departamento, id_entidad_responsable);
    ELSEIF opcion = 'eliminar' THEN
        DELETE FROM departamentos WHERE nombre = nombre_departamento AND entidad_responsable = id_entidad_responsable;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Opción no válida';
    END IF;
END //

DELIMITER ;


-- Procedimiento para agregar, eliminar o modificar entidad responsable sin especificar ID
DELIMITER //

CREATE PROCEDURE agregar_eliminar_modificar_entidad_responsable(
    IN opcion VARCHAR(15),  -- 'agregar', 'eliminar' o 'modificar'
    IN nombre_entidad VARCHAR(50),
    IN direccion_entidad VARCHAR(50),
    IN telefono_entidad INT
)
BEGIN
    IF opcion = 'agregar' THEN
        INSERT INTO entidad_responsable (nombre, direccion, telefono)
        VALUES (nombre_entidad, direccion_entidad, telefono_entidad);
    ELSEIF opcion = 'eliminar' THEN
        DELETE FROM entidad_responsable WHERE nombre = nombre_entidad LIMIT 1;
    ELSEIF opcion = 'modificar' THEN
        UPDATE entidad_responsable
        SET direccion = direccion_entidad, telefono = telefono_entidad
        WHERE nombre = nombre_entidad LIMIT 1;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Opción no válida';
    END IF;
END //

DELIMITER ;




-- Procedimiento para agregar, eliminar o modificar parque sin especificar ID
DELIMITER //

CREATE PROCEDURE agregar_eliminar_modificar_parque(
    IN opcion VARCHAR(15),  -- 'agregar', 'eliminar' o 'modificar'
    IN nombre_parque VARCHAR(50),
    IN fecha_declaracion DATE
)
BEGIN
    IF opcion = 'agregar' THEN
        INSERT INTO parques_naturales (nombre, fecha_declaracion)
        VALUES (nombre_parque, fecha_declaracion);
    ELSEIF opcion = 'eliminar' THEN
        DELETE FROM parques_naturales WHERE nombre = nombre_parque LIMIT 1;
    ELSEIF opcion = 'modificar' THEN
        UPDATE parques_naturales
        SET fecha_declaracion = fecha_declaracion
        WHERE nombre = nombre_parque LIMIT 1;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Opción no válida';
    END IF;
END //

DELIMITER ;



-- procedimiento  para comprobar que el punto de acceso si pertenece a ese parque
DELIMITER //
CREATE PROCEDURE validar_punto_acceso(IN new_parque INT, IN new_punto_acceso INT)
BEGIN
    DECLARE cnt INT;
    -- Comprobar si el punto de acceso pertenece al parque
    SELECT COUNT(*)
    INTO cnt
    FROM punto_acceso
    WHERE id = new_punto_acceso AND parque = new_parque;
    
    IF cnt = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El punto de acceso no pertenece al parque';
    END IF;
END //
DELIMITER ;








-- ############ administrador de parque #########

DELIMITER //

-- Procedimiento para agregar un alojamiento
CREATE PROCEDURE agregar_alojamiento(
    IN p_nombre VARCHAR(25),
    IN p_capacidad INT,
    IN p_categoria ENUM('hotel', 'cabaña'),
    IN p_parque INT
)
BEGIN
    INSERT INTO alojamientos (nombre, capacidad, categoria, parque)
    VALUES (p_nombre, p_capacidad, p_categoria, p_parque);
END //

-- Procedimiento para eliminar un alojamiento
CREATE PROCEDURE eliminar_alojamiento(
    IN p_id INT
)
BEGIN
    DELETE FROM alojamientos WHERE id = p_id;
END //

-- Procedimiento para modificar un alojamiento
CREATE PROCEDURE modificar_alojamiento(
    IN p_id INT,
    IN p_nombre VARCHAR(25),
    IN p_capacidad INT,
    IN p_categoria ENUM('hotel', 'cabaña'),
    IN p_parque INT
)
BEGIN
    UPDATE alojamientos
    SET nombre = p_nombre, capacidad = p_capacidad, categoria = p_categoria, parque = p_parque
    WHERE id = p_id;
END //

-- Procedimiento para agregar un punto de acceso
CREATE PROCEDURE agregar_punto_acceso(
    IN p_parque INT,
    IN p_nombre VARCHAR(50)
)
BEGIN
    INSERT INTO punto_acceso (parque, nombre)
    VALUES (p_parque, p_nombre);
END //

-- Procedimiento para eliminar un punto de acceso
CREATE PROCEDURE eliminar_punto_acceso(
    IN p_id INT
)
BEGIN
    DELETE FROM punto_acceso WHERE id = p_id;
END //

-- Procedimiento para modificar un punto de acceso
CREATE PROCEDURE modificar_punto_acceso(
    IN p_id INT,
    IN p_parque INT,
    IN p_nombre VARCHAR(50)
)
BEGIN
    UPDATE punto_acceso
    SET parque = p_parque, nombre = p_nombre
    WHERE id = p_id;
END //

-- Procedimiento para agregar un área
CREATE PROCEDURE agregar_area(
    IN p_nombre VARCHAR(25),
    IN p_extension DECIMAL(10,2),
    IN p_parque INT
)
BEGIN
    INSERT INTO area (nombre, extension, parque)
    VALUES (p_nombre, p_extension, p_parque);
END //

-- Procedimiento para eliminar un área
CREATE PROCEDURE eliminar_area(
    IN p_id INT
)
BEGIN
    DELETE FROM area WHERE id = p_id;
END //

-- Procedimiento para modificar un área
CREATE PROCEDURE modificar_area(
    IN p_id INT,
    IN p_nombre VARCHAR(25),
    IN p_extension DECIMAL(10,2),
    IN p_parque INT
)
BEGIN
    UPDATE area
    SET nombre = p_nombre, extension = p_extension, parque = p_parque
    WHERE id = p_id;
END //

DELIMITER ;


-- agregar personal
DELIMITER //

CREATE PROCEDURE agregar_personal(
    IN p_documento INT,
    IN p_nombre VARCHAR(50),
    IN p_direccion VARCHAR(50),
    IN p_telefono VARCHAR(15),
    IN p_sueldo DECIMAL(10,2),
    IN p_tipo ENUM('Personal de Gestión', 'Personal de Vigilancia', 'Personal de Conservación', 'Personal Investigador'),
    IN p_parque INT
)
BEGIN
    INSERT INTO personal (documento, nombre, direccion, telefono, sueldo, tipo, parque)
    VALUES (p_documento, p_nombre, p_direccion, p_telefono, p_sueldo, p_tipo, p_parque);

    INSERT INTO history_administrador_personal (accion, registro)
    VALUES ('agregar', p_nombre);
END //

DELIMITER ;


-- modificar personal
DELIMITER //

CREATE PROCEDURE modificar_personal(
    IN p_id INT,
    IN p_documento INT,
    IN p_nombre VARCHAR(50),
    IN p_direccion VARCHAR(50),
    IN p_telefono VARCHAR(15),
    IN p_sueldo DECIMAL(10,2),
    IN p_tipo ENUM('Personal de Gestión', 'Personal de Vigilancia', 'Personal de Conservación', 'Personal Investigador'),
    IN p_parque INT
)
BEGIN
    UPDATE personal
    SET documento = p_documento,
        nombre = p_nombre,
        direccion = p_direccion,
        telefono = p_telefono,
        sueldo = p_sueldo,
        tipo = p_tipo,
        parque = p_parque
    WHERE id = p_id;

    INSERT INTO history_administrador_personal (accion, registro)
    VALUES ('modificar', p_nombre);
END //

DELIMITER ;


-- eliminar personal 
DELIMITER //

CREATE PROCEDURE eliminar_personal(
    IN p_id INT
)
BEGIN
    -- Recuperar el nombre del personal antes de eliminarlo
    DECLARE nombre_personal VARCHAR(50);
    SELECT nombre INTO nombre_personal FROM personal WHERE id = p_id;

    -- Eliminar las filas relacionadas en investigador_proyecto primero
    DELETE FROM investigador_proyecto WHERE investigador = p_id;

    -- Eliminar las filas relacionadas en las tablas secundarias
    DELETE FROM personal_gestion WHERE id = p_id;
    DELETE FROM personal_investigacion WHERE id = p_id;
    DELETE FROM personal_conservacion WHERE id = p_id;
    DELETE FROM personal_vigilancia WHERE id = p_id;
    
    -- Luego eliminar la fila en la tabla personal
    DELETE FROM personal WHERE id = p_id;

    -- Registrar la acción en history_administrador_personal
    INSERT INTO history_administrador_personal (accion, registro)
    VALUES ('eliminar', nombre_personal);
END //

DELIMITER ;


-- titulacion al personal de investigacion
DELIMITER //

CREATE PROCEDURE actualizar_titulacion(
    IN p_id INT,
    IN p_titulacion VARCHAR(25)
)
BEGIN
    UPDATE personal_investigacion
    SET titulacion = p_titulacion
    WHERE id = p_id;

    INSERT INTO history_administrador_personal (accion, registro)
    VALUES ('modificar', (SELECT nombre FROM personal_investigacion WHERE id = p_id));
END //

DELIMITER ;


-- area y especialidad al personal de conservacion
DELIMITER //

CREATE PROCEDURE actualizar_area_especialidad(
    IN p_id INT,
    IN p_area INT,
    IN p_especialidad VARCHAR(25)
)
BEGIN
    UPDATE personal_conservacion
    SET area = p_area,
        especialidad = p_especialidad
    WHERE id = p_id;

    INSERT INTO history_administrador_personal (accion, registro)
    VALUES ('modificar', (SELECT nombre FROM personal_conservacion WHERE id = p_id));
END //

DELIMITER ;


-- area y vehiculo al personal de vigilancia
DELIMITER //

CREATE PROCEDURE actualizar_area_vehiculo(
    IN p_id INT,
    IN p_area INT,
    IN p_vehiculo INT
)
BEGIN
    UPDATE personal_vigilancia
    SET area = p_area,
        vehiculo = p_vehiculo
    WHERE id = p_id;

    INSERT INTO history_administrador_personal (accion, registro)
    VALUES ('modificar', (SELECT nombre FROM personal_vigilancia WHERE id = p_id));
END //

DELIMITER ;


-- punto acceso personal de gestion
DELIMITER //

CREATE PROCEDURE actualizar_punto_acceso(
    IN p_id INT,
    IN p_punto_acceso INT
)
BEGIN
    UPDATE personal_gestion
    SET punto_acceso = p_punto_acceso
    WHERE id = p_id;

    INSERT INTO history_administrador_personal (accion, registro)
    VALUES ('modificar', (SELECT nombre FROM personal_gestion WHERE id = p_id));
END //

DELIMITER ;


-- proyecto a un investigador
DELIMITER //

CREATE PROCEDURE asignar_proyecto_a_investigador(
    IN p_id_investigador INT,
    IN p_id_proyecto INT
)
BEGIN
    INSERT INTO investigador_proyecto (investigador, proyecto)
    VALUES (p_id_investigador, p_id_proyecto);

    INSERT INTO history_administrador_personal (accion, registro)
    VALUES ('modificar', (SELECT nombre FROM personal_investigacion WHERE id = p_id_investigador));
END //

DELIMITER ;

-- agregar usuario a alojamiento
DELIMITER //

CREATE PROCEDURE agregar_visitante_a_alojamiento(
    IN p_id_visitante INT,
    IN p_id_alojamiento INT
)
BEGIN
    DECLARE capacidad_actual INT;
    DECLARE capacidad_total INT;

    -- Obtener capacidad actual del alojamiento
    SELECT COUNT(*) INTO capacidad_actual 
    FROM visitante_alojamiento 
    WHERE alojamiento = p_id_alojamiento;

    -- Obtener capacidad total del alojamiento
    SELECT capacidad INTO capacidad_total 
    FROM alojamientos 
    WHERE id = p_id_alojamiento;

    -- Verificar si hay espacio disponible
    IF capacidad_actual < capacidad_total THEN
        -- Si hay espacio disponible, agregar el visitante al alojamiento
        INSERT INTO visitante_alojamiento (visitante, alojamiento)
        VALUES (p_id_visitante, p_id_alojamiento);
    ELSE
        -- Si no hay espacio, generar un error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El alojamiento está completo';
    END IF;
END //

DELIMITER ;

DELIMITER //
-- eliminar visitante de alojamiento
CREATE PROCEDURE eliminar_visitante_de_alojamiento(
    IN p_id_visitante INT,
    IN p_id_alojamiento INT
)
BEGIN
    DECLARE num_rows INT;

    -- Verificar si el visitante está alojado en el alojamiento
    SELECT COUNT(*) INTO num_rows
    FROM visitante_alojamiento
    WHERE visitante = p_id_visitante AND alojamiento = p_id_alojamiento;

    -- Si el visitante está alojado, proceder con la eliminación
    IF num_rows > 0 THEN
        DELETE FROM visitante_alojamiento
        WHERE visitante = p_id_visitante AND alojamiento = p_id_alojamiento;
    ELSE
        -- Si el visitante no está alojado en el alojamiento, generar un error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El visitante no está registrado en este alojamiento';
    END IF;
END //

DELIMITER ;


-- Procedimiento para agregar un nuevo visitante
DELIMITER //

CREATE PROCEDURE AgregarVisitante(
    IN p_nombre VARCHAR(50),
    IN p_direccion VARCHAR(50),
    IN p_profesion VARCHAR(50)
)
BEGIN
    -- Insertar el nuevo visitante
    INSERT INTO visitantes (Nombre, direccion, profesion)
    VALUES (p_nombre, p_direccion, p_profesion);

    -- Registrar la acción en el historial
    INSERT INTO history_personal_gestion (accion, hora_actual)
    VALUES ('agregar', CURRENT_TIMESTAMP);

    -- Seleccionar el ID del último visitante insertado
    SELECT LAST_INSERT_ID() AS nuevo_id;
END //

DELIMITER ;


-- Procedimiento para modificar los datos de un visitante
DELIMITER //

CREATE PROCEDURE ModificarVisitante(
    IN p_id INT,
    IN p_nombre VARCHAR(50),
    IN p_direccion VARCHAR(50),
    IN p_profesion VARCHAR(50)
)
BEGIN
    -- Actualizar los datos del visitante
    UPDATE visitantes
    SET Nombre = p_nombre, direccion = p_direccion, profesion = p_profesion
    WHERE id = p_id;

    -- Registrar la acción en el historial
    INSERT INTO history_personal_gestion (accion, hora_actual)
    VALUES ('modificar', CURRENT_TIMESTAMP);
END //

DELIMITER ;



-- Procedimiento para eliminar un visitante
DELIMITER //

CREATE PROCEDURE EliminarVisitante(
    IN p_id INT
)
BEGIN
    DECLARE v_nombre VARCHAR(50);

    -- Obtener el nombre del visitante que se va a eliminar
    SELECT Nombre INTO v_nombre FROM visitantes WHERE id = p_id;

    -- Eliminar registros relacionados en otras tablas
    DELETE FROM visitante_alojamiento WHERE visitante = p_id;
    DELETE FROM visitante_parque WHERE visitante = p_id;

    -- Eliminar al visitante de la tabla visitantes
    DELETE FROM visitantes WHERE id = p_id;

    -- Registrar la acción en el historial
    INSERT INTO history_personal_gestion (accion, hora_actual)
    VALUES ('eliminar', CURRENT_TIMESTAMP);
END //

DELIMITER ;



-- Procedimiento para agregar una nueva relación entre visitante y parque
DELIMITER //

CREATE PROCEDURE AgregarRelacionVisitanteParque(
    IN p_visitante INT,
    IN p_parque INT,
    IN p_punto_acceso INT
)
BEGIN
    -- Insertar la relación entre visitante y parque
    INSERT INTO visitante_parque (visitante, parque, punto_acceso)
    VALUES (p_visitante, p_parque, p_punto_acceso);

    -- Registrar la acción en el historial
    INSERT INTO history_personal_gestion (accion, hora_actual)
    VALUES ('agregar', CURRENT_TIMESTAMP);
END //

DELIMITER ;

-- Procedimiento para eliminar una relación entre visitante y parque
DELIMITER //

CREATE PROCEDURE EliminarRelacionVisitanteParque(
    IN p_visitante INT,
    IN p_parque INT
)
BEGIN
    -- Eliminar la relación entre visitante y parque
    DELETE FROM visitante_parque
    WHERE visitante = p_visitante AND parque = p_parque;

    -- Registrar la acción en el historial
    INSERT INTO history_personal_gestion (accion, hora_actual)
    VALUES ('eliminar', CURRENT_TIMESTAMP);
END //

DELIMITER ;



