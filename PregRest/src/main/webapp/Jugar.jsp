<%@page import="com.afd.trivial.modelo.Partida"%>
<%@page import="com.afd.trivial.modelo.Respuesta"%>
<%@page import="com.afd.trivial.modelo.Pregunta"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	
<head>
	<meta charset="utf-8">
	<title>Jugar</title>
	<style>
		.pregresp {
		border: 1px solid #7DA5E0;
		padding: 10px;
		margin: 10px;
		font-family: Rockwell;
		font-size: 15px;
		font-weight: bold;
		}
		
		.pregunta {
		color: #7DA5E0;
		}
		
		.respuestas {
		color: #000000;
		}
	</style>
</head>
	<body>
		<% Partida partida = (Partida)application.getAttribute("partida"); %>
		<form action="RecogerRespuestas">
			<div class="pregresp">
			<% for (Pregunta p : partida.getListaPreguntas()) { %>
				<div class="pregunta"><%=p.getEnunciado() %></div>
				<div class="respuestas"> 
				<% for (Respuesta r: p.getListaRespuesta()) { %> 
					<input required type="radio" name="resp<%=p.getIdPregunta()%>" value="<%= r.getIdRespuesta()%>"/> <%= r.getTexto() %>
					<br/>
				<% } %>
			 	</div>
			 <%} %>
			<input type="submit" value="Enviar respuesta"> 
			</div>
		</form>
	

	</body>
</html>