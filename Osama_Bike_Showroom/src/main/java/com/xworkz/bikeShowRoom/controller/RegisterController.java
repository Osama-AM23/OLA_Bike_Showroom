package com.xworkz.bikeShowRoom.controller;

import com.xworkz.bikeShowRoom.constants.UserRegisterScheduleConstants;
import com.xworkz.bikeShowRoom.dto.RegisterDto;
import com.xworkz.bikeShowRoom.dto.ShowRoomInfoDto;
import com.xworkz.bikeShowRoom.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/")
public class RegisterController {

    @Autowired
    RegisterService userRegisterService;

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        List<UserRegisterScheduleConstants> schedule = new ArrayList<>(Arrays.asList(UserRegisterScheduleConstants.values()));
        model.addAttribute("schedule", schedule);
        List<ShowRoomInfoDto> showrooms = userRegisterService.getAllShowroom();
        model.addAttribute("showrooms", showrooms);
        return "Register";
    }

    @PostMapping("/register")
    public String onUserRegister(RegisterDto userRegisterDto, Model model) {
        boolean saved = userRegisterService.validateAndSaveUser(userRegisterDto, model);
        if (saved) {
            return "RegisterSuccess";
        }
        List<UserRegisterScheduleConstants> schedule = new ArrayList<>(Arrays.asList(UserRegisterScheduleConstants.values()));
        model.addAttribute("schedule", schedule);
        List<ShowRoomInfoDto> showrooms = userRegisterService.getAllShowroom();
        model.addAttribute("showrooms", showrooms);
        model.addAttribute("user", userRegisterDto);
        return "Register";
    }

}
