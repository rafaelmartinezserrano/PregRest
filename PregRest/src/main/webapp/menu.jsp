<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Opciones de juego</title>
		<link rel="stylesheet" type="text/css" href="estiloJuego.css">
		
	</head>
		<body>
			<header>
				<h2>¿QUÉ QUIERES HACER A CONTINUACIÓN?</h2>
				<img id="quiz" src="https://play-lh.googleusercontent.com/bmGXUIx8ZiRgPSJI5eMOaUEafXVXiFiUJVx1siq1vVm1u-bbn4brIaYRehelsfy594c=w240-h480-rw"> 
				<p>OPCIONES DE JUEGO:</p>
			</header>
			
			<section>
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
	</body>
</html>