package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.AddShowRoomDto;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface AddShowRoomService {

    boolean validateAndSave(AddShowRoomDto addShowRoomDto, Model model);

    long getCountByAddress(String address);

    long getCountByContact(String contact);

    List<AddShowRoomDto> getAllShowroom();
}
