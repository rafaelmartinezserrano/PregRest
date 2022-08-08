package com.afd.trivial.modelo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
<<<<<<< HEAD
=======
import org.hibernate.cfg.Configuration;

>>>>>>> branch 'master' of https://github.com/sonsonaguer/PregRest.git

public class FachadaImpl extends Fachada {
	
	private SessionFactory factoria;

	
	public FachadaImpl() {
		Configuration configuracion = new Configuration();
		configuracion.configure();
		this.factoria = configuracion.buildSessionFactory();
	}

	private SessionFactory factoria;
	
	@Override
	public Jugador iniciarSesion(String alias) {
		Session sesion = this.factoria.openSession();
		Transaction transaccion = sesion.beginTransaction();
		Jugador jugador= null;
		try {
			TypedQuery<Jugador>consulta=sesion.createQuery("from Jugador where alias=:jugador", Jugador.class);
			consulta.setParameter("jugador",alias);
			jugador=consulta.getSingleResult();
 			transaccion.commit();
 			
		}catch (HibernateException ex) {
			ex.printStackTrace();
			transaccion.rollback();
			sesion.close();
			return null;
		}finally {
			sesion.close();
		}
		return jugador;
		
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
				Session sesion = this.factoria.openSession();
				Transaction transaccion = sesion.beginTransaction();
				try {
					List<Pregunta> preguntas = new ArrayList<Pregunta>();
					for (int i = 0; i < categorias.length; i++) {
						TypedQuery<Pregunta> consulta = sesion.createQuery("from Pregunta where idCategoria = :categoria", Pregunta.class);
						List<Pregunta> lista = consulta.getResultList();
						Collections.shuffle(lista);
						preguntas.addAll(lista.subList(0, numPreguntasPorCategoria));
					}
					Partida partida = new Partida(0, nombre, preguntas, null, maxJugadores, false);
					sesion.save(partida);
					transaccion.commit();
					return partida;
				} catch (HibernateException ex) {
					ex.printStackTrace();
					transaccion.rollback();
					return null;
				} finally {
					sesion.close();
				}
		}
	@Override
	public boolean comprobarAlias(String alias) {
		Session sesion = this.factoria.openSession();
		Transaction transaccion = sesion.beginTransaction();
		try {
			TypedQuery<Jugador> consultaAlias = sesion.createQuery("from jugador where alias like :nombre", Jugador.class);
			Jugador jugador = consultaAlias.getSingleResult();
			transaccion.commit();
		}catch (HibernateException ex) {
			ex.printStackTrace();
			transaccion.rollback();
			sesion.close();
			return false;
		} finally {
			sesion.close();
		}
		return true;
	}

	@Override
	public List<Jugador> obtenerRanking() {
		List<Jugador> resultado = new ArrayList<Jugador>();
		Session sesion = this.factoria.openSession();
		Transaction transaccion = sesion.beginTransaction();
		try {
			TypedQuery<Jugador> consulta = sesion.createQuery("from jugador order by puntuacionTotal", Jugador.class);
			resultado = consulta.getResultList();
			transaccion.commit();
		} catch (HibernateException ex) {
			ex.printStackTrace();
			transaccion.rollback();
		} finally {
			sesion.close();
		}
		
		return resultado;
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
		return resultado;
	}
	
	
}
