
select *
from pregunta;

select *
from respuesta;

INSERT INTO pregunta(idPregunta, enunciado, idCategoria)
	VALUES (600, 'Cuántos oscars consiguió Forrest Gump?', 5);
INSERT INTO pregunta(idPregunta, enunciado, idCategoria)
	VALUES (601, 'Quién protagoniza El Paciente inglés?', 5);
INSERT INTO pregunta(idPregunta, enunciado, idCategoria)
	VALUES (602, 'En que año se estreno Matrix?', 5);	
INSERT INTO pregunta(idPregunta, enunciado, idCategoria)
	VALUES (603, 'En que año se estreno la guerra de las galaxias?', 5);
INSERT INTO pregunta(idPregunta, enunciado, idCategoria)
	VALUES (604, 'Con que pelicula consiguó Al Pacino el oscar?', 5);	
INSERT INTO pregunta(idPregunta, enunciado, idCategoria)
	VALUES (605, 'En qué año se estrenó Harry Potter?', 5);		
	
INSERT INTO respuesta(texto, correcta, idPregunta)
	VALUES (6, true, 600);	
INSERT INTO respuesta(texto, correcta, idPregunta)
	VALUES (9, false, 600);	
INSERT INTO respuesta(texto, correcta, idPregunta)
	VALUES ('ninguno', false, 600);
	

	


	
	