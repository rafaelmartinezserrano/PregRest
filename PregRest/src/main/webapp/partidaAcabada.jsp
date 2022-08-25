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
	<body class="fondoEspecial">
		<header>
			<img src="imagenes/logopr.png" alt="logo preguntas y respuestas">
		</header>
		<section class="legend">
			<h2>
				<%Jugador jugador = (Jugador)session.getAttribute("jugador"); %>
				<%=jugador.getNombre()%> has acabado la partida
			</h2>
			<div>
				Tu puntuación total hasta ahora es: 
				<%=jugador.getPuntuacionTotal() %>
			</div>
		</section>
		<% HashMap<Integer, Partida> listaPartidas = (HashMap<Integer, Partida>)application.getAttribute("partidas");%>
		<% int idPartida = Integer.parseInt(request.getParameter("idPartida")); %>
		<% Partida partida = listaPartidas.get(idPartida);%>
		<section class="legend">
			<h2>Puntuación de la partida:</h2>
			<ol>
			<% for (Jugador j : partida.getListaJugadores()) { %>
				<li><%=j.getNombre()%>: <%=j.getPuntuacion()%></li>
			<% } %>
			</ol>
		</section>
		<section class="legend">
			<h2>
				Estas son las preguntas que has contestado:
			</h2>
			<% List<Integer> listaRespuestas = (List<Integer>)session.getAttribute("listaRespuestas"); %>
			<div class="pregresp">
			<% for (Pregunta p : partida.getListaPreguntas()) { %>
				<div class="pregunta"><%=p.getEnunciado() %></div>
				<div class="respuestas">
				<% for (Respuesta r : p.getListaRespuesta()) { %>
					<% if (r.isCorrecta()) { %>
						<% if (listaRespuestas.contains(r.getIdRespuesta())) { %>
							<div class="correcta">
								<input type="radio" checked disabled/> <%=r.getTexto()%> &#10004;
							</div>
						<% } else { %>
							<div class="correcta">
								<input type="radio" disabled/> <%=r.getTexto()%> &#10004;
							</span>
						<% } %>
					<% } else { %>
						<% if (listaRespuestas.contains(r.getIdRespuesta())) { %>
							<div class="incorrecta">
								<input type="radio" checked disabled/> <%=r.getTexto()%> &#10006;
							</span>
						<% } else { %>
							<div class="incorrecta">
								<input type="radio" disabled/> <%=r.getTexto()%> &#10006;
							</div>
						<% } %>
					<% } %>
				<% } %>
				</div>
			<% } %>
			<footer>
				<a href="menu.jsp">Volver al menú principal</a>
			</footer>
		</section>
	</body>
</html>