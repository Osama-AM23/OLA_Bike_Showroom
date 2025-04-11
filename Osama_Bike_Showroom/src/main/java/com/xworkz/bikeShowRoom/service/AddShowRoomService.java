package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.AddShowRoomDto;
import org.springframework.ui.Model;

public interface AddShowRoomService {

    boolean validateAndSave(AddShowRoomDto addShowRoomDto, Model model);

    long getCountByAddress(String address);

    long getCountByContact(String contact);
}
