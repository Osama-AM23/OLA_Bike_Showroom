package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.RegisterDto;
import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import org.springframework.ui.Model;

import java.time.LocalDateTime;

public interface UserPortalService {

    RegisterEntity userlogin(String email, String password, Model model);

    boolean lockTiming(LocalDateTime lockTime);

    boolean setPasswordUpdate(String email, String password, String confirmPassword);

    RegisterDto getDataForUpdate(String email);

    boolean updateUserProfile(RegisterDto registerDto);

    boolean updateUserSchedule(RegisterDto registerDto);
}
