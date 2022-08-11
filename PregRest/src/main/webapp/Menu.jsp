<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Opciones de juego</title>
		<style type="text/css">
			body {
			background-image: radial-gradient(circle at 
			87.5% 12.5%, #9addfe 0, #69c7f6 25%, #0cafed 50%, #0098e5 75%, #0081dd 100%);
			}
			#quiz {
			 display: block;
			 margin-left: auto;
			 margin-right: auto;
			 height: 100px;
			 width:170px;
			 padding-top: 40px;
			 z-index: -1;
			}
			h2 {
			padding-top: 50px;
			text-align:center;
			color:#3B3C9B;
 			 text-shadow: 2px 2px;
			}
			div{
			font-size: 14px;
			text-align:center;
			}
			P{
			text-align:center;
			color: white;
  			text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;
			}
		</style>
	</head>
		<body>
			<header>
				<h2>¿QUÉ QUIERES HACER A CONTINUACIÓN?</h2>
				<img id="quiz" src="https://play-lh.googleusercontent.com/bmGXUIx8ZiRgPSJI5eMOaUEafXVXiFiUJVx1siq1vVm1u-bbn4brIaYRehelsfy594c=w240-h480-rw"> 
				<p>OPCIONES DE JUEGO:</p>
			</header>
			
			<section>
				<div>
				<a href="RecuperarListaCategorias">Nueva partida</a>
				</div>
				<div>
				<a href="BuscarPartidas">Buscar partida</a>
				</div>
				<div>
				<a href="RankingJugadores">Ver puntuación</a>
				</div>
			</section>
	</body>
</html>