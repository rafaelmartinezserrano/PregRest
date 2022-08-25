<%@page import="com.afd.trivial.modelo.Jugador"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Trivial PregResp</title>
		<link rel="stylesheet" type="text/css" href="estiloJuego.css">
	</head>
	<body class="fondoEspecial">
		<header>
			<img src="imagenes/logopr.png" alt="logo preguntas y respuestas">
		</header>
		<section class="legend">
			<h2>Hola!!!</h2>
			<section id="inicio">
				<div>
					<form action="IniciarSesion"method="get" class="input">
						<label for="ingresarNombre">Por favor ingresa tu nombre para poder empezar a jugar:</label>
						<input type="text" id="ingresarNombre" name="nombreJugador" required/>
						<input type="submit" value="Inicio Sesión" class="submit">
					</form>	
					<% String mensaje = (String)request.getAttribute("mensaje");%>
						<%if (mensaje!=null){%>	
							<div><%=mensaje %></div>				
						<%}%>
					<div>Si aún no estás registrado, registrada o registrade puedes hacerlo <a href="registro.jsp">aquí</a></div>
				</div>
				<div>
					<img id="monigote" alt="monigote" src="imagenes/how-where.gif">
				</div>				
			</section>
		</section>
	</body>
</html>