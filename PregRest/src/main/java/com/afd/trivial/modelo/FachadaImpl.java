package com.afd.trivial.modelo;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class FachadaImpl extends Fachada {
	
	private SessionFactory factoria;

	@Override
	public Jugador iniciarSesion(String alias) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Jugador registrarJugador(String alias) {
		Session sesion = this.factoria.openSession();
		Jugador jugador = new Jugador(0, alias, 0, 0);
		Transaction transaccion = sesion.beginTransaction();
		try {
			int id = (Integer)sesion.save(jugador);
			transaccion.commit();
			jugador.setIdJugador(id);
		}catch(HibernateException ex){
			ex.printStackTrace();
			transaccion.rollback();
			jugador = null;
		}finally {
			sesion.close();	
		}
		return jugador;
	}

	@Override
	public List<Partida> buscarPartidas() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Partida crearPartida(String nombre, int maxJugadores, int numPreguntasPorCategoria, int[] categorias) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean comprobarAlias(String alias) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Jugador> obtenerRanking() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
