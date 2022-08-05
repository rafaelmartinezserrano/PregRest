package com.afd.trivial.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.afd.trivial.modelo.Fachada;

/**
 * Servlet implementation class ComprobarAliasServlet
 */
@WebServlet("/ComprobarAlias")
public class ComprobarAliasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombreAlias = request.getParameter("nombreAlias");
		Fachada fachada = Fachada.getInstance();
		boolean existe = fachada.comprobarAlias(nombreAlias);
		response.setContentType("text/plain");
		PrintWriter salida = response.getWriter();
		salida.write(Boolean.toString(existe));
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
