package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.AddBikeDetailsEntity;
import com.xworkz.bikeShowRoom.entity.RegisterEntity;

import java.util.List;

public interface UserPortalRepository {

    RegisterEntity userLogin(String email);

    boolean updateLoginCount(RegisterEntity registerEntity);

    boolean setLockTime(String email, RegisterEntity registerEntity);

    RegisterEntity getDataForUpdate(String email);

    boolean updateNewPassword(RegisterEntity registerEntity);

    boolean updateUserProfile(RegisterEntity registerEntity);

    boolean updateUserSchedule(RegisterEntity registerEntity);

    List<AddBikeDetailsEntity> getBikesByAddress(String address);
}
