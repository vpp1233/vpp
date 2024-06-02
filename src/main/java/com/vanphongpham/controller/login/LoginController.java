package com.vanphongpham.controller.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginController", urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/login/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Giả sử chúng ta có phương thức validateUser để kiểm tra tên đăng nhập và mật
        // khẩu
        if (validateUser(username, password)) {
            HttpSession session = request.getSession();
            // Giả sử phương thức getUserType trả về "admin" hoặc "user"
            String userType = getUserType(username);
            session.setAttribute("userType", userType);
            response.sendRedirect("index");
        } else {
            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng");
            request.getRequestDispatcher("views/login/dangnhap.jsp").forward(request, response);
        }
    }

    private boolean validateUser(String username, String password) {
        // Kiểm tra thông tin đăng nhập của admin
        return "admin".equals(username) && "123".equals(password);
    }

    private String getUserType(String username) {
        // Logic để lấy loại người dùng
        return "user"; // hoặc "admin"
    }
}