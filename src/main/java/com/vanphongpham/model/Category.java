package com.vanphongpham.model;

import java.sql.Timestamp;

public class Category extends BaseModel<Category> {
    private int categoryId;
    private String categoryName;
    private int productId;

    // Constructor
    public Category(int categoryId,
            String categoryName,
            int productId, Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
        super(createdAt, updateAt, createBy, updateBy);
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.productId = productId;
    }

    // Setter
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    // Getter
    public int getCategoryId() {
        return categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public int getProductId() {
        return productId;
    }
}
