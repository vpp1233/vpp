package com.vanphongpham.service.admin;

import java.sql.SQLException;
import java.util.List;

import com.vanphongpham.model.Category;
import com.vanphongpham.repository.admin.CategoryRepository;

public class CategoryService {
	private CategoryRepository categoryRepository;

    public CategoryService() {
        this.categoryRepository = new CategoryRepository();
    }

    public void addCategory(Category category) throws SQLException {
        categoryRepository.insertCategory(category);
    }

    public Category getCategoryById(int id) {
        return categoryRepository.getCategoryById(id);
    }

    public List<Category> getAllCategories() {
        return categoryRepository.selectAllCategories();
    }

    public boolean updateCategory(Category category) throws SQLException {
        return categoryRepository.updateCategory(category);
    }

    public boolean deleteCategory(int id) throws SQLException {
        return categoryRepository.deleteCategory(id);
    }
}
