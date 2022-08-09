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
<form action="NuevaPartida" method="">
<label for="nombrePartida">Nombre de la partida</label>
<input type="text" id="nombrePartida" name="nombrePartida" required
       minlength="4" maxlength="15" size="15">
<label for="numJugadores">Introduce el número de jugadores</label>
<input type="number" id="numJugadores" name="numJugadores" min="1" max="8">
<label for="PreguntasPorCategoria">¿Cuántas preguntas por categoria?</label>
<input type="number" id="PreguntasPorCategoria" name="pregPorCategoria" min="1" max="5">
<label for="ciencia">Ciencia y tecnología</label>
<input type="checkbox" name="categoria" id="ciencia" value="1">
<label for="geografíaEhistoria">Geografía e historia</label>
<input type="checkbox" name="categoria" id="geografíaEhistoria" value="2">
<label for="deportes">Deportes</label>
<input type="checkbox" name="categoria" id="deportes" value="3">
<label for="musica">Música</label>
<input type="checkbox" name="categoria" id="musica" value="4">
<label for="cine">Cine</label>
<input type="checkbox" name="categoria" id="cine" value="5">
<input type="submit" value="Crear Partida">


</form>


</body>
</html>