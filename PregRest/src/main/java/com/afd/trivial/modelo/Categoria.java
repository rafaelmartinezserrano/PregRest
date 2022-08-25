package com.afd.trivial.modelo;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Categoria {
	
	@Id
	private int idCategoria;
	private String nombre;
	
	public Categoria(int idCategoria, String nombre) {
		this.idCategoria = idCategoria;
		this.nombre = nombre;
	}
	
	public Categoria(){}

	public int getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public boolean equals(Object obj) {
		boolean resultado = false;
		if (obj != null && obj instanceof Categoria) {
			Categoria otra = (Categoria)obj;
			resultado = this.idCategoria == otra.idCategoria;
		}
		return resultado;
	}
}
