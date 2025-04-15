package com.xworkz.bikeShowRoom.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Entity
@Table(name = "view_register_details")
@Data

@NamedQuery(name = "getAllByName",
        query = "Select vr From ViewRegisterEntity vr Where vr.customerName = :customerName")
public class ViewRegisterEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String customerName;

    private String reason;

    private String reScheduledDay;

    private String updatedTiming;

}
