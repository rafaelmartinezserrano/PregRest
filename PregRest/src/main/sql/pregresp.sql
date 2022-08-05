INSERT INTO pregunta(idPregunta,enunciado,idCategoria) VALUES(401,'¿Cuál de estas comunidades autónomas tiene solo una provincia?', 2 );
INSERT INTO respuesta(texto,correcta,idPregunta) VALUES('Islas Baleares', true, 401);
INSERT INTO respuesta(texto,correcta,idPregunta) VALUES('Aragón', false, 401);
INSERT INTO respuesta(texto,correcta,idPregunta) VALUES('Valencia', false, 401);


INSERT INTO pregunta(idPregunta,enunciado,idCategoria) VALUES(402,'¿Cuál de los siguientes ríos desemboca en el océano Atlántico?', 2 );
INSERT INTO respuesta(texto,correcta,idPregunta) VALUES('El Ebro', false, 402);
INSERT INTO respuesta(texto,correcta,idPregunta) VALUES('El Tajo', true, 402);
INSERT INTO respuesta(texto,correcta,idPregunta) VALUES('El Júcar', false, 402);

INSERT INTO pregunta(idPregunta,enunciado,idCategoria) VALUES(403,'El principal río que desemboca en el mar Mediterráneo es el…', 2 );
INSERT INTO respuesta(texto,correcta,idPregunta) VALUES('Tajo', false, 403);
INSERT INTO respuesta(texto,correcta,idPregunta) VALUES('Duero', false, 403);
INSERT INTO respuesta(texto,correcta,idPregunta) VALUES('Ebro', true, 403);

INSERT INTO pregunta(idPregunta,enunciado,idCategoria) VALUES(404,'¿Qué sistema montañoso divide a la Meseta española?', 2 );
INSERT INTO respuesta(texto,correcta,idPregunta) VALUES('El Bético', false, 404);
INSERT INTO respuesta(texto,correcta,idPregunta) VALUES('El Ibérico', false, 404);
INSERT INTO respuesta(texto,correcta,idPregunta) VALUES('El Central', true, 404);


INSERT INTO pregunta(idPregunta,enunciado,idCategoria) VALUES(405,'Los Picos de Europa están en…', 2 );
INSERT INTO respuesta(texto,correcta,idPregunta) VALUES('Andalucía', false, 404);
INSERT INTO respuesta(texto,correcta,idPregunta) VALUES('Asturias', true, 404);
INSERT INTO respuesta(texto,correcta,idPregunta) VALUES('Cataluña', false, 404);

SELECT * FROM PREGUNTA;