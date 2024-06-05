package com.vanphongpham.controller.home;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vanphongpham.util.RoleConstants;

//@WebServlet(name = "HomeController", urlPatterns = { "/home" })
@WebServlet("/home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("role") != null) {
			short userRole = (short)session.getAttribute("role");
			if (userRole == RoleConstants.ADMIN) {
				response.sendRedirect(request.getContextPath() + "/admin/home");
			} else {
				response.sendRedirect(request.getContextPath() + "/web/home");
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/web/home");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}