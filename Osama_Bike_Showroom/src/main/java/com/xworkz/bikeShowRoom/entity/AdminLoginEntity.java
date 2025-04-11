package com.xworkz.bikeShowRoom.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "showroom_admin")

@NamedQuery(name = "getByEmail",
        query = "Select ae From AdminLoginEntity ae where ae.email = :email")
public class AdminLoginEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String email;
}
