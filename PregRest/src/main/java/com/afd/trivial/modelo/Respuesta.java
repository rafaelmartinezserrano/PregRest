package com.afd.trivial.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Respuesta {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idRespuesta;
	private String texto;
	@ManyToOne
	@JoinColumn(name = "idPregunta")
	private Pregunta pregunta;
	private boolean correcta;
	


	public Respuesta(int idRespuesta, String texto, Pregunta pregunta, boolean correcta) {
		this.idRespuesta = idRespuesta;
		this.texto = texto;
		this.pregunta = pregunta;
		this.correcta = correcta;
	}
	
	public Pregunta getPregunta() {
		return pregunta;
	}

	public void setPregunta(Pregunta pregunta) {
		this.pregunta = pregunta;
	}

	public int getIdRespuesta() {
		return idRespuesta;
	}

	public void setIdRespuesta(int idRespuesta) {
		this.idRespuesta = idRespuesta;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public boolean isCorrecta() {
		return correcta;
	}

	public void setCorrecta(boolean correcta) {
		this.correcta = correcta;
	}
	
}
