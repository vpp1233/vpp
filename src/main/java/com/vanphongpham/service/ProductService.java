package com.vanphongpham.service;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.concurrent.TimeUnit;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;

import com.vanphongpham.model.Product;
import com.vanphongpham.repository.ProductRepository;

public class ProductService {
	private ProductRepository productRepository;
	private Cache<String, CacheEntry> listCache;
	
	public ProductService() {
        this.productRepository = new ProductRepository();
        this.listCache = Caffeine.newBuilder()
                .expireAfterWrite(10, TimeUnit.MINUTES) // Thời gian hết hạn của cache
                .maximumSize(100) // Số lượng tối đa của các entry trong cache
                .build();
    }
	
	public List<Product> getLatestProductsByCategory(Integer categoryId, Integer limit) throws SQLException {
		if (categoryId == null || limit == null) {
            return null;
        }
		// Tạo key cache dựa trên tên phương thức và tham số
        String cacheKey = "getLatestProductsByCategory_" + categoryId + "_" + limit;
        
        // Kiểm tra cache trước khi truy vấn cơ sở dữ liệu
        CacheEntry cacheEntry = listCache.getIfPresent(cacheKey);
        Timestamp latestTimestamp = productRepository.getLatestUpdatedAt();
        if (cacheEntry != null && cacheEntry.getTimestamp().equals(latestTimestamp)) {
            return cacheEntry.getLatestProductsByCategory();
        }
        
        // Nếu cache không có, truy vấn cơ sở dữ liệu
        List<Product> products = productRepository.getLatestProductsByCategory(categoryId, limit);

        if (products != null) {
            listCache.put(cacheKey, new CacheEntry(products, latestTimestamp));
        }

        return products;
    }
	
	private static class CacheEntry {
        private List<Product> products;
        private Timestamp timestamp;

        public CacheEntry(List<Product> products, Timestamp timestamp) {
            this.products = products;
            this.timestamp = timestamp;
        }

        public List<Product> getLatestProductsByCategory() {
            return products;
        }

        public Timestamp getTimestamp() {
            return timestamp;
        }
    }
	
}
