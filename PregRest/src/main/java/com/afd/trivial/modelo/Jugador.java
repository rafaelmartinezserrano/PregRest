package com.afd.trivial.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="jugador")
public class Jugador {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idJugador;
	@Column(name = "alias")
	private String nombre;
	//no es persistente
	@Transient
	private int puntuacion;
	private int puntuacionTotal;
	
	public Jugador(int idJugador, String nombre, int puntuacion, int puntuacionTotal) {
		this.idJugador = idJugador;
		this.nombre = nombre;
		this.puntuacion = puntuacion;
		this.puntuacionTotal = puntuacionTotal;
	}
	
	public Jugador(){}

	public int getIdJugador() {
		return idJugador;
	}

	public void setIdJugador(int idJugador) {
		this.idJugador = idJugador;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getPuntuacion() {
		return puntuacion;
	}

	public void setPuntuacion(int puntuacion) {
		this.puntuacion = puntuacion;
	}

	public int getPuntuacionTotal() {
		return puntuacionTotal;
	}

	public void setPuntuacionTotal(int puntuacionTotal) {
		this.puntuacionTotal = puntuacionTotal;
	}
	
	@Override
	public int hashCode() {
		return Integer.hashCode(this.idJugador);
	}
	
	@Override
	public boolean equals(Object obj) {
		boolean resultado = false;
		if (obj != null && obj instanceof Jugador) {
			Jugador otro = (Jugador)obj;
			resultado = this.idJugador == otro.idJugador;
		}
		return resultado;
	}
	
}
