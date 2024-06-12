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

import com.vanphongpham.model.Product;
import com.vanphongpham.service.admin.ProductService;

@WebServlet("/admin/product")
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService;

    public ProductController() {
        this.productService = new ProductService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertProduct(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateProduct(request, response);
                    break;
                default:
                    listProducts(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Product> listProduct = productService.getAllProducts();
        request.setAttribute("productList", listProduct);
        request.getRequestDispatcher("/views/admin/product/list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/admin/product/form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("productId"));
        Product existingProduct = productService.getProductById(id);
        request.setAttribute("product", existingProduct);
        request.getRequestDispatcher("/views/admin/product/form.jsp").forward(request, response);
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
    	HttpSession session = request.getSession(false);
    	Product product = new Product(null, null, null, null);
    	
    	product.setProductName(request.getParameter("productName"));
    	product.setImage(request.getParameter("image"));
        product.setPrice((request.getParameter("price") != null && !request.getParameter("price").isEmpty()) ? Float.parseFloat(request.getParameter("price")) : 0);
        product.setDescription(request.getParameter("description"));
        product.setSalePrice((request.getParameter("salePrice") != null && !request.getParameter("salePrice").isEmpty()) ? Float.parseFloat(request.getParameter("salePrice")) : 0);
        product.setStatus(Integer.parseInt(request.getParameter("status")));
        product.setIsfavorite(Integer.parseInt(request.getParameter("isFavorite")));
        product.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
        product.setCategoryName(request.getParameter("categoryName"));
        product.setCreatedAt(new Timestamp(System.currentTimeMillis()));
        product.setCreateBy(session != null? String.valueOf(session.getAttribute("userId")) : null);
        product.setUpdateAt(null);
        product.setUpdateBy(null);
        
        productService.addProduct(product);
        response.sendRedirect("product?action=list");
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
    	HttpSession session = request.getSession(false);
    	Product product = new Product(null, null, null, null);
    	
        product.setProductId(Integer.parseInt(request.getParameter("productId")));
        product.setProductName(request.getParameter("productName"));
    	product.setImage(request.getParameter("image"));
        product.setPrice(request.getParameter("price") != null? Float.parseFloat(request.getParameter("price")) : null);
        product.setDescription(request.getParameter("description"));
        product.setSalePrice(request.getParameter("salePrice") != null? Float.parseFloat(request.getParameter("salePrice")) : null);
        product.setQuantitySold(Integer.parseInt(request.getParameter("quantitySold")));
        product.setStatus(Integer.parseInt(request.getParameter("status")));
        product.setIsfavorite(Integer.parseInt(request.getParameter("isFavorite")));
        product.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
        product.setCategoryName(request.getParameter("categoryName"));
        product.setProductName(request.getParameter("categoryName"));
        product.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        product.setUpdateBy(session != null? String.valueOf(session.getAttribute("userId")) : null);
        
        productService.updateProduct(product);
        response.sendRedirect("product?action=list");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("productId"));
        productService.deleteProduct(id);
        response.sendRedirect("product?action=list");
    }
}