package com.afd.trivial.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public abstract class Fachada {

	private static Fachada instance;
	
	//Método para la implementación del patrón Singleton, para obtener la instancia
	//de la fachada
	public static Fachada getInstance() {
		if (instance == null) {
			instance = new FachadaImpl();
		}
		return instance;
	}
	
	//Método que devolverá un jugador si existe el alias o null si no existe
	public abstract Jugador iniciarSesion(String alias);
	
	//Método que registrará un jugador en la aplicación. Devolverá el jugador si
	//se ha podido registrar o null en caso contrario
	public abstract Jugador registrarJugador(String alias);
	
	//Método que buscará las partidas disponibles
	public abstract List<Partida> buscarPartidas();
	
	//Método que creará una partida a partir de los datos recibidos
	public abstract Partida crearPartida(String nombre, int maxJugadores, int numPreguntasPorCategoria, int[]categorias);

	//Método que devolverá verdadero o falso si un alias está disponible para registrarse
	public abstract boolean comprobarAlias(String alias);

	//Método que devuelve la lista de jugadores
	public abstract List<Jugador> obtenerRanking();
}
