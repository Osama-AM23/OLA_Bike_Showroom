package com.xworkz.bikeShowRoom.dto;

import lombok.Data;

@Data
public class RegisterDto {

    private Integer id;

    private String customerName;

    private String age;

    private String email;

    private String contactNo;

    private String address;

    private String drivingLicense;

    private String showroomNames;

    private String bikeNames;

    private String schedule;

    private String scheduleDays;

    private String scheduleDate;

    private String scheduleTime;

    private String reason;

    private String password;

    private Integer loginCount;
}
