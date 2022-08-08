package com.afd.trivial.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Partida> buscarPartidas() {
			List<Partida> resultado = new ArrayList<Partida>();
			Session sesion= this.factoria.openSession();
			Transaction transaccion = sesion.beginTransaction();
			try {
				TypedQuery<Partida> consulta = sesion.createQuery("from Partida", Partida.class);
				resultado = consulta.getResultList();
				transaccion.commit();
			} catch (HibernateException ex) {
				ex.printStackTrace();
				transaccion.rollback();
				sesion.close(); 
			} finally {
				sesion.close();
			}
			return resultado;
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
