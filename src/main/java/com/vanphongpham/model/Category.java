package com.vanphongpham.model;

import java.sql.Timestamp;

public class Category extends BaseModel<Category> {
    private Integer categoryId;
    private String categoryName;
    private Integer status;

    public Category(Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
    	super(createdAt, updateAt, createBy, updateBy);
    }
    
    public Category(Integer categoryId,String categoryName, Integer status,
    		Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
    	
        super(createdAt, updateAt, createBy, updateBy);
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.status = status;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
    
    public Integer getCategoryId() {
        return categoryId;
    }
    
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    
    public String getCategoryName() {
        return categoryName;
    }

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
