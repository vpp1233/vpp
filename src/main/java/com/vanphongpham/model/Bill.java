package com.vanphongpham.model;

import java.sql.Timestamp;

public class Bill extends BaseModel<Bill> {
    private Integer billId;
    private Integer productId;
    private Integer userId;
    private float totalPrice;
    private String productName;

    // Constructor
    public Bill(Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
    	super(createdAt, updateAt, createBy, updateBy);
    }
    
    public Bill(Integer billId, Integer productId,
    		Integer userId, float totalPrice, String productName, Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
        super(createdAt, updateAt, createBy, updateBy);
        this.billId = billId;
        this.productId = productId;
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.productName = productName;
    }

    // Setter
    public void setBillId(Integer billId) {
        this.billId = billId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    // Getter
    public Integer getBillId() {
        return billId;
    }

    public Integer getProductId() {
        return productId;
    }

    public Integer getUserId() {
        return userId;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
    
}
