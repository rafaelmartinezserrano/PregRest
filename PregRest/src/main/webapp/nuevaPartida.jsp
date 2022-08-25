<%@page import="com.afd.trivial.modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="estiloJuego.css">
		<title>Nueva partida</title>
	</head>
	<body class="fondoEspecial">
		<header>
			<img src="imagenes/logopr.png" alt="logo preguntas y respuestas">
		</header>
		<section class="legend">
			<form class="input" action="NuevaPartida" method="get">
				<%List<Categoria> listaCategoria =(List<Categoria>)request.getAttribute("listaCategorias"); %>
			
				<label for="nombrePartida">Nombre de la partida:</label>
				<input type="text" id="nombrePartida" name="nombrePartida" required
				       minlength="4" maxlength="15">
				       
				<label for="numJugadores">Número de jugadores:</label>
				<input type="number" id="numJugadores" name="numJugadores" min="1" max="8">
				
				<label for="PreguntasPorCategoria">¿Cuántas preguntas por categoria?</label>
				<input type="number" id="PreguntasPorCategoria" name="pregPorCategoria" min="1" max="5">
				
				<section id="categorias">
				<% for(Categoria cat : listaCategoria) { %>
					<div>
						<input type="checkbox" name="categoria" id=<%=cat.getNombre() %> value=<%=cat.getIdCategoria()%>>	
						<label for=<%=cat.getNombre()%>><%=cat.getNombre() %></label>
					</div>
				<% } %>
				</section>
				<input type="submit" value="Crear Partida">
			</form>
		</section>			
	</body>
</html>