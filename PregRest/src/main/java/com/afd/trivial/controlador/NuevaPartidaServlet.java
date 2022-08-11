package com.afd.trivial.controlador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.afd.trivial.modelo.Fachada;
import com.afd.trivial.modelo.Partida;

/**
 * Servlet implementation class NuevaPartidaServlet
 */

@WebServlet("/NuevaPartida")
public class NuevaPartidaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombrePartida = request.getParameter("nombrePartida");
		int numJugadores = Integer.parseInt(request.getParameter("numJugadores"));
		int pregPorCategoria = Integer.parseInt(request.getParameter("pregPorCategoria"));
		String[] categorias = request.getParameterValues("categoria");
		int[] idCategorias = new int[categorias.length];
		for(int i = 0 ; i< categorias.length ; i ++) {
			idCategorias[i] = Integer.parseInt(categorias[i]);
		}
		Fachada fachada = Fachada.getInstance();
		Partida nuevaPartida = fachada.crearPartida(nombrePartida, numJugadores, pregPorCategoria, idCategorias);

		if(nuevaPartida == null) {
			request.setAttribute("mensaje", "Error al crear partida. Contacte con el servicio tecnico.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("Menu.jsp");
			dispatcher.forward(request, response);
		}else {
			request.setAttribute("mensaje", "Partida creada correctamente, puedes buscar tu partida aqui: <a href=\"BuscarPartidas\">aquí</a>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("Menu.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
