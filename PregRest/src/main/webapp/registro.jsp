<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Registro</title>
		<script src="registro.js"></script>
		<link rel="stylesheet" type="text/css" href="estiloJuego.css">
	</head>
	<body class="fondoEspecial">
		<header>
			<img src="imagenes/logopr.png" alt="logo preguntas y respuestas">
		</header>
		<section class="legend">
			<form class="input" action="Registrar" method="get">
				 <label for="nombreAlias">Alias:</label>
			     <input id="nombreAlias" type="text" oninput="comprobarAlias();" name="alias" placeholder="Alias">
			     <span id="nombreDisponible"></span>
				 <input type="submit" id="anularBoton" value="Registrar" />
			</form>
			<% String mensaje = (String)request.getAttribute("mensaje");%>
			<%if (mensaje!=null){%>	
				<div><%=mensaje %></div>				
			<%}%>
			<div>Ya tienes cuenta? puedes iniciar sesion: <a href="index.jsp">aquí</a></div>
		</section>
	</body>
</html>