<%@page import="com.afd.trivial.modelo.Jugador"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>Partida Acabada</title>
	</head>
	<body>
		<header>
			<h1>
			<%Jugador jugador = (Jugador)session.getAttribute("jugador"); %>
			<%=jugador.getNombre()%> has acabado la partida
			</h1>
		</header>
		<section>
			<div>
			Tu puntuación en esta partida ha sido: 
			<%=jugador.getPuntuacion() %>
			</div>
			<div>
			Tu puntuación total hasta ahora es: 
			<%=jugador.getPuntuacionTotal() %>
			</div>
		</section>
		<footer>
			<a href="Menu.jsp">Volver al menú principal</a>
		</footer>
	</body>
</html>