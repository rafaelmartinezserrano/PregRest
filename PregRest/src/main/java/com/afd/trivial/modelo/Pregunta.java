package com.afd.trivial.modelo;

import java.util.ArrayList;
import java.util.List;

public class Pregunta {
	
	private int idPregunta;
	private String enunciado;
	private Categoria categoria;
	private List<Respuesta> listaRespuesta;
	
	public Pregunta(int idPregunta, String enunciado, Categoria categoria, List<Respuesta> listaRespuesta) {
		this.idPregunta = idPregunta;
		this.enunciado = enunciado;
		this.categoria = categoria;
		this.listaRespuesta = listaRespuesta;
	}
	
	public Pregunta(int idPregunta, String enunciado, Categoria categoria) {
		this.idPregunta = idPregunta;
		this.enunciado = enunciado;
		this.categoria = categoria;
		this.listaRespuesta = new ArrayList<Respuesta>();
	}
	
	public int getIdPregunta() {
		return idPregunta;
	}

	public void setIdPregunta(int idPregunta) {
		this.idPregunta = idPregunta;
	}

	public String getEnunciado() {
		return enunciado;
	}

	public void setEnunciado(String enunciado) {
		this.enunciado = enunciado;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public List<Respuesta> getListaRespuesta() {
		return listaRespuesta;
	}

	public void setListaRespuesta(List<Respuesta> listaRespuesta) {
		this.listaRespuesta = listaRespuesta;
	}

}
