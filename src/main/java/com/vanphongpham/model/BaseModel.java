package com.vanphongpham.model;

import java.sql.Timestamp;

public abstract class BaseModel<T> {
    private Timestamp createdAt;
    private Timestamp updateAt;
    private String createBy;
    private String updateBy;

    // Contructor
    protected BaseModel(Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
        this.createdAt = createdAt;
        this.updateAt = updateAt;
        this.createBy = createBy;
        this.updateBy = updateBy;
    }

    // Setter
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdateAt(Timestamp updateAt) {
        this.updateAt = updateAt;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    // Getter
    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public Timestamp getUpdateAt() {
        return updateAt;
    }

    public String getCreateBy() {
        return createBy;
    }

    public String getUpdateBy() {
        return updateBy;
    }

}
