package com.pgm.board.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class OrderVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ono")
    private Long id;

    private String coffeeImage;
    private String taste;
    private String blend;

    private int amount;
    private int price;
    private int fee;
    private int total;

    private String userid;
    private String address;
    private String status;
    private Long coffeeid;
}
