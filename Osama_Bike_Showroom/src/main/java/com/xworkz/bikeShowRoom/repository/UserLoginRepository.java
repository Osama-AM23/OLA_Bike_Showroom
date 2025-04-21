package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.RegisterEntity;

public interface UserLoginRepository {

    RegisterEntity userLogin(String email);

    boolean updateLoginCount(RegisterEntity registerEntity);

    boolean setLockTime(String email, RegisterEntity registerEntity);

    RegisterEntity getDataForUpdate(String email);

    boolean updateNewPassword(RegisterEntity registerEntity);
}
