package com.example.ss10_jstl_jsp.model;

public class Customer {
    private String name;
    private String birthDate;
    private String address;

    public Customer(String name, String birthDate, String address) {
        this.name = name;
        this.birthDate = birthDate;
        this.address = address;
    }
    public String getName()      { return name; }
    public String getBirthDate() { return birthDate; }
    public String getAddress()   { return address; }
}
