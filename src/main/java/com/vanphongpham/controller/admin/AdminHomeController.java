package com.vanphongpham.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vanphongpham.util.RoleConstants;

//@WebServlet(name = "AdminHomeController", urlPatterns = { "/admin/home" })
@WebServlet("/admin/home")
public class AdminHomeController extends HttpServlet {

	private static final long serialVersionUID = -5682945778159712588L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("role") != null) {
			short userRole = (short)session.getAttribute("role");
			if (userRole == RoleConstants.ADMIN) {
				RequestDispatcher rd = request.getRequestDispatcher("/views/admin/home.jsp");
				rd.forward(request, response);
			}else {
				session.setAttribute("error", "Tài khoản không có quyền, yêu cầu đăng nhập!");
				response.sendRedirect("login");
			}
		}else {
			session.setAttribute("error", "Tài khoản không có quyền, yêu cầu đăng nhập!");
			response.sendRedirect("login");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
