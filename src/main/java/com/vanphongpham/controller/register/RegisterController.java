package com.vanphongpham.controller.register;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vanphongpham.model.User;
import com.vanphongpham.service.admin.UserService;

//@WebServlet(name = "RegisterController", urlPatterns = { "/register" })
@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;

    public void init() {
        userService = new UserService();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/register/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("passwordRetype");
        
        if (registerUser(username, password) && password.equals(confirmPassword)) {
        	User user = new User(null, null, null, null);
        	user.setUserName(username);
        	user.setPassword(password);
            user.setEmail(null);
            user.setStatus(1);
            user.setType(2);
            Timestamp createdAt = new Timestamp(System.currentTimeMillis());
            user.setCreatedAt(createdAt);
            String createdBy = username != null ? username : null;
            user.setCreateBy(createdBy);
            user.setUpdateAt(null);
            user.setUpdateBy(null);

            userService.addUser(user);
            response.sendRedirect("login");
        } else {
            request.setAttribute("error", "Mật khẩu không khớp.");
            request.getRequestDispatcher("views/register/register.jsp").forward(request, response);
        }
    }

    private boolean registerUser(String username, String password) {
        if(username == null && password == null)
        	return false;
        
        return true;
    }
}
