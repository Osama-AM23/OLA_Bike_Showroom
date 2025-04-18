package com.xworkz.bikeShowRoom.dto;

import lombok.Data;

@Data
public class ViewRegisterDto {

    private int id;

    private String customerName;

    private String reScheduledDate;

    private String reScheduledTime;

    private String reason;
}
