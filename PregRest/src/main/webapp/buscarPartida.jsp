
<%@page import="java.util.HashMap"%>
<%@page import="com.afd.trivial.modelo.Partida"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="estiloJuego.css">
		<title>Buscar partida</title>
	</head>
	<body>
		<h1>BUSCAR PARTIDA</h1>
		<form action="JugarPartida" method="get">
			<h2>Seleccionar partida</h2>
			<% HashMap<Integer, Partida> listaPartidas = (HashMap<Integer, Partida>)request.getSession().getServletContext().getAttribute("partidas");%>
			<%if (listaPartidas != null && !listaPartidas.isEmpty()) {  %>
				<select name="partida" id="idpartida">
					<option></option>
					<% for (Partida partida : listaPartidas.values()) { %>
						<option value = "<%=partida.getIdPartida()%>"><%= partida.getNombreSala()%></option>
					<% } %>
				</select>
				<br/>
				<input type="submit" value="JUGAR"/>
			<% } else { %>
				<div>
					<h3>No se han encontrado partidas</h3>
				</div>
			<% } %>	
			
		</form>
	</body>
</html>