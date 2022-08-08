package com.afd.trivial.controlador;

import java.io.IOException;
import java.util.List;

import com.afd.trivial.modelo.Fachada;
import com.afd.trivial.modelo.Partida;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class buscarPartidas
 */
public class buscarPartidas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombrePartida = request.getParameter("nombrePartida");
		Fachada fachada = Fachada.getInstance();
		List<Partida> listaPartidas = fachada.buscarPartidas();
		request.setAttribute("verPartidas", listaPartidas);
		request.getRequestDispatcher("buscarPartida.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
