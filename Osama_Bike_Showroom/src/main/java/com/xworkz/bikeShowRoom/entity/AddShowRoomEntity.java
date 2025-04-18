package com.xworkz.bikeShowRoom.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "showroom_details")

@NamedQuery(name = "getAddressCount",
        query = "Select Count (se) From AddShowRoomEntity se Where se.address = : address")

@NamedQuery(name = "getContactCount",
        query = "Select Count (se) From AddShowRoomEntity se Where se.contact = : contact")

@NamedQuery(name = "getAllForAssign",
        query = "Select se From AddShowRoomEntity se")

@NamedQuery(name = "findShowroomAddress",
        query = "Select se From AddShowRoomEntity se Where se.address = : address")

@NamedQuery(name = "getAllShowroom",
        query = "Select se from AddShowRoomEntity se")

@NamedQuery(name = "getBikesByShowroom",
        query = "Select se.assignedBikes From AddShowRoomEntity se Where se.showroomName = :showroomName")

@NamedQuery(name = "getShowrooms",
        query = "Select se from AddShowRoomEntity se")
public class AddShowRoomEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String showroomName;

    private String address;

    private String city;

    private String contact;

    private String imgPath;

    private String assignedBikes;
}
