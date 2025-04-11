package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.AddShowRoomEntity;
import com.xworkz.bikeShowRoom.entity.RegisterEntity;

import java.util.List;

public interface RegisterRepository {

    List<AddShowRoomEntity> getShowroomNames();

    List<String> getAssignedBikesByShowroom(String showroomName);

    boolean save(RegisterEntity userRegisterEntity);

    long getCountOfName(String customerName);

    long getCountOfContact(String contact);

    long getCountOfEmail(String email);

    long getCountOfLicense(String drivingLicense);
}
