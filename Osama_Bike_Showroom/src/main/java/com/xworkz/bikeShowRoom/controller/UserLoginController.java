package com.xworkz.bikeShowRoom.controller;

import com.xworkz.bikeShowRoom.dto.RegisterDto;
import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import com.xworkz.bikeShowRoom.service.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class UserLoginController {

    @Autowired
    UserLoginService userLoginService;

    @GetMapping("/userLogin")
    public String getUserPage() {
        return "UserLogin";
    }

    @PostMapping("/userLogin")
    public String onUserLogin(@RequestParam String email, @RequestParam String password, Model model) {
        RegisterDto registerDto = new RegisterDto();
        RegisterEntity registerEntity = userLoginService.userlogin(email, password, model);

        if (registerEntity == null) {
            model.addAttribute("error", "Invalid Email or Password");
            return null;
        }

        if (registerEntity.getLoginCount() == 0) {
            model.addAttribute("email", email);
            return "SetUserPassword";
        }

        if (registerEntity.getLoginCount() >= 3) {
            return "UserLogin";
        }

        return "UserLogin";
    }
}
