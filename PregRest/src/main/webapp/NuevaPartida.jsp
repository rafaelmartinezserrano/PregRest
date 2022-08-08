<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
form { display:flex;
       justify-content:center;
       flex-direction: column;
       align-items: flex-start;}

</style>
<title>Nueva partida</title>
</head>
<body>
<header>
<img src="imagenes/logopr.png" alt="logo preguntas y respuestas">
</header>
<form action="" method="">
<label for="nombrePartida">Nombre de la partida</label>
<input type="text" id="nombrePartida"  required
       minlength="4" maxlength="15" size="15">
<label for="numJugadores">Introduce el número de jugadores</label>
<input type="number" id="numJugadores" name="" min="1" max="8">
<label for="PreguntasPorCategoria">¿Cuántas preguntas por categoria?</label>
<input type="number" id="PreguntasPorCategoria" name="" min="1" max="5">
<label for="ciencia">Ciencia y tecnología</label>
<input type="checkbox" id="ciencia" value="ciencia">
<label for="geografíaEhistoria">Geografía e historia</label>
<input type="checkbox" id="geografíaEhistoria" value="geografia">
<label for="deportes">Deportes</label>
<input type="checkbox" id="deportes" value="deportes">
<label for="musica">Música</label>
<input type="checkbox" id="musica" value="musica">
<label for="cine">Cine</label>
<input type="checkbox" id="cine" value="cine">
<input type="submit" value="Crear Partida">


</form>


</body>
</html>