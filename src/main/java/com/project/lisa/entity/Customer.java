package com.project.lisa.entity;

import lombok.Data;
import lombok.Getter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Data
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Getter
    private Integer id;
    private String name;
    private String phone_number;
    private String address;


    @Override
    public String toString() {
        return String.format(
                "Customer[id=%d, name='%s', phone_number='%s', address='%s']",
                id, name, phone_number, address);
    }
}
