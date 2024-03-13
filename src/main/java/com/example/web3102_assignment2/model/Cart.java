package com.example.web3102_assignment2.model;

public class Cart {
    int prodId;
    int prodQuantity;

    public Cart(int prodId, int prodQuantity) {
        this.prodId = prodId;
        this.prodQuantity = prodQuantity;
    }

    public int getProdId() {
        return prodId;
    }

    public void setProdId(int prodId) {
        this.prodId = prodId;
    }

    public int getProdQuantity() {
        return prodQuantity;
    }

    public void setProdQuantity(int prodQuantity) {
        this.prodQuantity = prodQuantity;
    }
}
