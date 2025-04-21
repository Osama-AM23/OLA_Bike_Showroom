package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import org.springframework.ui.Model;

public interface UserLoginService {

    RegisterEntity userlogin(String email, String password, Model model);
}
