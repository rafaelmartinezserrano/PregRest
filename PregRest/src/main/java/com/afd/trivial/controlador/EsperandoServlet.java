package com.afd.trivial.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import com.afd.trivial.modelo.Partida;

/**
 * Servlet implementation class EsperandoServlet
 */
@WebServlet("/Esperando")
public class EsperandoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean completo = false;
		String idPartidaTexto = request.getParameter("idPartida");
		int idPartida = Integer.parseInt(idPartidaTexto);
		while (!completo) {
			HashMap<Integer, Partida> listaPartidas = (HashMap<Integer, Partida>)request.getSession().getServletContext().getAttribute("partidas");
			Partida partida = listaPartidas.get(idPartida);
			if (partida.getListaJugadores().size() == partida.getMaxJugadores()) {
				completo = true;
			}
		}
		response.setContentType("text/plain");
		PrintWriter salida = response.getWriter();
		salida.write("true");
		salida.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
