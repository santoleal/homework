-- DESAFÍO 4 - SQL - DESAFÍO LATAM G68
-- ESTUDIANTE: FELIPE LEAL ARANCIBIA



-- CREACIÓN BASE DE DATOS

CREATE DATABASE desafio4_felipe_leal_666;

-- 1) Crea y agrega al entregable las consultas para completar el setup de acuerdo a lo pedido. (1 Punto)

CREATE TABLE IF NOT EXISTS usuarios(
	id SERIAL, 
	email VARCHAR, 
	nombre VARCHAR, 
	apellido VARCHAR,
	rol VARCHAR);
	
INSERT INTO usuarios(email, nombre, apellido, rol) VALUES
	('juan@email.com', 'Juan', 'Pérez', 'administrador'),
	('maria@email.com', 'María', 'Gómez', 'usuario'),
	('pedro@email.com', 'Pedro', 'Rodríguez', 'usuario'),
	('laura@email.com', 'Laura', 'López', 'usuario'),
	('carlos@email.com', 'Carlos', 'García', 'usuario');



CREATE TABLE IF NOT EXISTS posts(
	id SERIAL,
	titulo VARCHAR,
	contenido TEXT,
	fecha_creacion TIMESTAMP,
	fecha_actualizacion TIMESTAMP,
	destacado BOOLEAN,
	usuario_id BIGINT);


INSERT INTO posts(titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) VALUES 
    ('Cómo Preparar una Deliciosa Ensalada de Verano', 'Mezcla fresca de lechuga, tomate, pepino y aderezo ligero. Una opción saludable y refrescante.', '2023-07-01', '2023-07-14', true, 1),
    ('Consejos para una Rutina de Ejercicio en Casa', 'Ejercicios de cuerpo completo, sin equipo. 30 minutos al día para mantenerse activo.', '2023-07-02', '2023-07-15', false, 1),
    ('Destinos de Ensueño para tu Próximo Viaje', 'Playas de aguas cristalinas, paisajes montañosos y culturas fascinantes esperan ser descubiertos.', '2023-07-03', '2023-07-16', true, 2),
    ('Ideas para Decorar tu Espacio de Trabajo en Casa', 'Colores suaves, plantas y organización para un ambiente inspirador y productivo.', '2023-07-04', '2023-07-17', false, 4),
    ('Recetas Rápidas y Deliciosas para el Desayuno', 'Smoothies nutritivos, avena con frutas y huevos revueltos. Despierta con energía y sabor.', '2023-07-05', '2023-07-18', false, NULL);


CREATE TABLE IF NOT EXISTS comentarios(
	id SERIAL,
	contenido TEXT,
	fecha_creacion TIMESTAMP,
	usuario_id BIGINT,
	post_id BIGINT);

INSERT INTO comentarios(contenido, fecha_creacion, usuario_id, post_id) VALUES
    ('Refrescante y deliciosa, ideal para días calurosos. ¡Me encantó!', '2023-07-02', 1, 1),
    ('Dejó mucho que desear...', '2023-07-05', 2, 1),
    ('Yo buscaría otras alternativas, mucho más sabrosas...', '2023-07-06', 3, 1),
    ('Los ejercicios en casa son prácticos y efectivos. ¡A seguirlos!', '2023-07-04', 1, 2),
    ('Los intenté pero casi morí en el intento...','2023-07-18', 2, 2);



/*_________________________*/

-- 2) Cruza los datos de la tabla usuarios y posts mostrando las siguientes columnas. nombre e email del usuario junto al título y contenido del post. (1 Punto)

SELECT usuarios.nombre, usuarios.email, posts.titulo, posts.contenido
FROM usuarios
RIGHT JOIN posts
ON usuarios.id = posts.usuario_id;

/* Se elige usar RIGHT JOIN para traer el conjunto de la izquierda y permitir dimensionar la cantidad de contenidos, a pesar de la ausencia de autorías -valor NULL- */






/*_________________________*/

-- 3. Muestra el id, título y contenido de los posts de los administradores. El administrador puede ser cualquier id. (1 Punto).


SELECT posts.id as id_contenidos, posts.titulo, posts.contenido
FROM posts
INNER JOIN usuarios
ON posts.usuario_id = usuarios.id
WHERE usuarios.rol = 'administrador';



/*_________________________*/
-- 4. Cuenta la cantidad de posts de cada usuario. La tabla resultante debe mostrar el id e email del usuario junto con la cantidad de posts de cada usuario. (1 Punto)
-- Hint importante: Aquí hay diferencia entre utilizar inner join, left join o right join, prueba con todas y con eso determina cual es la correcta. No da lo mismo la tabla desde la que se parte.

SELECT usuarios.id AS id_usuario, usuarios.email, COUNT(posts.usuario_id) AS total_posts
FROM usuarios
LEFT JOIN posts
ON usuarios.id = posts.usuario_id
GROUP BY id_usuario, usuarios.email
ORDER BY usuarios.id ASC;

/* Se eligió LEFT JOIN para listar a todos usuarios, tengan o no contenidos asociados. Se excluye el valor NULL */



/*_________________________*/

-- 5. Muestra el email del usuario que ha creado más posts. Aquí la tabla resultante tiene un único registro y muestra solo el email. (1 Punto)


SELECT usuarios.email
FROM usuarios
LEFT JOIN posts
ON usuarios.id = posts.usuario_id
GROUP BY usuarios.email
ORDER BY COUNT(posts.usuario_id) DESC
LIMIT 1;



/*_________________________*/
-- 6. Muestra la fecha del último post de cada usuario. (1 Punto)
-- Hint: Utiliza la función de agregado MAX sobre la fecha de creación.

SELECT usuarios.nombre, MAX(posts.fecha_creacion) AS ultimo_post
FROM usuarios
RIGHT JOIN posts
ON usuarios.id = posts.usuario_id
GROUP BY usuarios.nombre
ORDER BY ultimo_post ASC;

/* EN ESTE CASO, SE USA RIGHT PARA INCORPORAR LA FECHA DEL NOMBRE NULL */




/*_________________________*/
-- 7. Muestra el título y contenido del post (artículo) con más comentarios. (1 Punto)

SELECT posts.titulo, posts.contenido, COUNT(comentarios.post_id) AS cantidad_comentarios
FROM posts
INNER JOIN comentarios 
ON posts.id = comentarios.post_id
GROUP BY posts.titulo, posts.contenido
ORDER BY cantidad_comentarios DESC
LIMIT 1;


/*_________________________*/

-- 8. Muestra en una tabla el título de cada post, el contenido de cada post y el contenido de cada comentario asociado a los posts mostrados, junto con el email del usuario que lo escribió. (1 Punto)


SELECT posts.id, posts.titulo, posts.contenido AS posteo, comentarios.contenido AS comentario, usuarios.email
FROM posts
FULL JOIN comentarios ON posts.id = comentarios.post_id
LEFT JOIN usuarios ON usuarios.id = comentarios.usuario_id
ORDER BY posts.id ASC;

/* *** Para este ejercicio se añade una columna posts.id y se ordena con ella, para una mejor visualización de los 5 contenidos y su reiteración de acuerdo a cantidad de comentarios. 
*** Además, se opta por FULL para mostrar todos los registros de titulos y posteos, aunque no tengan comentarios.
*** Finalmente, los email se aclanan a la izquierda, respetando la operación de unión anterior.

*/




/*_________________________*/

-- 9. Muestra el contenido del último comentario de cada usuario. (1 Punto)


SELECT usuarios.nombre, comentarios.contenido, MAX(comentarios.fecha_creacion) AS ultimo_comentario 
FROM comentarios
INNER JOIN usuarios
ON usuarios.id = comentarios.usuario_id
WHERE (comentarios.fecha_creacion = (
    SELECT MAX(comentarios.fecha_creacion) 
    FROM comentarios 
    WHERE usuarios.id = comentarios.usuario_id ))
GROUP BY usuarios.nombre, comentarios.contenido;

/* Se le añade la columna comentarios.fecha_creacion, para una mejor visualización */




/*_________________________*/

-- 10. Muestra los emails de los usuarios que no han escrito ningún comentario. (1 Punto)
-- Hint: Recuerda el uso de Having


SELECT usuarios.id AS id_usuario, usuarios.email, comentarios.contenido AS ningun_comentario
FROM usuarios
LEFT JOIN comentarios
ON usuarios.id = comentarios.usuario_id
GROUP BY usuarios.id, usuarios.email, ningun_comentario
HAVING COUNT(comentarios.contenido) < 1;



/*_________________________*/
-- ESPERO QUE ESTÉ BIEN!
-- GRACIAS!
-- FLA