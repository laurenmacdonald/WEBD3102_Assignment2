package com.example.web3102_assignment2.model;

public class Order {
    private int orderId;
    private int customerId;
    private int orderDetailId;
    private int prodId;
    private String prodName;    // for when joining with product table to get product name.
    private int prodQuantity;
    private double totalAmount;

    // Default constructor
    public Order() {
    }

    // Constructor with all attributes
    public Order(int orderId, int customerId, int orderDetailId, int prodId, int prodQuantity, double totalAmount) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.orderDetailId = orderDetailId;
        this.prodId = prodId;
        this.prodQuantity = prodQuantity;
        this.totalAmount = totalAmount;
    }

    // Constructor for just the order table information
    public Order(int orderId, int customerId) {
        this.orderId = orderId;
        this.customerId = customerId;
    }
    public Order(int customerId){
        this.customerId = customerId;
    }

    // Constructor for just the order details table information
    public Order(int orderDetailId, int orderId,  int prodId, int prodQuantity, double totalAmount) {
        this.orderDetailId = orderDetailId;
        this.orderId = orderId;
        this.prodId = prodId;
        this.prodQuantity = prodQuantity;
        this.totalAmount = totalAmount;
    }

    public Order(int orderId, int customerId, int prodId, String prodName, int prodQuantity, double totalAmount) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.prodId = prodId;
        this.prodName = prodName;
        this.prodQuantity = prodQuantity;
        this.totalAmount = totalAmount;
    }

    // Constructor for just order details without id
    // Constructor for just the order details table information
    public Order(int orderId,  int prodId, int prodQuantity, double totalAmount) {
        this.orderId = orderId;
        this.prodId = prodId;
        this.prodQuantity = prodQuantity;
        this.totalAmount = totalAmount;
    }

    // Constructor that includes the product name
    public Order(int orderId, int customerId, int orderDetailId, int prodId, String prodName, int prodQuantity, double totalAmount) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.orderDetailId = orderDetailId;
        this.prodId = prodId;
        this.prodName = prodName;
        this.prodQuantity = prodQuantity;
        this.totalAmount = totalAmount;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
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

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }
}
