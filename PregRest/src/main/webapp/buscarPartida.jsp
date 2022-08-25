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
	<body class="fondoEspecial">
		<header>
			<img src="imagenes/logopr.png" alt="logo preguntas y respuestas">
		</header>
		<section class="legend">
			<h2>BUSCAR PARTIDA</h2>
			<form action="JugarPartida" method="get">
				<h2>Seleccionar partida</h2>
				<% HashMap<Integer, Partida> listaPartidas = (HashMap<Integer, Partida>)request.getSession().getServletContext().getAttribute("partidas");%>
				<%if (listaPartidas != null && !listaPartidas.isEmpty()) {  %>
					<% int cont = 0; %>
					<% for (Partida partida : listaPartidas.values()) { %>
						<% cont = cont + (partida.isFinalizada() ? 0 : 1);%>
					<% } %>
					<% if (cont > 0) { %>
						<select name="partida" id="idpartida">
							<option></option>
							<% for (Partida partida : listaPartidas.values()) { %>
								<% if (!partida.isFinalizada()) { %>
									<option value = "<%=partida.getIdPartida()%>"><%= partida.getNombreSala()%></option>
								<% } %>
							<% } %>
						</select>
						<br/>
						<input type="submit" value="JUGAR"/>
					<% } else { %>
						<div>
							<h3>No se han encontrado partidas</h3>
						</div>
					<% } %>
				<% } else { %>
					<div>
						<h3>No se han encontrado partidas</h3>
					</div>
				<% } %>	
			</form>
		</section>
	</body>
</html>