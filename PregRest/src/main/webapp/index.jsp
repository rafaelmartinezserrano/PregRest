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
				html, body{
				width: 100%;
				height: 100%;
				background: url(https://subtlepatterns.com/patterns/sativa.png) repeat fixed;
				font-family: 'Open Sans', sans-serif;
				font-weight: 200;
				}
				.login{
				 position: absolute;
				 top: 10%;
				 width: 250px;
				 display: table;
				 margin: 0 auto 0 auto;
				 background: #fff;
				 border-radius: 4px;
				}
				.legend{
					  position: relative;
					  width: 100%;
					  display: block;
					  background: #FF7052;
					  padding: 15px;
					  color: #fff;
					  font-size: 20px;
					  
					  &:after{
					    background-image: url(http://simpleicon.com/wp-content/uploads/multy-user.png);
					    background-size: 100px 100px;
					    background-repeat: no-repeat;
					    background-position: 152px -16px;
					    opacity: 0.06;
					    top: 0;
					    left: 0;
					    bottom: 0;
					    right: 0;
					    position: absolute;
					 }
				}
				.input{
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
				    color: darken(#EDEDED, 30%);
				    
				    &:focus{
				      padding: 10px 5px 10px 10px;
				      outline: 0;
				      border-color: #FF7052;
				    }
				  }
				}

				.submit{
					  width: 45px;
					  height: 45px;
					  display: block;
					  margin: 0 auto -15px auto;
					  background: #fff;
					  border-radius: 100%;
					  border: 1px solid #FF7052;
					  color: #FF7052;
					  font-size: 24px;
					  cursor: pointer;
					  box-shadow: 0px 0px 0px 7px #fff;
					  transition: 0.2s ease-out;
					  text-align:center;
					  &:focus{
					    background: #FF7052;
					    color: #fff;
					    outline: 0;
					  }
				}
  					
			</style>
		</head>
		<body>
			<header class="login">
				<img alt="pregResp logo" src="imagenes/logopr.png">
			</header>
			<section class="legend">
				<h2>Hola!!!</h2>
				<form action="IniciarSesion"method="get" class="input">
				<label for="ingresarNombre">Por favor ingresa tu nombre para poder empezar a jugar:</label>
					<input type="text" id="ingresarNombre" name="nombreJugador"/>
					<input type="submit" value="Inicio Sesión" class="submit">
				</form>	
				<% String mensaje = (String)session.getAttribute("mensaje");%>
					<%if (mensaje!=null){%>	
						<div><%=mensaje %></div>				
					<%}%>
				<div>Si aún no estás registrado, registrada o registrade puedes hacerlo <a href="registro.jsp">aquí</a></div>		
			</section>
			
		</body>
	</html>