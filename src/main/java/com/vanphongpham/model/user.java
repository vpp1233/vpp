package com.vanphongpham.model;

import java.sql.Timestamp;

public class User extends BaseModel<User> {
    private Integer userId;
    private String userName;
    private String password;
    private Integer status;
    private Integer type;
    private String email;

    public User(Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
    	super(createdAt, updateAt, createBy, updateBy);
    }
    
    public User(Integer userId, String userName, String password, Integer status, Integer type, String email,
            Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
        super(createdAt, updateAt, createBy, updateBy);

        this.userId = userId;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.status = status;
        this.type = type;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

}
