CREATE TABLE categoria(
	idCategoria INT, 
	Nombre VARCHAR(25)NOT NULL,
	CONSTRAINT pk_categoria PRIMARY KEY (idCategoria)
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
CREATE TABLE partida(
	idPartida INT AUTO_INCREMENT,
	nombre VARCHAR (33),
	maxJugadores INT,
	finalizada BOOLEAN,
	CONSTRAINT pk_partida PRIMARY KEY (idPartida)
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
CREATE TABLE jugador(
	idJugador INT AUTO_INCREMENT,
	alias VARCHAR(33),
	puntuacionTotal INT,
	CONSTRAINT pk_jugador PRIMARY KEY (idJugador)
);

SHOW TABLES;
