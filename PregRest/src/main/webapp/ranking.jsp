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
	<body>
		<h1>Ranking de Jugadores </h1>
		<% List<Jugador> listaJugadores = (List<Jugador>)request.getAttribute("listaJugadores"); %>
		<% if(listaJugadores != null) { %>
		<ul>
			<% for(Jugador j : listaJugadores) { %>
				<li><%=j.getNombre()%>: <%=j.getPuntuacionTotal()%></li>
			<% } %>
		</ul>
		<% } %>
	</body>
</html>