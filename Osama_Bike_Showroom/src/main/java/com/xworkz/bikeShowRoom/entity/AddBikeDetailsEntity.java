package com.xworkz.bikeShowRoom.entity;

import lombok.Data;

import javax.persistence.*;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

@Data
@Entity
@Table(name = "bike_details")

@NamedQuery(name = "getAllBikes",
        query = "Select se.bikeName From AddBikeDetailsEntity se")

@NamedQuery(name = "getCountOfBikeName",
        query = "Select Count (ade) From AddBikeDetailsEntity ade Where ade.bikeName = :bikeName")

@NamedQuery(name = "getAllDetails",
        query = "Select ade From AddBikeDetailsEntity ade")
public class AddBikeDetailsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String bikeName;

    private String year;

    private String bikeRange;

    private String motorPower;

    private String price;

    private String imgPaths;

}
