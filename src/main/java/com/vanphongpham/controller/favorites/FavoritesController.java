package com.vanphongpham.controller.favorites;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vanphongpham.model.Cart;
import com.vanphongpham.model.Category;
import com.vanphongpham.model.Product;
import com.vanphongpham.service.ProductService;
import com.vanphongpham.service.admin.CategoryService;

//@WebServlet(name = "FavoritesController", urlPatterns = { "/favorites" })
@WebServlet("/favorites")
public class FavoritesController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService productService;
	private CategoryService categoryService;
	
	public void init() {
		productService = new ProductService();
		categoryService = new CategoryService();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Category> categories = categoryService.getAllCategories();
	 	Map<String, List<Product>> categoryProducts = new HashMap<>();

        for(Category category : categories) {
        	try {
				List<Product> products = productService.getFavoriteProduct(category.getCategoryId(), 5);
				categoryProducts.put(category.getCategoryName(), products);
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
        request.setAttribute("favoriteProducts", categoryProducts);
		RequestDispatcher rd = request.getRequestDispatcher("/views/favorites/favorites.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}