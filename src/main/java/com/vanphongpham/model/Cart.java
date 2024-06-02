package com.vanphongpham.model;

import java.sql.Timestamp;

public class Cart extends BaseModel<Cart> {
    private int cartId;
    private int productId;
    private int userId;

    // Constructor
    public Cart(Timestamp createdAt, Timestamp updateAt, String createBy, String updateBy, int cartId, int productId,
            int userId) {
        super(createdAt, updateAt, createBy, updateBy);
        this.cartId = cartId;
        this.productId = productId;
        this.userId = userId;
    }

    // Setter
    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setUserID(short userId) {
        this.userId = userId;
    }

    // Getter
    public int getCartId() {
        return cartId;
    }

    public int getProductId() {
        return productId;
    }

    public int getUserId() {
        return userId;
    }

}
