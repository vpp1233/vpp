package com.vanphongpham.model;

import java.sql.Timestamp;

public class Cart extends BaseModel<Cart> {
    private Integer cartId;
    private Integer productId;
    private Integer userId;
    private Integer quantity;
    private String productName;
    private String image;
    private float price;
    private String description;
    private float salePrice;
    private String categoryName;

    // Constructor
    public Cart(Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
    	super(createdAt, updateAt, createBy, updateBy);
    }
    
    public Cart(Integer cartId, Integer productId,
            Integer userId, Integer quantity,Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
        super(createdAt, updateAt, createBy, updateBy);
        this.cartId = cartId;
        this.productId = productId;
        this.userId = userId;
        this.quantity = quantity;
    }

	public Integer getCartId() {
		return cartId;
	}

	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
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

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
 
}
