package com.xworkz.bikeShowRoom.dto;

import lombok.AllArgsConstructor;
import lombok.Data;


@AllArgsConstructor
public class ShowRoomInfoDto {

    private String name;

    private String address;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
