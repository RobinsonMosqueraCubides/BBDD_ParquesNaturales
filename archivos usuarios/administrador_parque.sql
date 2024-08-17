-- ###############################################
-- ####### EJEMPLOS DE LLAMADAS A PROCEDIMIENTOS #
-- #######     Administrador de parque     #######
-- ###############################################
use ParquesNaturalesColombia;
select * from alojamientos;
select * from punto_acceso;
select * from area;
select * from history_administrador_parque;
-- Ejemplo de llamada para agregar un alojamiento
CALL agregar_alojamiento('Hotel Los Lagos', 50, 'hotel', 1);

-- Ejemplo de llamada para eliminar un alojamiento
CALL eliminar_alojamiento(8);

-- Ejemplo de llamada para modificar un alojamiento
CALL modificar_alojamiento(8, 'Cabaña El Refugio', 10, 'cabaña', 1);

-- Ejemplo de llamada para agregar un punto de acceso
CALL agregar_punto_acceso(1, 'Entrada Norte');

-- Ejemplo de llamada para eliminar un punto de acceso
CALL eliminar_punto_acceso(7);

-- Ejemplo de llamada para modificar un punto de acceso
CALL modificar_punto_acceso(7, 1, 'Entrada Sur');

-- Ejemplo de llamada para agregar un área
CALL agregar_area('Zona de Investigación', 500.50, 1);

-- Ejemplo de llamada para eliminar un área
CALL eliminar_area(17);

-- Ejemplo de llamada para modificar un área
CALL modificar_area(17, 'Zona de Conservación', 300.75, 1);
