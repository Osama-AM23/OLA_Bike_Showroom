package com.xworkz.bikeShowRoom.dto;

import lombok.Data;

import java.util.List;

@Data
public class AddBikeDetailsDto {

    private String bikeName;

    private String year;

    private String bikeRange;

    private String motorPower;

    private String price;

    private String address;

    private String imgPaths;

}
