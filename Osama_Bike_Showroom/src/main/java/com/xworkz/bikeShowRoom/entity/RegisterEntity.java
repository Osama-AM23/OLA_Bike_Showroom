package com.xworkz.bikeShowRoom.entity;

import lombok.Data;

import javax.persistence.*;

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
        query = "Update RegisterEntity re Set re.reason= :reason Where re.customerName= :customerName")
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

    private String reason;
}
