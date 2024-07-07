package com.vanphongpham.service.admin;

import java.sql.SQLException;
import java.util.List;

import com.vanphongpham.model.Product;
import com.vanphongpham.repository.admin.ProductRepository;

public class ProductService {
    
    private ProductRepository productRepository;

    public ProductService() {
        this.productRepository = new ProductRepository();
    }

    public void addProduct(Product product) throws SQLException {
        productRepository.insertProduct(product);
    }

    public Product getProductById(Integer id) {
        return productRepository.getProductById(id);
    }

    public List<Product> getAllProducts() {
        return productRepository.selectAllProducts();
    }

    public boolean updateProduct(Product product) throws SQLException {
        return productRepository.updateProduct(product);
    }

    public boolean deleteProduct(Integer id) throws SQLException {
        return productRepository.deleteProduct(id);
    }
    
    public List<String> getProductNamesFromIds(String productIdsStr){
    	if(productIdsStr == null) {
    		return null;
    	}
    	List<String> productNames = null;
    	try {
    		productNames = productRepository.getProductNamesFromIds(productIdsStr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return productNames;
    }
}
