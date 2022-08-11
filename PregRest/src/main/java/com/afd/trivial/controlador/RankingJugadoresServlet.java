package com.afd.trivial.controlador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import javax.ws.rs.core.Request;

import com.afd.trivial.modelo.Fachada;
import com.afd.trivial.modelo.FachadaImpl;
import com.afd.trivial.modelo.Jugador;

/**
 * Servlet implementation class RankingJugadoresServlet
 */
@WebServlet("/RankingJugadores")
public class RankingJugadoresServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fachada fachada = FachadaImpl.getInstance();
		List<Jugador> gamerList = fachada.obtenerRanking();
		request.setAttribute("listaJugadores", gamerList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ranking.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
