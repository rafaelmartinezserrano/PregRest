<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<script type="text/javascript" src="esperar.js"></script>
		<link rel="stylesheet" type="text/css" href="estiloJuego.css">
		<title>Esperando por jugadores</title>
	</head>
	<body onload="partidaLista(<%=session.getAttribute("idPartida")%>);" class="fondoEspecial">
		<header>
			<img src="imagenes/logopr.png" alt="logo preguntas y respuestas">
		</header>
		<section class="legend">
			<div id="esperando">
				<pre>Esperando
por
jugadores...</pre></div>
			<div class="esperando"></div>
		</section>
	</body>
</html>