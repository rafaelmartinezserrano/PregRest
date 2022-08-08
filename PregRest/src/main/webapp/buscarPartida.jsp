
<%@page import="com.afd.trivial.modelo.Partida"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="UTF-8">
		<title>Buscar partida</title>
	</head>
	<body>
		<h1>BUSCAR PARTIDA</h1>
		<form action="jugarPartida" method="get">
			<h2>Seleccionar partida</h2>
			<select name="partida" id="idpartida">
				<option></option>
				<% List<Partida> listaPartidas = (List<Partida>)request.getAttribute("verPartidas"); %>
					<%if (listaPartidas != null) {  %>
							<% for (int i=0; i< listaPartidas.size(); i++) { %>
								<%Partida partida = listaPartidas.get(i); %>
								<option value = "<%=partida.getIdPartida()%>"><%= partida.getNombreSala()%></option>
						<% } %>
					<% } else { %>
						<div>
							<h3>No se han encontrado partidas</h3>
						</div>
					<% } %>	
			</select>
			<br/>
			<input type="submit" value="JUGAR"/>
		</form>
	</body>
</html>