package com.example.web3102_assignment2.model;

import java.sql.Date;

public class Delivery {
    private int deliveryId;
    private int orderId;
    private int deliveryAgentId;
    private String deliveryStatus;
    private Date deliveryDate;
    private String firstName;
    private String lastName;
    private String phoneNumber;


    // Default constructor
    public Delivery() {
    }

    // Constructor for all attributes
    public Delivery(int deliveryId, int orderId, int deliveryAgentId, String deliveryStatus, Date deliveryDate) {
        this.deliveryId = deliveryId;
        this.orderId = orderId;
        this.deliveryAgentId = deliveryAgentId;
        this.deliveryStatus = deliveryStatus;
        this.deliveryDate = deliveryDate;
    }

    // Constructor for insert
    public Delivery(int orderId, int deliveryAgentId) {
        this.orderId = orderId;
        this.deliveryAgentId = deliveryAgentId;
    }

    // Constructor with delivery agent information
    public Delivery(int orderId, String deliveryStatus, Date deliveryDate, String firstName, String lastName, String phoneNumber) {
        this.orderId = orderId;
        this.deliveryStatus = deliveryStatus;
        this.deliveryDate = deliveryDate;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
    }

    public int getDeliveryId() {
        return deliveryId;
    }

    public void setDeliveryId(int deliveryId) {
        this.deliveryId = deliveryId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getDeliveryAgentId() {
        return deliveryAgentId;
    }

    public void setDeliveryAgentId(int deliveryAgentId) {
        this.deliveryAgentId = deliveryAgentId;
    }

    public String getDeliveryStatus() {
        return deliveryStatus;
    }

    public void setDeliveryStatus(String deliveryStatus) {
        this.deliveryStatus = deliveryStatus;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
