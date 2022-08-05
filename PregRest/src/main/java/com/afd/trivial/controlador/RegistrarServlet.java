package com.afd.trivial.controlador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.afd.trivial.modelo.Fachada;
import com.afd.trivial.modelo.Jugador;

/**
 * Servlet implementation class RegistrarServlet
 */
@WebServlet("/Registrar")
public class RegistrarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = request.getParameter("alias");
		Fachada fachada = Fachada.getInstance();
		Jugador jugador = fachada.registrarJugador(usuario);
		if(jugador == null) {
			request.setAttribute("mensajeError", "Error de Comprobacion. Contacte con el servicio tecnico.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("registro.jsp");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
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
