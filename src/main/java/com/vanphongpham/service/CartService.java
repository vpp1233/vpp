package com.vanphongpham.service;

import java.sql.SQLException;
import java.util.List;
import java.util.concurrent.TimeUnit;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import com.vanphongpham.model.Cart;
import com.vanphongpham.repository.CartRepository;

public class CartService {
    private CartRepository cartRepository;
    private Cache<Integer, List<Cart>> cartCache;

    public CartService() {
        this.cartRepository = new CartRepository();
        this.cartCache = Caffeine.newBuilder()
                .expireAfterWrite(10, TimeUnit.MINUTES) // Cache expiration time
                .maximumSize(100) // Maximum number of entries in the cache
                .build();
    }

    public void addToCart(int productId, int userId, int quantity) throws SQLException {
        // Add item to the cart repository
        cartRepository.addToCart(productId, userId, quantity);

        // Invalidate cache for this user's cart items
        cartCache.invalidate(userId);
    }

    public List<Cart> getCartsByUser(int userId) {
        // Check cache first
        List<Cart> cartItems = cartRepository.getCartsByUser(userId);

        return cartItems;
    }

    public boolean removeFromCart(int cartId) throws SQLException {
        // Remove item from the cart repository
        boolean removed = cartRepository.removeFromCart(cartId);

        // Invalidate cache for the user's cart items
        if (removed) {
            invalidateCartCacheByCart(cartId);
        }

        return removed;
    }

    public boolean updateCartItemQuantity(int cartId, int quantity) throws SQLException {
        // Update item quantity in the cart repository
        boolean updated = cartRepository.updateCartItemQuantity(cartId, quantity);

        // Invalidate cache for the user's cart items
        if (updated) {
            invalidateCartCacheByCart(cartId);
        }

        return updated;
    }

    private void invalidateCartCacheByCart(int cartId) {
        // Invalidate cache based on cart ID
        cartCache.asMap().forEach((userId, cartItems) -> {
            cartItems.removeIf(item -> item.getCartId() == cartId);
        });
    }
}