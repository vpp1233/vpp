package com.vanphongpham.service;

import java.sql.SQLException;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.sql.DataSource;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;

import com.vanphongpham.model.Product;
import com.vanphongpham.repository.ProductRepository;

public class ProductService {
	private ProductRepository productRepository;
	private Cache<String, List<Product>> cache;
	private DataSource dataSource;
	
	public ProductService() {
        this.productRepository = new ProductRepository();
        cache = Caffeine.newBuilder()
                .expireAfterWrite(10, TimeUnit.MINUTES) // Thời gian hết hạn của cache
                .maximumSize(100) // Số lượng tối đa của các entry trong cache
                .build();
    }
	
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }
	
	public List<Product> getLatestProductsByCategory(Integer categoryId, Integer limit) throws SQLException {
		if (categoryId == null || limit == null) {
            return null;
        }
		// Tạo key cache dựa trên tên phương thức và tham số
        String cacheKey = "getLatestProductsByCategory_" + categoryId + "_" + limit;
        
        // Kiểm tra cache trước khi truy vấn cơ sở dữ liệu
        List<Product> products = cache.getIfPresent(cacheKey);
        if (products != null) {
            return products;
        }
        
        // Nếu cache không có, truy vấn cơ sở dữ liệu
        products = productRepository.getLatestProductsByCategory(categoryId, limit);

        // Đặt kết quả vào cache
        cache.put(cacheKey, products);

        return products;
    }
	
}
