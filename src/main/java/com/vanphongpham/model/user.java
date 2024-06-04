package com.vanphongpham.model;

import java.sql.Timestamp;

public class User extends BaseModel<User> {
    private int userId;
    private String userName;
    private String password;
    private short status;
    private short type;
    private String email;

    public User(int userId, String userName, String password, short status, short type, String email,
            Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy) {
        super(createdAt, updateAt, createBy, updateBy);

        this.userId = userId;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.status = status;
        this.type = type;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
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

    public short getStatus() {
        return status;
    }

    public void setStatus(short status) {
        this.status = status;
    }

    public short getType() {
        return type;
    }

    public void setType(short type) {
        this.type = type;
    }

}
