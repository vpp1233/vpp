package com.vanphongpham.model;

import java.sql.Timestamp;
import java.util.List;

public class Bill extends BaseModel<Bill> {
    private Integer billId;
    private String productIds;
    private Integer userId;
    private float billPrice;
    private List<String> productName;

    // Constructor
    public Bill(Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
    	super(createdAt, updateAt, createBy, updateBy);
    }
    
    public Bill(Integer billId, String productIds,
    		Integer userId, float billPrice, List<String> productName, Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
        super(createdAt, updateAt, createBy, updateBy);
        this.billId = billId;
        this.productIds = productIds;
        this.userId = userId;
        this.billPrice = billPrice;
        this.productName = productName;
    }

    // Setter
    public void setBillId(Integer billId) {
        this.billId = billId;
    }

    public void setProductIds(String productIds) {
        this.productIds = productIds;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public void setbillPrice(float billPrice) {
        this.billPrice = billPrice;
    }

    // Getter
    public Integer getBillId() {
        return billId;
    }

    public String getProductIds() {
        return productIds;
    }

    public Integer getUserId() {
        return userId;
    }

    public float getbillPrice() {
        return billPrice;
    }

	public List<String> getProductName() {
		return productName;
	}

	public void setProductName(List<String> productName) {
		this.productName = productName;
	}
    
}
