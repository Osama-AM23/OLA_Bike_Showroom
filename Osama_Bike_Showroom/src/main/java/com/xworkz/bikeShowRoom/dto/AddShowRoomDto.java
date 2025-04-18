package com.xworkz.bikeShowRoom.dto;

import lombok.Data;

@Data
public class AddShowRoomDto {

    private Integer id;

    private String showroomName;

    private String address;

    private String city;

    private String contact;

    private String imgPath;

    private String assignedBikes;
}
