package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.AddShowRoomEntity;

import java.util.List;

public interface AddShowRoomRepository {

    boolean save(AddShowRoomEntity addShowRoomEntity);

    long getCountOfAddress(String address);

    long getCountOfContact(String contact);

    List<AddShowRoomEntity> getAllShowroom();
}
