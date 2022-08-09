package com.afd.trivial.controlador;

import java.io.IOException;

import com.afd.trivial.modelo.Fachada;
import com.afd.trivial.modelo.FachadaImpl;
import com.afd.trivial.modelo.Jugador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InciarSesionServlet
 */
@WebServlet("/IniciarSesion")
public class InciarSesionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre = request.getParameter("nombreJugador");
		Fachada fachada = FachadaImpl.getInstance();
		try {
			Jugador j = fachada.iniciarSesion(nombre);
			if(j!=null) {
				request.getSession().setAttribute(nombre, j);
				RequestDispatcher dispatcher = request.getRequestDispatcher("menu.jsp");
				dispatcher.forward(request, response);
			}else {
				request.setAttribute("mensaje", "Nombre de jugador o jugadora ya existe");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}catch (Exception e) {
			throw new ServletException(e);
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
