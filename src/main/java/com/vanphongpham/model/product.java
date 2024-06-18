package com.vanphongpham.model;

import java.sql.Timestamp;

public class Product extends BaseModel<Product> {
    private Integer productId;
    private String productName;
    private String image;
    private float price;
    private String description;
    private float salePrice;
    private Integer quantitySold;
    private Integer status;
    private Integer isfavorite;
    private Integer categoryId;
    private String categoryName;

    public Product(Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
    	super(createdAt, updateAt, createBy, updateBy);
    }
    
    public Product(Integer productId, String productName, String image, float price, String description, 
    		float salePrice, Integer quantitySold, Integer status, Integer isfavorite, Integer categoryId, String categoryName,
    		Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
        super(createdAt, updateAt, createBy, updateBy);
        this.productId = productId;
        this.productName = productName;
        this.image = image;
        this.price = price;
        this.salePrice = salePrice;
        this.description = description;
        this.quantitySold = quantitySold;
        this.status = status;
        this.isfavorite = isfavorite;
        this.categoryId = categoryId;
        this.categoryName = categoryName;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(float salePrice) {
        this.salePrice = salePrice;
    }

    public Integer getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(Integer quantitySold) {
        this.quantitySold = quantitySold;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getIsfavorite() {
        return isfavorite;
    }

    public void setIsfavorite(Integer isfavorite) {
        this.isfavorite = isfavorite;
    }

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

}
