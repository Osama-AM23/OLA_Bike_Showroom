package com.xworkz.bikeShowRoom.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "register_details")

@NamedQuery(name = "getCountOfName",
        query = "Select count (ue) From RegisterEntity ue Where ue.customerName = :customerName")

@NamedQuery(name = "getCountOfContact",
        query = "Select Count (ue) From RegisterEntity ue Where ue.contactNo = :contactNo")

@NamedQuery(name = "getCountOfEmail",
        query = "Select Count (ue) from RegisterEntity ue Where ue.email = :email")

@NamedQuery(name = "getCountOfLicense",
        query = "Select Count (ue) from RegisterEntity ue Where ue.drivingLicense = :drivingLicense")

@NamedQuery(name = "getAllData",
        query = "Select re From RegisterEntity re")

@NamedQuery(name = "updateReasonByName",
        query = "Update RegisterEntity re Set re.reason= :reason, re.scheduleDate= :scheduleDate, re.scheduleTime= :scheduleTime Where re.customerName= :customerName")

@NamedQuery(name = "getEmailAndPassword",
        query = "Select re from RegisterEntity re where re.email = :email")

@NamedQuery(name = "getDataForUpdate",
        query = "Select re From RegisterEntity re where re.email = :email")

@NamedQuery(name = "updateNewPassword",
        query = "Update RegisterEntity re set re.password = :password , re.loginCount= 0 where re.email = :email")

@NamedQuery(name = "updateUserProfile",
        query = "Update RegisterEntity re Set re.customerName = :customerName, re.age = :age, re.contactNo = :contactNo, re.address = :address, re.drivingLicense = :drivingLicense, re.userImg = :userImg Where re.email = :email")

@NamedQuery(name = "updateUserSchedule",
        query = "Update RegisterEntity re Set re.schedule = :schedule, re.showroomNames = :showroomNames, re.bikeNames = :bikeNames, re.scheduleDays = :scheduleDays, re.scheduleDate = :scheduleDate, re.scheduleTime = :scheduleTime Where re.email = :email")
public class RegisterEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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

    private Integer loginCount = -1;

    private LocalDateTime lockTime;

    private String userImg;
}
