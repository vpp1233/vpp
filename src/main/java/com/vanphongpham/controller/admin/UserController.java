package com.vanphongpham.controller.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vanphongpham.model.User;
import com.vanphongpham.service.UserService;

//@WebServlet(name = "UserController", urlPatterns = { "/user" })
@WebServlet("/admin/user")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = -5682945778159712588L;
    private UserService userService;

    public void init() {
        userService = new UserService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertUser(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateUser(request, response);
                    break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        List<User> listUser = userService.getAllUsers();
        request.setAttribute("listUser", listUser);
        request.getRequestDispatcher("/views/admin/user/list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/admin/user/form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        User existingUser = userService.getUserById(userId);
        request.setAttribute("user", existingUser);
        request.getRequestDispatcher("/views/admin/user/form.jsp").forward(request, response);

    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        short status = Short.parseShort(request.getParameter("status"));
        short type = Short.parseShort(request.getParameter("type"));
        Timestamp createdAt = new Timestamp(System.currentTimeMillis());
        String createdBy = request.getParameter("createdBy");
        Timestamp updatedAt = createdAt;
        String updatedBy = createdBy;

        User newUser = new User(0, userName, password, status, type, email, createdAt, updatedAt, createdBy, updatedBy);
        userService.addUser(newUser);
        response.sendRedirect("user?action=list");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        short status = Short.parseShort(request.getParameter("status"));
        short type = Short.parseShort(request.getParameter("type"));
        Timestamp updatedAt = new Timestamp(System.currentTimeMillis());
        String updatedBy = request.getParameter("updatedBy");

        User user = new User(userId, userName, password, status, type, email, null, updatedAt, null, updatedBy);
        userService.updateUser(user);
        response.sendRedirect("user?action=list");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        userService.deleteUser(userId);
        response.sendRedirect("user?action=list");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
