package com.example.web3102_assignment2.model;

public class Product {
    private int prodId;
    private String prodName;
    private String prodDescription;
    private int categoryId;
    private double price;
    private int quantityAvail;
    private int avgRating;
    private String categoryName;

    // Default constructor
    public Product() {
    }

    // Constructor - includes all
    public Product(int prodId, String prodName, String prodDescription, int categoryId, double price, int quantityAvail, int avgRating, String categoryName) {
        this.prodId = prodId;
        this.prodName = prodName;
        this.prodDescription = prodDescription;
        this.categoryId = categoryId;
        this.price = price;
        this.quantityAvail = quantityAvail;
        this.avgRating = avgRating;
        this.categoryName = categoryName;
    }

    // Constructor - does not include id or rating
    public Product(String prodName, String prodDescription, int categoryId, double price, int quantityAvail, String categoryName) {
        this.prodName = prodName;
        this.prodDescription = prodDescription;
        this.categoryId = categoryId;
        this.price = price;
        this.quantityAvail = quantityAvail;
        this.categoryName = categoryName;
    }

    public int getProdId() {
        return prodId;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getProdDescription() {
        return prodDescription;
    }

    public void setProdDescription(String prodDescription) {
        this.prodDescription = prodDescription;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantityAvail() {
        return quantityAvail;
    }

    public void setQuantityAvail(int quantityAvail) {
        this.quantityAvail = quantityAvail;
    }

    public int getAvgRating() {
        return avgRating;
    }

    public void setAvgRating(int avgRating) {
        this.avgRating = avgRating;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
