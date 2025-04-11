package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import com.xworkz.bikeShowRoom.entity.ViewRegisterEntity;

import java.util.List;

public interface FollowUpRepository {

    List<RegisterEntity> getAllDetails();

    boolean updateReasonByName(RegisterEntity registerEntity);

    List<ViewRegisterEntity> getAllByName(String customerName);
}
