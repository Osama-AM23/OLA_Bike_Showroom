package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.RegisterDto;
import com.xworkz.bikeShowRoom.dto.ShowRoomInfoDto;
import org.springframework.ui.Model;

import java.util.List;

public interface RegisterService {

    List<ShowRoomInfoDto> getAllShowroom();

    List<String> getBikesByShowroom(String showroomName);

    boolean validateAndSaveUser(RegisterDto userRegisterDto, Model model);

    boolean sendEmail(String email, String password);

    long getCountOfName(String name);

    long getCountOfContact(String contactNo);

    long getCountOfEmail(String email);

    long getCountOfLicense(String drivingLicense);
}
