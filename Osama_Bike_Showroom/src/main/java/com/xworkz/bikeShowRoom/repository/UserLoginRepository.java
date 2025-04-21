package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.RegisterEntity;

public interface UserLoginRepository {

    RegisterEntity userLogin(String email);
}
