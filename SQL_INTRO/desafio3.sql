-- DESAFÍO 3 - SQL - DESAFÍOLATAM G68
-- ESTUDIANTE: FELIPE LEAL ARANCIBIA

/* INSTRUCCIONES

Aplicando los conceptos y herramientas aprendidas hasta ahora, crea las queries SQL necesarias que permitan responder las siguientes preguntas.

*/

-- CREAR DATABASE

CREATE DATABASE desafio3_felipe_leal_666;


-- TABLA DE TRABAJO E INSERTAR VALORES
CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );


-- 1) ¿Cuántos registros hay?

SELECT COUNT(*) 
FROM INSCRITOS; --RESULTADO: 16 Registros



-- 2) ¿Cuántos inscritos hay en total?

SELECT SUM(CANTIDAD) 
FROM INSCRITOS; --RESULTADO: 774




-- 3)  ¿Cuál o cuáles son los registros de mayor antigüedad?
-- HINT: ocupar subconsultas

--OPCIÓN 1:
SELECT * 
FROM INSCRITOS 
ORDER BY FECHA 
DESC LIMIT 5; -- Se define arbitariamente los 5 más antiguos.

-- OPCIÓN 2, CON SUBCONSULTA, GENERANDO UN PROMEDIO DE FECHA Y SOLICITANDO QUE DEVUELVA LAS MAYORES O IGUALES A ESE PROMEDIO, MOSTRANDO LA MITAD MÁS ANTIGUA:
SELECT *
FROM INSCRITOS
WHERE FECHA >= (
	SELECT TO_DATE(ROUND(AVG(EXTRACT(JULIAN FROM FECHA)))::TEXT,'J') AS FECHA_PROMEDIO
	FROM INSCRITOS)
ORDER BY FECHA ASC;

-- FUENTE DE LA QUERY: CHAT GPT, TRAS VARIAS CONSULTAS.



-- 4) ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)

SELECT FECHA, SUM(CANTIDAD) AS INSCRITOS_X_DIA
FROM INSCRITOS
GROUP BY FECHA
ORDER BY INSCRITOS_X_DIA DESC;

/* RESULTADO:   

"fecha"	        "inscritos_x_dia"
"2021-08-01"	            182
"2021-02-01"	            120
"2021-03-01"	            103
"2021-01-01"	            100
"2021-04-01"	            93
"2021-05-01"	            88
"2021-07-01"	            58
"2021-06-01"	            30
*/



-- 5) ¿Cuántos inscritos hay por fuente?

SELECT FUENTE, SUM(CANTIDAD) AS INSCRITOS_X_FUENTE
FROM INSCRITOS
GROUP BY FUENTE;

/* RESULTADO: 

"fuente"	"inscritos_x_fuente"
"Página"	    441
"Blog"	        333
*/


-- 6) ¿Qué día se inscribió la mayor cantidad de personas? ¿Cuántas personas se inscribieron en ese día?

SELECT FECHA, SUM(CANTIDAD) AS INSCRITOS_X_DIA
FROM INSCRITOS
GROUP BY FECHA
ORDER BY INSCRITOS_X_DIA DESC
LIMIT 1;

/* RESULTADO:

"fecha"     	"inscritos_x_dia"
"2021-08-01"        	182

*/



-- 7) ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog? ¿Cuántas personas fueron?
-- HINT: si hay más de un registro, tomar el primero

SELECT *
FROM INSCRITOS
WHERE FUENTE = 'Blog'
ORDER BY CANTIDAD DESC
LIMIT 1;

/* RESULTADO:

"cantidad"	        "fecha"	            "fuente"
83	            "2021-08-01"	        "Blog"

*/




-- 8) ¿Cuál es el promedio de personas inscritas por día?

SELECT FECHA, ROUND(AVG(CANTIDAD),1) AS PROMEDIO_INSCRITOS
FROM INSCRITOS
GROUP BY FECHA
ORDER BY PROMEDIO_INSCRITOS DESC;


/* RESULTADO: 

"fecha"	        "promedio_inscritos"
"2021-08-01"	        91.0
"2021-02-01"	        60.0
"2021-03-01"	        51.5
"2021-01-01"	        50.0
"2021-04-01"	        46.5
"2021-05-01"	        44.0
"2021-07-01"	        29.0
"2021-06-01"	        15.0

*/

-- 9) ¿Qué días se inscribieron más de 50 personas? 

SELECT FECHA, SUM(CANTIDAD) AS CANTIDAD_INSCRITOS
FROM INSCRITOS
GROUP BY FECHA
HAVING SUM(CANTIDAD) >= 50
ORDER BY CANTIDAD_INSCRITOS DESC;

/* RESULTADO: 

"fecha"	        "cantidad_inscritos"
"2021-08-01"	        182
"2021-02-01"	        120
"2021-03-01"	        103
"2021-01-01"	        100
"2021-04-01"	        93
"2021-05-01"	        88
"2021-07-01"	        58
*/



-- 10) ¿Cuál es el promedio diario de personas inscritas a partir del tercer día en adelante, considerando únicamente las fechas posteriores o iguales a la indicada?
-- HINT: ingresa manualmente la fecha del tercer día


SELECT FECHA, ROUND(AVG(CANTIDAD),1) AS PROMEDIO_INSCRITOS_DIARIO
FROM INSCRITOS
GROUP BY FECHA
HAVING FECHA >= '2021-03-01'
ORDER BY FECHA ASC;

/* RESULTADO:
"fecha"	        "promedio_inscritos_diario"
"2021-03-01"	        51.5
"2021-04-01"	        46.5
"2021-05-01"	        44.0
"2021-06-01"	        15.0
"2021-07-01"	        29.0
"2021-08-01"	        91.0
*/



-- ESPERO QUE ESTÉ BIEN!
-- GRACIAS!
-- FLA