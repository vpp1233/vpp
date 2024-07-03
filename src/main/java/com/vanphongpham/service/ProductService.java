package com.vanphongpham.service;

import java.sql.SQLException;
import java.util.List;

import com.vanphongpham.model.Product;
import com.vanphongpham.repository.ProductRepository;

public class ProductService {
	private ProductRepository productRepository;
	
	public ProductService() {
        this.productRepository = new ProductRepository();
    }
	
	public List<Product> getFavoriteProduct(Integer categoryId, Integer limit) throws SQLException {
		if (categoryId == null) {
            return null;
        }
        List<Product> products = productRepository.getFavoriteProduct(categoryId, limit);
        return products;
    }
	
	public List<Product> getLatestProductsByCategory(Integer categoryId, Integer limit) throws SQLException {
		if (categoryId == null || limit == null) {
            return null;
        }
		
        List<Product> products = productRepository.getLatestProductsByCategory(categoryId, limit);
        return products;
    }
	
	public List<Product> getAllProductsByCategory(Integer categoryId) throws SQLException {
		if (categoryId == null) {
            return null;
        }
        
        List<Product> products = productRepository.getAllProductsByCategory(categoryId);
        return products;
    }
	
	public List<Product> getAllFavoriteByCategory(Integer categoryId) throws SQLException {
		if (categoryId == null) {
            return null;
        }
        
        List<Product> products = productRepository.getAllFavoriteByCategory(categoryId);
        return products;
    }
	
}
