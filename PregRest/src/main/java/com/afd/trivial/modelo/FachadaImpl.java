package com.afd.trivial.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class FachadaImpl extends Fachada {
	
	private SessionFactory factoria;
	
	public FachadaImpl() {
		Configuration configuracion = new Configuration();
		configuracion.configure();
		this.factoria = configuracion.buildSessionFactory();
	}

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

	@Override
	public List<Categoria> obtenerCategoria() {
		List<Categoria> resultado = new ArrayList<Categoria>();
		Session session = this.factoria.openSession();
		Transaction transaccion = session.beginTransaction();
		try {
			TypedQuery<Categoria> consulta = session.createQuery("from Categoria", Categoria.class);
			resultado = consulta.getResultList();
			transaccion.commit();
		}catch(HibernateException ex){
			ex.printStackTrace();
			transaccion.rollback();
		}finally {
			session.close();
		}
		return null;
	}
	
	
}
