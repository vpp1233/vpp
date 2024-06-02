package com.vanphongpham.model;

import java.sql.Timestamp;

public class Bill extends BaseModel<Bill> {
    private int billId;
    private int customerId;
    private short status;
    private float totalPrice;

    // Constructor
    public Bill(Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy, int billId, int customerId,
            short status, float totalPrice) {
        super(createdAt, updateAt, createBy, updateBy);
        this.billId = billId;
        this.customerId = customerId;
        this.status = status;
        this.totalPrice = totalPrice;
    }

    // Setter
    public void setBillId(int billId) {
        this.billId = billId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public void setStatus(short status) {
        this.status = status;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    // Getter
    public int getBillId() {
        return billId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public short getStatus() {
        return status;
    }

    public float getTotalPrice() {
        return totalPrice;
    }
}
