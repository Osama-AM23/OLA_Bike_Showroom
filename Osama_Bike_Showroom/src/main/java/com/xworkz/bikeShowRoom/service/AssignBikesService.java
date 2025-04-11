package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.AddShowRoomDto;
import com.xworkz.bikeShowRoom.entity.AddShowRoomEntity;

import java.util.List;

public interface AssignBikesService {

    List<AddShowRoomDto> getAll();

    AddShowRoomDto getShowroomAddress(String address);

    List<String> getAllBikes();

    boolean assignShowroomBikes(String address, List<String> bikeNames);
}
