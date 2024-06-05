package com.vanphongpham.controller.login;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vanphongpham.model.User;
import com.vanphongpham.service.UserService;
import com.vanphongpham.util.ActionConstants;

//@WebServlet(name = "LoginController", urlPatterns = { "/login" })
@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;

    public void init() {
        userService = new UserService();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/login/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	String action = request.getParameter("action");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Kiểm tra action để đảm bảo đây là yêu cầu đăng nhập
        if (ActionConstants.LOGIN.equals(action)) {
            // Thực hiện kiểm tra thông tin đăng nhập
            if (validateUser(request, username, password)) {
                // Nếu thông tin đúng, chuyển hướng đến trang chính hoặc trang người dùng
                response.sendRedirect("home"); // Thay đổi URL đến trang chính của bạn
            } else {
                // Nếu thông tin không đúng, chuyển hướng đến trang đăng nhập với thông báo lỗi
                response.sendRedirect("login?error=true");
            }
        } else {
            // Nếu action không đúng, chuyển hướng đến trang đăng nhập
            response.sendRedirect("login");
        }
    }

    private boolean validateUser(HttpServletRequest request, String username, String password) {
        User existingUser = userService.getUserbyUsernameAndPassword(username, password);
        if(existingUser != null) {
        		request.getSession().setAttribute("userId", existingUser.getUserId());
                request.getSession().setAttribute("user", existingUser.getUserName());
                request.getSession().setAttribute("role", existingUser.getType());
        		return true;
        }
        return false;
    }

    private String getUserType(String username) {
        // Logic để lấy loại người dùng
        return "user"; // hoặc "admin"
    }
}