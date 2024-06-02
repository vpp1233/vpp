package com.vanphongpham.model;

import java.sql.Timestamp;

public class Customer extends BaseModel<Customer> {
    private int customerId;
    private String address;
    private String city;
    private String district;
    private String email;
    private String firstName;
    private String lastName;
    private String phoneNumber;
    private String userName;

    // Constructor

    public Customer(Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy, int customerId,
            String address, String city, String district, String email, String firstName, String lastName,
            String phoneNumber, String userName) {
        super(createdAt, updateAt, createBy, updateBy);
        this.customerId = customerId;
        this.address = address;
        this.city = city;
        this.district = district;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.userName = userName;
    }

    // Setter
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    // Getter

    public String getAddress() {
        return address;
    }

    public String getCity() {
        return city;
    }

    public String getDistrict() {
        return district;
    }

    public String getEmail() {
        return email;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getUserName() {
        return userName;
    }
}
