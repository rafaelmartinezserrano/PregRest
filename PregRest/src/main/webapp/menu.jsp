<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Opciones de juego</title>
		<link rel="stylesheet" type="text/css" href="estiloJuego.css">
	</head>
	<body class="fondoEspecial">
		<header>
			<img src="imagenes/logopr.png" alt="logo preguntas y respuestas">
		</header>
		<section class="legend">
			<header>
				<h2>¿QUÉ QUIERES HACER A CONTINUACIÓN?</h2>
				<img id="quiz" alt="logo quiz" src="imagenes/quiz.webp"> 
			</header>
			<section id="menu">
				<div>
					<a href="RecuperarListaCategorias">Nueva partida</a>
				</div>
				<div>
					<a href="buscarPartida.jsp">Buscar partida</a>
				</div>
				<div>
					<a href="RankingJugadores">Ver puntuación</a>
				</div>
			</section>
			<div>
			<% String mensaje = (String)request.getAttribute("mensaje");%>
			<%if (mensaje!=null){%>
				<div><%=mensaje %></div>				
			<%}%>
			</div>
		</section>
	</body>
</html>