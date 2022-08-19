package com.afd.trivial.controlador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.afd.trivial.modelo.Fachada;
import com.afd.trivial.modelo.Jugador;
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
		Jugador jugador = (Jugador)request.getSession().getAttribute("jugador");
		Fachada fachada = Fachada.getInstance();
		Partida nuevaPartida = fachada.crearPartida(nombrePartida, numJugadores, pregPorCategoria, idCategorias, jugador);

		if(nuevaPartida == null) {
			request.setAttribute("mensaje", "Error al crear partida. Contacte con el servicio tecnico.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("menu.jsp");
			dispatcher.forward(request, response);
		}else {
			HashMap<Integer, Partida> listaPartidas = (HashMap<Integer, Partida>)request.getSession().getServletContext().getAttribute("partidas");
			if (listaPartidas == null) {
				listaPartidas = new HashMap<Integer,Partida>();
			}
			listaPartidas.put(nuevaPartida.getIdPartida(),nuevaPartida);
			request.getSession().getServletContext().setAttribute("partidas", listaPartidas);
			request.getSession().setAttribute("idPartida", nuevaPartida.getIdPartida());
			response.sendRedirect("esperar.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
