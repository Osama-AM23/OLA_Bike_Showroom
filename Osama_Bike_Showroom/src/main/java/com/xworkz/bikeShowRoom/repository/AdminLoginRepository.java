package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.AdminLoginEntity;

public interface AdminLoginRepository {

    AdminLoginEntity getAdminEmail(String email);
}
