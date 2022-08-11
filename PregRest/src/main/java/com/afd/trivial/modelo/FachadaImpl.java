package com.afd.trivial.modelo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class FachadaImpl extends Fachada {
	
	private SessionFactory factoria;

	public FachadaImpl() {
		Configuration configuracion = new Configuration();
		configuracion.configure();
		this.factoria = configuracion.buildSessionFactory();
	}
	
	@Override
	public Jugador iniciarSesion(String alias) {
		Session sesion = this.factoria.openSession();
		Transaction transaccion = sesion.beginTransaction();
		Jugador jugador = null;
		try {
			TypedQuery<Jugador>consulta=sesion.createQuery("from Jugador where alias=:jugador", Jugador.class);
			consulta.setParameter("jugador",alias);
			jugador=consulta.getSingleResult();
 			transaccion.commit();
		}catch (HibernateException ex) {
			ex.printStackTrace();
			transaccion.rollback();
		} catch (NoResultException ex) {
			ex.printStackTrace();
			transaccion.rollback();
		}finally {
			sesion.close();
		}
		System.out.println("FACHADA: " + jugador);
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
	public Jugador corregirPartida(ArrayList<Integer> listaRespuestas, Partida partida, Jugador jugador ) {
		Session sesion = this.factoria.openSession();
		Transaction transaccion = sesion.beginTransaction();
		 try {
			  for (int i = 0; i < listaRespuestas.size(); i++) {
				Query consulta =sesion.createQuery("Select correcta from Respuesta where idRespuesta = :id");
				consulta.setParameter("id", listaRespuestas.get(i));
				boolean correcta =(Boolean)consulta.uniqueResult();
				//opcion con operadores ternarios
				jugador.setPuntuacion(jugador.getPuntuacion()+(correcta?1:0));
		         }
			  jugador.setPuntuacionTotal(jugador.getPuntuacionTotal() + jugador.getPuntuacion());
			  sesion.update(jugador);
			  transaccion.commit();
		      return jugador;
		 }catch (HibernateException ex) {
				ex.printStackTrace();
				transaccion.rollback();
				return null;
			} 
	}

	@Override
	public Partida crearPartida(String nombre, int maxJugadores, int numPreguntasPorCategoria, int[] categorias) {
				Session sesion = this.factoria.openSession();
				Transaction transaccion = sesion.beginTransaction();
				try {
					List<Pregunta> preguntas = new ArrayList<Pregunta>();
					for (int i = 0; i < categorias.length; i++) {
						TypedQuery<Pregunta> consulta = sesion.createQuery("from Pregunta where idCategoria = :categoria", Pregunta.class);
						consulta.setParameter("categoria", categorias[i]);
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
				} 
		}
	@Override
	public boolean comprobarAlias(String alias) {
		boolean resultado = false;
		Session sesion = this.factoria.openSession();
		Transaction transaccion = sesion.beginTransaction();
		try {
			TypedQuery<Jugador> consultaAlias = sesion.createQuery("from Jugador where alias like :nombre", Jugador.class);
			consultaAlias.setParameter("nombre", alias);
			resultado = !consultaAlias.getResultList().isEmpty();
			transaccion.commit();
		}catch (HibernateException ex) {
			ex.printStackTrace();
			transaccion.rollback();
		} finally {
			sesion.close();
		}
		//System.out.println("RESULTADO: " + resultado);
		return resultado;
	}

	@Override
	public List<Jugador> obtenerRanking() {
		List<Jugador> resultado = new ArrayList<Jugador>();
		Session sesion = this.factoria.openSession();
		Transaction transaccion = sesion.beginTransaction();
		try {
			TypedQuery<Jugador> consulta = sesion.createQuery("from Jugador order by puntuacionTotal DESC", Jugador.class);
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

	@Override
	@Transactional
	public Partida buscarPartidaPorId(int idPartida) {
		Session sesion = this.factoria.openSession();
		Transaction transaccion = sesion.beginTransaction();
		Partida partida = null;
		try {
			TypedQuery<Partida> consulta = sesion.createQuery("from Partida where idPartida = :idPartida", Partida.class);
			consulta.setParameter("idPartida", idPartida);
			partida = consulta.getSingleResult();
			transaccion.commit();
		}catch (HibernateException ex) {
			ex.printStackTrace();
			transaccion.rollback();
		
		} 
		return partida;
	}
	
}
