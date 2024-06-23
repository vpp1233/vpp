package com.vanphongpham.controller.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vanphongpham.model.Product;
import com.vanphongpham.service.ProductService;

@WebServlet("/web/product")
public class ProductController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    private ProductService productService;
    
    public ProductController() {
        this.productService = new ProductService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        List<Product> listProduct = null;
		try {
			listProduct = productService.getAllProductsByCategory(categoryId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        request.setAttribute("allProduct", listProduct);
        request.getRequestDispatcher("/views/web/ListAllProduct.jsp").forward(request, response);
        
    }
}
