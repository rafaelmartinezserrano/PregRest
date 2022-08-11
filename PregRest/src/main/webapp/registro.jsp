<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Registro</title>
		<script src="registro.js"></script>
		<link rel="stylesheet" type="text/css" href="registro.css"/>
	</head>
	<body>
		<form action="Registrar" method="get">
			 <label for="nombreAlias">Alias</label><br/>
		     <input id="nombreAlias" type="text" oninput="comprobarAlias();" name="alias" placeholder="Alias">
		     <span id="nombreDisponible"></span>
			 <input type="submit" id="anularBoton" value="Registrar" />
		</form>
		<% String mensaje = (String)request.getAttribute("mensaje");%>
		<%if (mensaje!=null){%>	
			<div><%=mensaje %></div>				
		<%}%>
		
		
		<div>ya tienes cuenta? puedes iniciar sesion: <a href="index.jsp">aquí</a></div>
	</body>
</html>