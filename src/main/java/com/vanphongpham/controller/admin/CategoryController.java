package com.vanphongpham.controller.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vanphongpham.model.Category;
import com.vanphongpham.service.admin.CategoryService;

@WebServlet("/admin/category")
public class CategoryController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    private CategoryService categoryService;
    
    public CategoryController() {
        this.categoryService = new CategoryService();
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
                    insertCategory(request, response);
                    break;
                case "delete":
                    deleteCategory(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateCategory(request, response);
                    break;
                case "ajax":
                	handleAjaxRequest(request, response);
                    break;
                default:
                    listCategories(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
    private void listCategories(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Category> listCategory = categoryService.getAllCategories();
        request.setAttribute("categoryList", listCategory);
        request.getRequestDispatcher("/views/admin/category/list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/admin/category/form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("categoryId"));
        Category existingCategory = categoryService.getCategoryById(id);
        request.setAttribute("category", existingCategory);
        request.getRequestDispatcher("/views/admin/category/form.jsp").forward(request, response);
    }

    private void insertCategory(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
    	HttpSession session = request.getSession(false);
    	Category category = new Category(null, null, null, null);
    	
    	category.setCategoryName(request.getParameter("categoryName"));
        category.setStatus(Integer.parseInt(request.getParameter("status")));
        category.setCreatedAt(new Timestamp(System.currentTimeMillis()));
        category.setCreateBy(session != null? String.valueOf(session.getAttribute("userId")) : null);
        category.setUpdateAt(null);
        category.setUpdateBy(null);
        
        categoryService.addCategory(category);
        response.sendRedirect("category?action=list");
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
    	HttpSession session = request.getSession(false);
    	Category category = new Category(null, null, null, null);
    	
        category.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
        category.setCategoryName(request.getParameter("categoryName"));
        category.setStatus(Integer.parseInt(request.getParameter("status")));
        category.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        category.setUpdateBy(session != null? String.valueOf(session.getAttribute("userId")) : null);
        
        categoryService.updateCategory(category);
        response.sendRedirect("category?action=list");
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("categoryId"));
        categoryService.deleteCategory(id);
        response.sendRedirect("category?action=list");
    }
    
    private void handleAjaxRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Gọi hàm để lấy danh sách categories từ cơ sở dữ liệu (ví dụ: categoryService.getAllCategories())
        List<Category> categories = categoryService.getAllCategories();

        // Chuyển danh sách categories thành định dạng JSON
        JSONArray jsonCategories = new JSONArray();
        for (Category category : categories) {
            JSONObject jsonCategory = new JSONObject();
            jsonCategory.put("categoryId", category.getCategoryId());
            jsonCategory.put("categoryName", category.getCategoryName());
            jsonCategories.put(jsonCategory);
        }

        // Gửi danh sách categories dưới dạng JSON về cho trang JSP
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonCategories.toString());
    }
}
