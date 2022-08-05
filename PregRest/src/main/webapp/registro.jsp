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
		     <input id="nombreAlias" type="text" onchange="comprobarAlias();" name="alias" placeholder="Alias">
		     <span id="nombreDisponible"></span>
			 <input type="submit" value="Registrar" />
		</form>
	
	</body>
</html>