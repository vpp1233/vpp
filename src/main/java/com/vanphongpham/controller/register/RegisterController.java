package com.vanphongpham.controller.register;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterController", urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/register/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (password.equals(confirmPassword)) {
            // Logic để lưu thông tin người dùng vào cơ sở dữ liệu
            // Giả sử phương thức registerUser để lưu thông tin người dùng
            if (registerUser(username, password)) {
                response.sendRedirect("login");
            } else {
                request.setAttribute("error", "Đăng ký không thành công, vui lòng thử lại.");
                request.getRequestDispatcher("views/register/register.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Mật khẩu không khớp.");
            request.getRequestDispatcher("views/register/register.jsp").forward(request, response);
        }
    }

    private boolean registerUser(String username, String password) {
        // Logic để lưu thông tin người dùng vào cơ sở dữ liệu
        return true; // Giả sử lưu thành công
    }
}
