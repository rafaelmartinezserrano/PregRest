package com.afd.trivial.controlador;

import java.io.IOException;
import java.util.HashMap;

import com.afd.trivial.modelo.Jugador;
import com.afd.trivial.modelo.Partida;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JugarServlet
 */
@WebServlet("/JugarPartida")
public class JugarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idPartidaTexto = request.getParameter("partida");
		int idPartida = Integer.parseInt(idPartidaTexto);
		HashMap<Integer, Partida> listaPartidas = (HashMap<Integer, Partida>)request.getSession().getServletContext().getAttribute("partidas");
		Partida partida = listaPartidas.get(idPartida);
		Jugador jugador = (Jugador)request.getSession().getAttribute("jugador");
		jugador.setPuntuacion(-1);
		boolean insertado = partida.insertarJugador(jugador);
		if (insertado) {
			request.getSession().getServletContext().setAttribute("partidas", listaPartidas);
			request.getSession().setAttribute("idPartida", idPartida);
			response.sendRedirect("esperar.jsp");
		} else {
			request.setAttribute("mensaje", "Lo siento, la partida está completa");
			RequestDispatcher dispatcher = request.getRequestDispatcher("menu.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
