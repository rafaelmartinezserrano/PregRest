package com.afd.trivial.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.afd.trivial.modelo.Categoria;
import com.afd.trivial.modelo.Fachada;
import com.afd.trivial.modelo.FachadaImpl;

/**
 * Servlet implementation class RecuperarListaCategoriasServlet
 */

@WebServlet("/RecuperarListaCategorias")

public class RecuperarListaCategoriasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fachada fachada = FachadaImpl.getInstance();
		List<Categoria> listaCategorias = fachada.obtenerCategoria();
		request.setAttribute("listaCategorias", listaCategorias);
		request.getRequestDispatcher("NuevaPartida.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
