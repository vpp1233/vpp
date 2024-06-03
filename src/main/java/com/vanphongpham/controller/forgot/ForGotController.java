package com.vanphongpham.controller.forgot;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ForGotController", urlPatterns = { "/forgot" })
public class ForGotController extends HttpServlet {

	private static final long serialVersionUID = -5682945778159712588L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/views/forgot/forgot.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
