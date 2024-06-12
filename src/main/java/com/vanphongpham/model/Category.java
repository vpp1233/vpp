package com.vanphongpham.model;

import java.sql.Timestamp;

public class Category extends BaseModel<Category> {
    private int categoryId;
    private String categoryName;
    private int status;

    public Category(Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
    	super(createdAt, updateAt, createBy, updateBy);
    }
    
    public Category(int categoryId,String categoryName, int status,
    		Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
    	
        super(createdAt, updateAt, createBy, updateBy);
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.status = status;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
    
    public int getCategoryId() {
        return categoryId;
    }
    
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    
    public String getCategoryName() {
        return categoryName;
    }

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
