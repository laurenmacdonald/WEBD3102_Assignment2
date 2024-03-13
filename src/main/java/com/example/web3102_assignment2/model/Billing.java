package com.example.web3102_assignment2.model;

public class Billing {
    private int billingId;
    private Long cardNumber;
    private String expiryDate;
    private int securityCode;
    private int addressId;

    public Billing(int billingId, Long cardNumber, String expiryDate, int securityCode, int addressId) {
        this.billingId = billingId;
        this.cardNumber = cardNumber;
        this.expiryDate = expiryDate;
        this.securityCode = securityCode;
        this.addressId = addressId;
    }

    public Billing(Long cardNumber, String expiryDate, int securityCode, int addressId) {
        this.cardNumber = cardNumber;
        this.expiryDate = expiryDate;
        this.securityCode = securityCode;
        this.addressId = addressId;
    }

    public Billing() {
    }

    public int getBillingId() {
        return billingId;
    }

    public void setBillingId(int billingId) {
        this.billingId = billingId;
    }

    public Long getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(Long cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    public int getSecurityCode() {
        return securityCode;
    }

    public void setSecurityCode(int securityCode) {
        this.securityCode = securityCode;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }
}
