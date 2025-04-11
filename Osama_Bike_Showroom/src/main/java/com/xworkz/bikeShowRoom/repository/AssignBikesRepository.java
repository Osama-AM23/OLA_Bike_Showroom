package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.dto.AddShowRoomDto;
import com.xworkz.bikeShowRoom.entity.AddShowRoomEntity;

import java.util.List;

public interface AssignBikesRepository {

    List<AddShowRoomEntity> getAll();

    AddShowRoomEntity findByShowroomAddress(String address);

    List<String> getAllBikes();

    boolean assignShowroomBikes(String address, List<String> bikeNames);
}
