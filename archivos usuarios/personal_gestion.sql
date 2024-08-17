-- ###########################
-- ### personal de gestion ###
-- ###########################

-- Ejemplo de uso: Agregar un nuevo visitante
CALL AgregarVisitante('Juan Perez', 'Calle 123', 'Ingeniero');

-- Ejemplo de uso: Modificar un visitante existente
CALL ModificarVisitante(1, 'Juan Pérez Gómez', 'Calle 123, Piso 2', 'Arquitecto');

-- Ejemplo de uso: Eliminar un visitante
CALL EliminarVisitante(1);

-- Ejemplo de uso: Agregar una nueva relación entre visitante y parque
CALL AgregarRelacionVisitanteParque(1, 1, 1);
-- Esto agregaría la relación del visitante con ID 1 al parque con ID 1 utilizando el punto de acceso con ID 1.

-- Ejemplo de uso: Eliminar una relación entre visitante y parque
CALL EliminarRelacionVisitanteParque(1, 1);
-- Esto eliminaría la relación del visitante con ID 1 en el parque con ID 1.
