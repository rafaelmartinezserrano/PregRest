<%@page import="java.util.HashMap"%>
<%@page import="com.afd.trivial.modelo.Respuesta"%>
<%@page import="com.afd.trivial.modelo.Pregunta"%>
<%@page import="java.util.List"%>
<%@page import="com.afd.trivial.modelo.Partida"%>
<%@page import="com.afd.trivial.modelo.Jugador"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>Partida Acabada</title>
	<link rel="stylesheet" type="text/css" href="estiloJuego.css">
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
		<section>
			<% HashMap<Integer, Partida> listaPartidas = (HashMap<Integer, Partida>)application.getAttribute("partidas");%>
			<% int idPartida = Integer.parseInt(request.getParameter("idPartida")); %>
			<% Partida partida = listaPartidas.get(idPartida);%>
			<% listaPartidas.remove(idPartida); %>
			<% List<Integer> listaRespuestas = (List<Integer>)session.getAttribute("listaRespuestas"); %>
			<% for (Pregunta p : partida.getListaPreguntas()) { %>
				<div><%=p.getEnunciado() %></div>
				<% for (Respuesta r : p.getListaRespuesta()) { %>
					<% if (r.isCorrecta()) { %>
						<% if (listaRespuestas.contains(r.getIdRespuesta())) { %>
							<div class="correcta">
								<input type="radio" checked disabled/><%=r.getTexto()%>&#10004;
							</div>
						<% } else { %>
							<div class="correcta">
								<input type="radio" disabled/><%=r.getTexto()%>&#10004;
							</div>
						<% } %>
					<% } else { %>
						<% if (listaRespuestas.contains(r.getIdRespuesta())) { %>
							<div class="incorrecta">
								<input type="radio" checked disabled/><%=r.getTexto()%>&#10006;
							</div>
						<% } else { %>
							<div class="incorrecta">
								<input type="radio" disabled/><%=r.getTexto()%>&#10006;
							</div>
						<% } %>
					<% } %>
				<% } %>
			<% } %>
		</section>
		<footer>
			<a href="menu.jsp">Volver al menú principal</a>
		</footer>
	</body>
</html>