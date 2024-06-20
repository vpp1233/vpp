package com.vanphongpham.service.admin;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.concurrent.TimeUnit;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import com.vanphongpham.model.Category;
import com.vanphongpham.repository.admin.CategoryRepository;

public class CategoryService {
	private CategoryRepository categoryRepository;
	private final Cache<String, CacheEntry> listCache;
	private final Cache<String, CacheEntry> cache;
	
    public CategoryService() {
        this.categoryRepository = new CategoryRepository();
        this.cache = Caffeine.newBuilder()
                .expireAfterWrite(10, TimeUnit.MINUTES)
                .maximumSize(100)
                .build();
        this.listCache = Caffeine.newBuilder()
                .expireAfterWrite(10, TimeUnit.MINUTES)
                .maximumSize(100)
                .build();
    }

    public void addCategory(Category category) throws SQLException {
        categoryRepository.insertCategory(category);
    }

    public Category getCategoryById(int id) {
    	Category category = null;
        String cacheKey = "getCategoryById_"+id;
        
        // Kiểm tra cache trước khi truy vấn cơ sở dữ liệu
        CacheEntry cacheEntry = cache.getIfPresent(cacheKey);
        Timestamp latestTimestamp = categoryRepository.getLatestUpdatedAt();
        if (cacheEntry != null && cacheEntry.getTimestamp().equals(latestTimestamp)) {
            return cacheEntry.getCategoryById();
        }
        // Nếu cache không có, truy vấn cơ sở dữ liệu
        category = categoryRepository.getCategoryById(id);

        // Đặt kết quả vào cache
        if (category != null) {
        	cache.put(cacheKey, new CacheEntry(category, latestTimestamp));
        }
        return category;
    }

    public List<Category> getAllCategories() {
    	List<Category> categories = null;
    	String cacheKey = "getAllCategories";
    	
    	CacheEntry cacheEntry = listCache.getIfPresent(cacheKey);
    	Timestamp latestTimestamp = categoryRepository.getLatestUpdatedAt();
    	if (cacheEntry != null && cacheEntry.getTimestamp().equals(latestTimestamp)) {
            return cacheEntry.getAllCategories();
        }
    	categories = categoryRepository.selectAllCategories();
    	if (categories != null) {
    		listCache.put(cacheKey, new CacheEntry(categories, latestTimestamp));
        }
        return categories;
    }

    public boolean updateCategory(Category category) throws SQLException {
        return categoryRepository.updateCategory(category);
    }

    public boolean deleteCategory(int id) throws SQLException {
        return categoryRepository.deleteCategory(id);
    }
    
    private static class CacheEntry {
    	private Category category;
        private List<Category> categories;
        private Timestamp timestamp;

        public CacheEntry(List<Category> categories, Timestamp timestamp) {
            this.categories = categories;
            this.timestamp = timestamp;
        }
        
        public CacheEntry(Category category, Timestamp timestamp) {
            this.category = category;
            this.timestamp = timestamp;
        }

        public Category getCategoryById() {
        	return category;
        }
        
        public List<Category> getAllCategories() {
            return categories;
        }

        public Timestamp getTimestamp() {
            return timestamp;
        }
    }
}
