package com.afd.trivial.modelo;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Transient;

public class Partida {

	private int idPartida;
	private String nombreSala;
	private List<Pregunta> listaPreguntas;
	private Set<Jugador> listaJugadores;
	private int maxJugadores;
	private boolean finalizada;
	
	public Partida(int idPartida, String nombreSala, List<Pregunta> listaPreguntas, Set<Jugador> listaJugadores,
			int maxJugadores, boolean finalizada) {
		this.idPartida = idPartida;
		this.nombreSala = nombreSala;
		this.listaPreguntas = listaPreguntas;
		this.listaJugadores = listaJugadores;
		this.maxJugadores = maxJugadores;
		this.finalizada = finalizada;
	}
	
	public Partida(int idPartida, String nombreSala, int maxJugadores, boolean finalizada) {
		this.idPartida = idPartida;
		this.nombreSala = nombreSala;
		this.listaPreguntas = new ArrayList<Pregunta>();
		this.listaJugadores = new HashSet<Jugador>(maxJugadores);
		this.maxJugadores = maxJugadores;
		this.finalizada = finalizada;
	}

	public Partida(){}
	
	public Partida(int idPartida, String nombreSala, List<Pregunta> preguntas, int maxJugadores, boolean finalizada) {
		this.idPartida = idPartida;
		this.nombreSala = nombreSala;
		this.listaPreguntas = preguntas;
		this.listaJugadores = new HashSet<Jugador>(maxJugadores);
		this.maxJugadores = maxJugadores;
		this.finalizada = finalizada;
	}

	public int getIdPartida() {
		return idPartida;
	}

	public void setIdPartida(int idPartida) {
		this.idPartida = idPartida;
	}

	public String getNombreSala() {
		return nombreSala; 
	}

	public void setNombreSala(String nombreSala) {
		this.nombreSala = nombreSala;
	}

	public List<Pregunta> getListaPreguntas() {
		return listaPreguntas;
	}

	public void setListaPreguntas(List<Pregunta> listaPreguntas) {
		this.listaPreguntas = listaPreguntas;
	}

	public Set<Jugador> getListaJugadores() {
		return listaJugadores;
	}

	public void setListaJugadores(Set<Jugador> listaJugadores) {
		this.listaJugadores = listaJugadores;
	}

	public int getMaxJugadores() {
		return maxJugadores;
	}

	public void setMaxJugadores(int maxJugadores) {
		this.maxJugadores = maxJugadores;
	}

	public boolean isFinalizada() {
		return finalizada;
	}

	public void setFinalizada(boolean finalizada) {
		this.finalizada = finalizada;
	}
	
	public boolean insertarJugador(Jugador jugador) {
		boolean insertado = true;
		if (this.listaJugadores.size() < this.maxJugadores) {
			this.listaJugadores.add(jugador);
		} else {
			insertado = false;
		}
		return insertado;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Partida [idPartida=").append(idPartida).append(", nombreSala=").append(nombreSala)
				.append(", listaPreguntas=").append(listaPreguntas).append(", listaJugadores=").append(listaJugadores)
				.append(", maxJugadores=").append(maxJugadores).append(", finalizada=").append(finalizada).append("]");
		return builder.toString();
	}
	
	@Override
	public boolean equals(Object obj) {
		boolean resultado = false;
		if (obj != null && obj instanceof Partida) {
			Partida otra = (Partida)obj;
			resultado = this.idPartida == otra.idPartida;
		}
		return resultado;
	}
}
