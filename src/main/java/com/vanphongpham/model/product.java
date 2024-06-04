package com.vanphongpham.model;

import java.sql.Timestamp;

public class Product extends BaseModel<Product> {
    private int productId;
    private String productName;
    private String image;
    private int categoryId;
    private String description;
    private float salePrice;
    private int quantity;
    private int quantitySold;
    private short status;
    private short isfavorite;
    private int customerId;
    private int cartId;

    public Product(int productId,
            String productName, String image, int categoryId, String description, float salePrice, int quantity,
            int quantitySold, short status, short isfavorite, int customerId, int cartId, Timestamp createdAt,
            Timestamp updateAt, String createBy, String updateBy) {
        super(createdAt, updateAt, createBy, updateBy);
        this.productId = productId;
        this.productName = productName;
        this.image = image;
        this.categoryId = categoryId;
        this.description = description;
        this.salePrice = salePrice;
        this.quantity = quantity;
        this.quantitySold = quantitySold;
        this.status = status;
        this.isfavorite = isfavorite;
        this.customerId = customerId;
        this.cartId = cartId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
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

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        this.quantitySold = quantitySold;
    }

    public short getStatus() {
        return status;
    }

    public void setStatus(short status) {
        this.status = status;
    }

    public short getIsfavorite() {
        return isfavorite;
    }

    public void setIsfavorite(short isfavorite) {
        this.isfavorite = isfavorite;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

}
