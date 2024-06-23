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
import javax.servlet.http.HttpSession;

import com.vanphongpham.model.User;
import com.vanphongpham.service.admin.UserService;

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
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
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
    	User newUser = new User(null,null,null,null);
    	request.setAttribute("user", newUser);
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
    	HttpSession session = request.getSession(false);
    	User user = new User(null, null, null, null);
    	user.setUserName(request.getParameter("userName"));
    	user.setPassword(request.getParameter("password"));
        user.setEmail(request.getParameter("email"));
        user.setStatus(Integer.parseInt(request.getParameter("status")));
        user.setType(Integer.parseInt(request.getParameter("type")));
        Timestamp createdAt = new Timestamp(System.currentTimeMillis());
        user.setCreatedAt(createdAt);
        String createdBy = session != null? String.valueOf(session.getAttribute("userId")) : null;
        user.setCreateBy(createdBy);
        user.setUpdateAt(null);
        user.setUpdateBy(null);

        userService.addUser(user);
        response.sendRedirect("user?action=list");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
    	HttpSession session = request.getSession(false);
    	User user = new User(null, null, null, null);
    	
    	user.setUserId(Integer.parseInt(request.getParameter("userId")));
    	user.setUserName(request.getParameter("userName"));
    	user.setPassword(request.getParameter("password"));
        user.setEmail(request.getParameter("email"));
        user.setStatus(Integer.parseInt(request.getParameter("status")));
        user.setType(Integer.parseInt(request.getParameter("type")));
        user.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        user.setUpdateBy(session != null? String.valueOf(session.getAttribute("userId")) : null);
        
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
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        doGet(request, response);
    }
}
