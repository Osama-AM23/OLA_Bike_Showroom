package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.RegisterDto;
import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import com.xworkz.bikeShowRoom.repository.UserLoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class UserLoginServiceImpl implements UserLoginService {

    @Autowired
    UserLoginRepository userLoginRepo;

    private BCryptPasswordEncoder encodedPassword = new BCryptPasswordEncoder();


    @Override
    public RegisterEntity userlogin(String email, String password, Model model) {

        RegisterDto registerDto = new RegisterDto();
        RegisterEntity registerEntity = userLoginRepo.userLogin(email);

        if (registerEntity == null) {
            return null;
        }

        if (registerEntity.getLoginCount() == -1) {
            return registerEntity;
        } else if (registerEntity.getLoginCount() > 3) {
            model.addAttribute("errorMessage", "Your Account Is Locked");
            return null;
        } else if (encodedPassword.matches(password, registerEntity.getPassword())) {
            registerEntity.setLoginCount(0);
            return registerEntity;
        } else {
            int attempt = registerEntity.getLoginCount() + 1;
            registerEntity.setLoginCount(attempt);
            return null;
        }

    }
}
