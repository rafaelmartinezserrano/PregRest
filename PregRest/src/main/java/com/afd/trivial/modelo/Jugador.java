package com.afd.trivial.modelo;

public class Jugador {
	
	private int idJugador;
	private String nombre;
	private int puntuacion;
	private int puntuacionTotal;
	
	public Jugador(int idJugador, String nombre, int puntuacion, int puntuacionTotal) {
		this.idJugador = idJugador;
		this.nombre = nombre;
		this.puntuacion = puntuacion;
		this.puntuacionTotal = puntuacionTotal;
	}

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
	
}
