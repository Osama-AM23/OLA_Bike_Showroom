package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.AdminLoginDto;

public interface AdminLoginService {

    AdminLoginDto getByEmail(String email);

    String generateOtp();

    boolean sendEmail(String email, String otp);
}
