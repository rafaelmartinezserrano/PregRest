DROP DATABASE IF EXISTS PREGRESP;
CREATE DATABASE PREGRESP;
USE PREGRESP;

CREATE TABLE categoria(
	idCategoria INT, 
	Nombre VARCHAR(25)NOT NULL,
	CONSTRAINT pk_categoria PRIMARY KEY (idCategoria)
);
CREATE TABLE jugador(
	idJugador INT AUTO_INCREMENT,
	alias VARCHAR(33),
	puntuacionTotal INT,
	CONSTRAINT pk_jugador PRIMARY KEY (idJugador)
);
CREATE TABLE partida(
	idPartida INT AUTO_INCREMENT,
	nombre VARCHAR (33),
	maxJugadores INT,
	finalizada BOOLEAN,
	CONSTRAINT pk_partida PRIMARY KEY (idPartida)
);
CREATE TABLE pregunta(
	idPregunta INT,
	enunciado VARCHAR(255)NOT NULL,
	idCategoria INT,
	CONSTRAINT pk_pregunta PRIMARY KEY (idPregunta),
	CONSTRAINT fk_pregunta_categoria FOREIGN KEY (idCategoria) REFERENCES categoria(idCategoria)
);
CREATE TABLE respuesta(
	idRespuesta INT AUTO_INCREMENT,
	texto VARCHAR(99),
	correcta BOOLEAN,
	idPregunta INT, 
	CONSTRAINT pk_respuesta PRIMARY KEY (idRespuesta),
	CONSTRAINT fk_respuesta_pregunta FOREIGN KEY (idPregunta) REFERENCES pregunta(idPregunta)
);
CREATE TABLE preguntasPartida(
	idPartida INT,
	idPregunta INT,
	CONSTRAINT fk_preguntasPartida_partida FOREIGN KEY (idPartida) REFERENCES partida(idPartida),
	CONSTRAINT fk_preguntasPartida_pregunta FOREIGN KEY (idPregunta) REFERENCES pregunta(idPregunta)
);
CREATE TABLE jugadoresPartida(
	idPartida INT,
	idJugador INT,
	CONSTRAINT fk_jugadoresPartida_partida FOREIGN KEY (idPartida) REFERENCES partida(idPartida),
	CONSTRAINT fk_jugadoresPartida_jugador FOREIGN KEY (idJugador) REFERENCES jugador(idJugador)
);



INSERT INTO categoria values(1, 'Ciencia y tecnología');
INSERT INTO categoria values(2, 'Geografía e historia');
INSERT INTO categoria values(3, 'Deportes');
INSERT INTO categoria values(4, 'Música');
INSERT INTO categoria values(5, 'Cine');


INSERT INTO PREGUNTA (idPregunta, enunciado, idCategoria) values (1, '¿Qué tiempo es el record olímpico de los 100 metros lisos masculinos?',3);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) values ('9.64', false, 1);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) values ('9.58', true, 1);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) values ('9.47', false, 1);

INSERT INTO PREGUNTA (idPregunta, enunciado, idCategoria) values (2, '¿Qué tiempo es el record olímpico de los 100 metros lisos femeninos?',3);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) values ('10.67', false, 2);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) values ('10.54', false, 2);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) values ('10.49', true, 2);


INSERT INTO PREGUNTA(idPregunta, enunciado, idCategoria) VALUES (301, '¿Qué elemento está presente en todas las moléculas orgánicas?', 1);

INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('Hidrógeno', false, 301);
INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('Oxígeno', false, 301);
INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('Carbono', true, 301);


INSERT INTO PREGUNTA(idPregunta, enunciado, idCategoria) VALUES (302, '¿Qué edad tiene la Tierra?', 1);

INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('4.543 millones de años', true, 302);
INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('6.108 millones de años', false, 302);
INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('2.920 millones de años', false, 302);


INSERT INTO PREGUNTA(idPregunta, enunciado, idCategoria) VALUES (303, '¿Cuántos elementos tiene la tabla periódica?', 1);

INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('104', false, 303);
INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('118', true, 303);
INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('109', false, 303);


INSERT INTO PREGUNTA(idPregunta, enunciado, idCategoria) VALUES (304, '¿Qué ciencia estudia la sangre?', 1);

INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('Hemodinamica', false, 304);
INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('Hemoglobina', false, 304);
INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('Hematología', true, 304);


INSERT INTO PREGUNTA(idPregunta, enunciado, idCategoria) VALUES (305, '¿En qué mes el Sol está más cerca de la Tierra?', 1);

INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('julio', false, 305);
INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('diciembre', true, 305);
INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('agosto', false, 305);


INSERT INTO PREGUNTA(idPregunta, enunciado, idCategoria) VALUES (306, 'De los cinco sentidos, ¿cuál se desarrolla primero?', 1);

INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('vista', false, 306);
INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('olfato', true, 306);
INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('tacto', false, 306);


INSERT INTO PREGUNTA(idPregunta,enunciado,idCategoria) VALUES(401,'¿Cúal de estas comunidades autónomas tiene solo una provincia?', 2 );

INSERT INTO RESPUESTA(texto,correcta,idPregunta) VALUES('Islas Baleares', true, 401);
INSERT INTO RESPUESTA(texto,correcta,idPregunta) VALUES('Aragón', false, 401);
INSERT INTO RESPUESTA(texto,correcta,idPregunta) VALUES('Valencia', false, 401);


INSERT INTO PREGUNTA(idPregunta,enunciado,idCategoria) VALUES(402,'¿Cúal de los siguientes ríos desemboca en el océano Atlántico?', 2 );

INSERT INTO RESPUESTA(texto,correcta,idPregunta) VALUES('Ebro', false, 402);
INSERT INTO RESPUESTA(texto,correcta,idPregunta) VALUES('Tajo', true, 402);
INSERT INTO RESPUESTA(texto,correcta,idPregunta) VALUES('Júcar', false, 402);

INSERT INTO PREGUNTA(idPregunta,enunciado,idCategoria) VALUES(403,'El principal río que desemboca en el mar Mediterráneo es el...?', 2 );

INSERT INTO RESPUESTA(texto,correcta,idPregunta) VALUES('Tajo', false, 403);
INSERT INTO RESPUESTA(texto,correcta,idPregunta) VALUES('Duero', false, 403);
INSERT INTO RESPUESTA(texto,correcta,idPregunta) VALUES('Ebro', true, 403);

INSERT INTO PREGUNTA(idPregunta,enunciado,idCategoria) VALUES(404,'¿Qué sistema montañoso divide a la Meseta española?', 2 );

INSERT INTO RESPUESTA(texto,correcta,idPregunta) VALUES('Bético', false, 404);
INSERT INTO RESPUESTA(texto,correcta,idPregunta) VALUES('Ibérico', false, 404);
INSERT INTO RESPUESTA(texto,correcta,idPregunta) VALUES('Central', true, 404);


INSERT INTO PREGUNTA(idPregunta,enunciado,idCategoria) VALUES(405,'Los Picos de Europa están en...?', 2 );

INSERT INTO RESPUESTA(texto,correcta,idPregunta) VALUES('Andalucía', false, 405);
INSERT INTO RESPUESTA(texto,correcta,idPregunta) VALUES('Asturias', true, 405);
INSERT INTO RESPUESTA(texto,correcta,idPregunta) VALUES('Cataluña', false, 405);


INSERT INTO PREGUNTA (idPregunta, enunciado, idCategoria) VALUES (700, '¿Quién saltó a la fama en 2008 con el lanzamiento del single I Kissed a Girl?', 4);

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Katy Perry', TRUE, 700);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Eric Clapton', FALSE, 700);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Rosalia', FALSE, 700); 

	
INSERT INTO  pregunta (idPregunta, enunciado, idCategoria) VALUES (701, '¿Qué famoso músico estadounidense ya fallecido se le considera el mejor guitarrista de todos los tiempos, y eso que era zurdo y le forzaron de pequeño a tocar con la derecha?', 4)  ;

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Led Zeppelin', FALSE, 701);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Jimmy Hendrix', TRUE, 701);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Chavela Vargas', FALSE, 701);	

		
INSERT INTO  pregunta (idPregunta, enunciado, idCategoria) VALUES (702, '¿Qué estrella del pop tocó 27 instrumentos diferentes en su álbum debut For You?', 4) ;

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Prince', TRUE, 702);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Edith Piaf', FALSE, 702);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Camarón', FALSE, 702);


INSERT INTO  pregunta (idPregunta, enunciado, idCategoria) VALUES (703, '¿Qué músico austriaco murió antes de terminar su importante obra Requiem?', 4);

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Redemption song', FALSE, 703);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Giacomo Puccini', FALSE, 703);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Wolfgang Amadeus Mozart', TRUE, 703);


INSERT INTO  pregunta (idPregunta, enunciado, idCategoria) VALUES (704, '¿Qué cantante ha tenido un Billboard número 1 en cada una de las últimas cuatro décadas?', 4);

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Mariah Carey', TRUE, 704);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Farrokh Bulsara', FALSE, 704);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Brie Larson', FALSE, 704);


INSERT INTO  pregunta (idPregunta, enunciado, idCategoria) VALUES (705, '¿Qué ícono del rock fue el fundador de la Sociedad para la Prevención de la Crueldad hacia los Hombres de Cabello Largo?', 4) ;

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Led Zeppeling', FALSE, 705);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('David Bowie', TRUE, 705);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Berry Gordy', FALSE, 705);


INSERT INTO  pregunta (idPregunta, enunciado, idCategoria) VALUES (706, '¿Quién fue la primera mujer en ser incluida en el Salón de la Fama del Rock and Roll?', 4) ;

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Lance Bass', FALSE, 706);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Aretha Franklin', TRUE, 706);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Dolly Parton', FALSE, 706);


INSERT INTO  pregunta (idPregunta, enunciado, idCategoria) VALUES (707, '¿Qué icono de la música francesa cantó como nadie La vie en Rose, por más versiones que se hayan hecho después?', 4) ;

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Santiago Auserón.', FALSE, 707);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Ariana Grande', FALSE, 707);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Edith Piaf', TRUE, 707);


INSERT INTO  pregunta (idPregunta, enunciado, idCategoria) VALUES (708, '¿Cúal es la única banda de rock de la historia en la que cada miembro ha compuesto una canción que ha llegado a ser número uno como single?', 4) ;

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Post Malone', FALSE, 708);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Queen', TRUE, 708);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Andrea Bocelli', FALSE, 708);


INSERT INTO  pregunta (idPregunta, enunciado, idCategoria) VALUES (709, '¿Qué compositor creó la bella Madama Butterfly?', 4) ;

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Calvin Harris', FALSE, 709);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Puccini', TRUE, 709);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Selena Gómez', FALSE, 709);


INSERT INTO  pregunta (idPregunta, enunciado, idCategoria) VALUES (710, '¿Qué canción se incluye siempre entre las canciones más bellas en español de todos los tiempos?', 4) ;

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Khalid, Marshmello', FALSE, 710);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('A Belén pastores, Camarón', FALSE, 710);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUE ('Mediterráneo, Serrat', TRUE, 710);


INSERT INTO PREGUNTA (idPregunta, enunciado, idCategoria) VALUES (100, '¿Cúales son los colores de los cinco anillos de los Juegos Olímpicos?', 3);

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ('Azul, rojo, amarillo, verde y negro', true, 100);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ('Azul, dorado, lila, verde y negro', false, 100);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ('Amarillo, dorado, lila, naranja, azul', false,  100);


INSERT INTO PREGUNTA (idPregunta, enunciado, idCategoria) VALUES (101, '¿Cúantos kilómetros de distancia mide una maratón?', 3);

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ('42,16 km', true,101);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ('15 km', false, 101);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ('20,5 km', false, 101);


INSERT INTO PREGUNTA (idPregunta, enunciado, idCategoria) VALUES (102, '¿Cúantas veces Michael Jordan ganó campeonatos para los Chicago Bulls?', 3);

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( '6', true, 102);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( '4', false, 102);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( '7', false, 102);


INSERT INTO PREGUNTA (idPregunta, enunciado, idCategoria) VALUES (103, '¿Qué deporte de los Juegos Olímpicos implica pliegues y picas?', 3);

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( 'natación', true, 103);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( 'esgrima', false, 103);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( 'salto con pértiga', false, 103);


INSERT INTO PREGUNTA (idPregunta, enunciado, idCategoria) VALUES (104, 'Manny Pacquiao es un boxeador legendario ¿de qué país?', 3);

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( 'Filipinas', true, 104);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( 'México', false, 104);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( 'U.S.A', false, 104);


INSERT INTO PREGUNTA (idPregunta, enunciado, idCategoria) VALUES (105, '¿Cuántos puntos vale un tiro libre en baloncesto?', 3);

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( '1', true, 105);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( '2', false, 105);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( '3', false, 105);

INSERT INTO PREGUNTA (idPregunta, enunciado, idCategoria) VALUES (106, '¿Qué parte de tu cuerpo no debe tocar el balón en el fútbol?', 3);

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( 'mano', true, 106);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( 'rodilla', false, 106);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( 'espalda', false, 106);


INSERT INTO PREGUNTA (idPregunta, enunciado, idCategoria) VALUES (107, '¿Cuántos jugadores hay en un equipo de béisbol?', 3);

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( '9', true, 107);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( '7', false, 107);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( '10', false, 107);

INSERT INTO PREGUNTA (idPregunta, enunciado, idCategoria) VALUES (108, '¿Cuál es el significado de NBA?', 3);

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( 'Asociación Nacional de Basquetbol', true, 108);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( 'Administración Nacional de Baloncesto', false, 108);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( 'Administración Nacional de Canasta', false, 108);

INSERT INTO PREGUNTA (idPregunta, enunciado, idCategoria) VALUES (109, '¿Cuántos rounds hay en un solo juego de boxeo profesional?', 3);

INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( '12', true, 109);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( '9', false, 109);
INSERT INTO RESPUESTA (texto, correcta, idPregunta) VALUES ( '13', false, 109);


INSERT INTO PREGUNTA(idPregunta, enunciado, idCategoria) VALUES (600, '¿Cuántos oscars consiguió Forrest Gump?', 5);

INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES (6, true, 600);	
INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES (9, false, 600);	
INSERT INTO RESPUESTA(texto, correcta, idPregunta) VALUES ('ninguno', false, 600);


INSERT INTO Pregunta (idPregunta, enunciado, idCategoria) VALUES (200 , '¿Qué dia es la fiesta de la hispanidad?', 2);

INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('12 de octubre', true, 200);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('25 de julio', false, 200);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('6 de diciembre', false, 200);


INSERT INTO Pregunta (idPregunta, enunciado, idCategoria) VALUES (201 , '¿Dónde se firmo la Constitucion Española de 1812?', 2);

INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('Madrid', false, 201);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('Cadiz', true, 201);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('Toledo', false, 201);


INSERT INTO Pregunta (idPregunta, enunciado, idCategoria) VALUES (202 , '¿Cúal era el apodo de Fernando VII?', 2);

INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('El Embrujado', false, 202);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('El Empecinado', false, 202);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('El Deseado', true, 202);


INSERT INTO Pregunta (idPregunta, enunciado, idCategoria) VALUES (203 , '¿En que año se produjo la caida del Muro de Berlin?', 2);

INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('1990', false, 203);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('1991', false, 203);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('1989', true, 203);


INSERT INTO Pregunta (idPregunta, enunciado, idCategoria) VALUES (204 , '¿Como se llama la Presidenta de la Comision Europea?', 2);

INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('Frances Fitzgerald', false, 204);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('Ursula von der Leyen', true, 204); 
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('Christine Anderson', false, 204);


INSERT INTO PREGUNTA(idPregunta, enunciado, idCategoria) VALUES (601, '¿Quién protagoniza El Paciente inglés?', 5);

INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('Lola Flores',false,601);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('Juliette Binoche',true,601);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('Sandra Bullock',false,601);


INSERT INTO PREGUNTA(idPregunta, enunciado, idCategoria) VALUES (602, '¿En que año se estreno Matrix?', 5);

INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('1997',false,602);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('1999',true,602);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('2002',false,602);


INSERT INTO PREGUNTA(idPregunta, enunciado, idCategoria) VALUES (603, '¿En que año se estreno la guerra de las galaxias?', 5);

INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('1982',false,603);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('1977',true,603);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('1974',false,603);


INSERT INTO PREGUNTA(idPregunta, enunciado, idCategoria) VALUES (604, '¿Con que pelicula consiguó Al Pacino el oscar?', 5);

INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('Esencia de mujer',false,604);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('El Padrino',true,604);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('Tarde de perros',false,604);

	
INSERT INTO PREGUNTA(idPregunta, enunciado, idCategoria) VALUES (605, '¿En qué año se estrenó Harry Potter?', 5);		

INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('2001',true,605);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('2003',false,605);
INSERT INTO Respuesta (texto, correcta, idPregunta) VALUES ('2005',false,605);

/*	UPDATE respuesta SET idPregunta = 405 WHERE texto LIKE 'Andalucía%';
	UPDATE respuesta SET idPregunta = 405 WHERE texto LIKE 'Asturias%';
	UPDATE respuesta SET idPregunta = 405 WHERE texto LIKE 'Cataluña%';
	
	UPDATE respuesta SET texto = '42,16 km'
	 WHERE texto LIKE 'Azul, rojo, amarillo, verde y negro' and idPregunta like 101;

	UPDATE respuesta SET texto = '15 km'
	 WHERE texto LIKE '15 km%' and idPregunta like 101;

	UPDATE respuesta SET texto = '20,5 km'
	 WHERE texto LIKE 'Amarillo, dorado, lila, naranja, azul%' and idPregunta like 101;
	 
select * from respuesta where idPregunta like 100   */
