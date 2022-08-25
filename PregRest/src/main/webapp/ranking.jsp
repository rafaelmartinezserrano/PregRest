<%@page import="java.util.List"%>
<%@page import="com.afd.trivial.modelo.Jugador"%>
<%@page import="java.util.Collections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ranking</title>
		<link rel="stylesheet" type="text/css" href="estiloJuego.css">
	</head>
	<body class="fondoEspecial">
		<header>
			<img src="imagenes/logopr.png" alt="logo preguntas y respuestas">
		</header>
		<section class="legend">
			<header>
				<h2>Ranking de Jugadores</h2>
			</header>
			<section id="contenido">
				<div class="imagenTrofeo">
					<img src="imagenes/trofeo.webp" alt="trofeo"/>
				</div>
				<div id="ranking">
					<% List<Jugador> listaJugadores = (List<Jugador>)request.getAttribute("listaJugadores"); %>
					<% if(listaJugadores != null) { %>
					<table>
						<tr>
							<th>Jugador</th>
							<th>Puntuación total</th>
						</tr>
						<% for(Jugador j : listaJugadores) { %>
							<tr>
								<td><%=j.getNombre()%></td>
								<td><%=j.getPuntuacionTotal()%></td>
						<% } %>
					</table>
					<% } %>
				</div>
				<div class="imagenTrofeo">
					<img src="imagenes/trofeo.webp" alt="trofeo"/>
				</div>
			</section>
		</section>
	</body>
</html>