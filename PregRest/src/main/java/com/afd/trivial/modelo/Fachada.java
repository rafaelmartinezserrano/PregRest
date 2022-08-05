package com.afd.trivial.modelo;

import java.util.List;

public interface Fachada {

	//Método que devolverá un jugador si existe el alias o null si no existe
	public Jugador iniciarSesion(String alias);
	
	//Método que registrará un jugador en la aplicación. Devolverá el jugador si
	//se ha podido registrar o null en caso contrario
	public Jugador registrarJugador(String alias);
	
	//Método que buscará las partidas disponibles
	public List<Partida> buscarPartidas();
	
	//Método que creará una partida a partir de los datos recibidos
	public Partida crearPartida(String nombre, int maxJugadores, int numPreguntasPorCategoria, int[]categorias);

	//Método que devolverá verdadero o falso si un alias está disponible para registrarse
	public boolean comprobarAlias(String alias);

}
