<%@page import="com.afd.trivial.modelo.Jugador"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="utf-8">
			<title>Trivial PregResp</title>
			<style type="text/css">
				*{
				-ms-box-sizing: border-box;
				-moz-box-sizing: border-box;
				-webkit-box-sizing: border-box;
				box-sizing: border-box;
				margin: 0;
				padding: 0;
				border: 0;
				}
				body{
				display: flex;
				justify-content: center;
				width: 100%;
				height: 100%;
				background: url(https://media.istockphoto.com/vectors/background-of-questions-mark-help-symbol-white-color-on-yellow-vector-id468123738?b=1&k=20&m=468123738&s=612x612&w=0&h=prtEqPmaHqoA8zHU2c_0cJfDov3NYfkwZ2hMpTsDSb8=) repeat fixed;
				font-family: 'Open Sans', sans-serif;
				font-weight: 200;
				}
				.legend{
					display: flex;
				 	justify-content: center;
				 	flex-direction: column;
					width: 75%;
					height:100%;
					display: block;
					background: rgba(248, 233, 35, 0.7);
					padding: 15px;
					color: black;
					font-size: 20px;
					text-align: center;
					  
					}
				.input{
  					display: flex;
          			align-items: center;
          			flex-direction: column;
  					text-align: center;
  					position: relative;
  					width: 90%;
  					margin: 15px auto;
  				}
  				 input{
				    width: 50%;
				    padding: 10px 5px 10px 40px;
				    display: block;
				    border: 1px solid #EDEDED;
				    border-radius: 4px;
				    transition: 0.2s ease-out;
				    color: rgb(232,59,104);
				    text-align:center;
				    align-items: center;
				    &:focus{
				      padding: 10px 5px 10px 10px;
				      outline: 0;
				      border-color: #FF7052;
				    }
			</style>
		</head>
		<body>
			<section class="legend">
				<img alt="pregResp logo" src="imagenes/logopr.png">
				<h2>Hola!!!</h2>
				<form action="IniciarSesion"method="get" class="input">
					<label for="ingresarNombre">Por favor ingresa tu nombre para poder empezar a jugar:</label>
						<input type="text" id="ingresarNombre" name="nombreJugador"/>
						<input type="submit" value="Inicio Sesión" class="submit">
						<div class="dot"></div>
				</form>	
				<% String mensaje = (String)request.getAttribute("mensaje");%>
					<%if (mensaje!=null){%>	
						<div><%=mensaje %></div>				
					<%}%>
				<div>
					<img alt="monigote" src="imagenes/how-where.gif">
				</div>
				<div>Si aún no estás registrado, registrada o registrade puedes hacerlo <a href="registro.jsp">aquí</a></div>
			</section>
		
			
		</body>
	</html>