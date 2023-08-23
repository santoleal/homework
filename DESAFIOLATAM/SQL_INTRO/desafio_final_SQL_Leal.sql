/*PRUEBA FINAL DEL MÓDULO DE SQL 
DESAFÍO LATAM 2023 G 68 
ESTUDIANTE: FELIPE LEAL ARANCIBIA */
-- Con modificaciones 


CREATE TABLE Peliculas (
    "id" Integer NOT NULL,
    "nombre" Varchar(255),
    "anno" Integer,
    PRIMARY KEY ("id")
);

CREATE TABLE Tags (
    "id" Integer NOT NULL,
    "tag" Varchar(32),
    PRIMARY KEY ("id")
);




-- 1) REVISAR MODELO Y ADAPTARLO

CREATE TABLE PeliculasTags (
    "peliculas_id" Integer,
    "tag_id" Integer,
    FOREIGN KEY("peliculas_id") REFERENCES Peliculas("id"),
    FOREIGN KEY("tag_id") REFERENCES Tags("id")
);


-- 2) INSERTAR 5 PELÍCULAS Y 5 TAGS. 
/* 
Pelicula 1 -> 3 tags
Pelicula 2 -> 2 tags
*/

INSERT INTO Peliculas VALUES (1, 'Peli_1', '1940'),
(2, 'Peli_2', '1950'),
(3, 'Peli_3', '1960'),
(4, 'Peli_4', '1970'),
(5, 'Peli_5', '1980');

INSERT INTO Tags VALUES (1, 'Tag_1'),
(2, 'Tag_2'),
(3, 'Tag_3'),
(4, 'Tag_4'),
(5, 'Tag_5');


INSERT INTO PeliculasTags ("peliculas_id", "tag_id")
VALUES 
(1,1),
(1,2),
(1,3),
(2,3),
(2,4);


-- 3) CONTAR TAGS POR CADA PELÍCULA (LISTAR TODAS). DEVOLVER CERO CUANDO CORRESPONDE

SELECT Peliculas.nombre, count(PeliculasTags.peliculas_id) 
FROM Peliculas
LEFT JOIN PeliculasTags
ON Peliculas.id = PeliculasTags.peliculas_id
GROUP BY Peliculas.nombre
ORDER BY Peliculas.nombre ASC;



-- 4) CREAR TABLAS CORRESPONDIENTES AL MODELO DADO

CREATE TABLE preguntas (
    "id" Integer,
    "pregunta" Varchar(255),
    "respuesta_correcta" Varchar,
    PRIMARY KEY ("id")
);

CREATE TABLE usuarios (
    "id" Integer,
    "nombre" Varchar(255),
    "edad" Integer,
    PRIMARY KEY ("id")
);

CREATE TABLE respuestas (
    "id" Integer,
    "pregunta_id" Integer,
    "usuario_id" Integer,
    "respuesta" Varchar(255),
    PRIMARY KEY ("id"),
    FOREIGN KEY ("usuario_id") REFERENCES usuarios("id"),
    FOREIGN KEY ("pregunta_id") REFERENCES preguntas("id")
);


-- 5) CREAR 5 USUARIOS Y 5 PREGUNTAS
/*
 - P1 --> 2 respuestas correctas (2 usuarios distintos)
 - P2 --> 1 respuesta correcta (1 usuario)
 - P3 y P4  --> respuestas incorrectas
 - P5 --> N hay mención

 CORRECTO = ( RESPUESTAS == PREGUNTA(RESPUESTA) )
*/

INSERT INTO usuarios VALUES 
(1, 'nombre_1', 15),
(2, 'nombre_2', 20),
(3, 'nombre_3', 25),
(4, 'nombre_4', 30),
(5, 'nombre_5', 35);

INSERT INTO preguntas VALUES 
(1, 'pregunta_1', 'respuesta_1'),
(2, 'pregunta_2', 'respuesta_2'),
(3, 'pregunta_3', 'respuesta_3'),
(4, 'pregunta_4', 'respuesta_4'),
(5, 'pregunta_5', 'respuesta_5');

INSERT INTO respuestas VALUES
(1,1,1,'respuesta_1'),
(2,1,2,'respuesta_1'),
(3,2,1,'respuesta_2'),
(4,3,1,'respuesta_2'),
(5,4,2,'respuesta_2');


-- 6) CANTIDAD DE RESPUESTAS CORRECTAS TOTALES POR USUARIO (INDEPENDIENTE DE PREGUNTA)

SELECT usuarios.nombre AS usuario, COUNT(preguntas.respuesta_correcta) AS "respuestas correctas"
FROM usuarios
LEFT JOIN respuestas ON usuarios.id = respuestas.usuario_id
LEFT JOIN preguntas ON preguntas.id = respuestas.pregunta_id AND preguntas.respuesta_correcta = respuestas.respuesta
GROUP BY usuarios.nombre
ORDER BY usuarios.nombre ASC;


-- 7) POR CADA PREGUNTA, CONTAR USUARIOS CON RESPUESTAS CORRECTAS

SELECT preguntas.pregunta, COUNT(usuarios.id) AS "cantidad usuarios"
FROM preguntas
LEFT JOIN respuestas ON preguntas.id = respuestas.pregunta_id AND preguntas.respuesta_correcta = respuestas.respuesta
LEFT JOIN usuarios ON usuarios.id = respuestas.pregunta_id 
GROUP BY preguntas.pregunta
ORDER BY preguntas.pregunta ASC;




-- 8) BORRADO EN CASCADA DE RESPUESTAS AL BORRAR UN USUARIO (USER 1)

ALTER TABLE respuestas
DROP CONSTRAINT respuestas_usuario_id_fkey,
ADD CONSTRAINT respuestas_usuario_id_fkey
FOREIGN KEY ("usuario_id")
REFERENCES usuarios("id")
ON DELETE CASCADE; 

/* Se aplica el borrado */
DELETE FROM usuarios WHERE id = 1; 




-- 9) CREAR RESTRICCIÓN QUE IMPIDA AGREGAR A MENORES DE 18 (tabla usuarios)

ALTER TABLE usuarios 
ADD CONSTRAINT edad_check 
CHECK (edad >= 18);


/* Testear con Insert into   */



--10) SUMA CAMPO EMAIL EN TABLA USUARIO, CON RESTRICCIÓN DE ÚNICO

ALTER TABLE usuarios
ADD COLUMN "email" 
Varchar(255);

ALTER TABLE usuarios
ADD CONSTRAINT email_unique 
UNIQUE ("email"); 

/* Testear con Update*/


-- GRACIAS !
