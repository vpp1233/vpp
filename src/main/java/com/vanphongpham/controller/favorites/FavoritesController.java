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
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
		    case "listAll":
		    	showListAllFavorite(request, response);
		        break;
		    default:
		    	showListFavorite(request, response);
		        break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        doGet(request, response);
	}
	
	private void showListFavorite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	
	private void showListAllFavorite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        List<Product> listAllFavorite = null;
		try {
			listAllFavorite = productService.getAllFavoriteByCategory(categoryId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
        request.setAttribute("listAllFavorite", listAllFavorite);
        request.getRequestDispatcher("/views/favorites/listAllFavorite.jsp").forward(request, response);
	}
}