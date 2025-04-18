package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.RegisterDto;
import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import com.xworkz.bikeShowRoom.entity.ViewRegisterEntity;

import javax.swing.text.View;
import java.util.List;

public interface FollowUpService {

    List<RegisterDto> getAllDetails();

    public RegisterEntity updateReson(String customerName, String reason, String scheduleDate, String scheduleTime);

    public List<ViewRegisterEntity> getAllByName(String customerName);
}
