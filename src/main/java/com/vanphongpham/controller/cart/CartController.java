package com.vanphongpham.controller.cart;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vanphongpham.model.Cart;
import com.vanphongpham.service.CartService;

//@WebServlet(name = "CartController", urlPatterns = { "/cart" })
@WebServlet("/cart")
public class CartController extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private CartService cartService;

    public void init() {
        cartService = new CartService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
    	String action = request.getParameter("action");
        if (action == null) {
        	action = "list";
        }
        try {
	        switch (action) {
	            case "add":
	                addToCart(request, response);
	                break;
	            case "update":
	                updateCartItem(request, response);
	                break;
	            case "delete":
	                deleteCartItem(request, response);
	                break;
	            case "order":
	            	orderCart(request, response);
	                break;
	            default:
	            	getCartByUser(request, response);
	                break;
	        }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        doGet(request, response);
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int userId = (int) request.getSession().getAttribute("userId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        cartService.addToCart(productId, userId, quantity);
        response.sendRedirect("cart?action=list");
    }

    private void updateCartItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        cartService.updateCartItemQuantity(cartId, quantity);
        response.sendRedirect("cart?action=list");
    }

    private void deleteCartItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        cartService.removeFromCart(cartId);
    	response.sendRedirect("cart?action=list");
        
    }
    
    private void getCartByUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
    	HttpSession session = request.getSession(false);
    	if (session != null && session.getAttribute("userId") != null) {
    		Integer userIdObj = (Integer) session.getAttribute("userId");
    		if (userIdObj != null) {
    	        int userId = userIdObj.intValue();
    	        List<Cart> cartUsers = cartService.getCartsByUser(userId);
    	        request.setAttribute("cartByUsers", cartUsers);
    		}
    	}
        request.getRequestDispatcher("/views/cart/cart.jsp").forward(request, response);
    }
    
    private void orderCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("userId") != null) {
            Integer userIdObj = (Integer) session.getAttribute("userId");
            if (userIdObj != null) {
                int userId = userIdObj.intValue();
                cartService.clearCartByUser(userId);
            }
        }
        request.getRequestDispatcher("/views/succes/succes.jsp").forward(request, response);
    }
}