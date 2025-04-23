package com.xworkz.bikeShowRoom.controller;

import com.xworkz.bikeShowRoom.dto.RegisterDto;
import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import com.xworkz.bikeShowRoom.service.UserPortalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@RequestMapping("/")
public class UserPortalController {

    @Autowired
    UserPortalService userLoginService;

    @GetMapping("/userLogin")
    public String getUserPage() {
        return "UserLogin";
    }

    @GetMapping("/userDashBoard")
    public String getDashBoard(Model model, RegisterDto registerDto) {
        model.addAttribute("email", registerDto.getEmail());
        return "UserDashBoard";
    }

    @PostMapping("/userLogin")
    public String onUserLogin(@RequestParam String email, @RequestParam String password, Model model) {
        RegisterDto registerDto = new RegisterDto();
        RegisterEntity registerEntity = userLoginService.userlogin(email, password, model);

        if (registerEntity == null) {
            model.addAttribute("error", "Invalid Email or Password");
            model.addAttribute("email", email);
            return "UserLogin";
        }

        if (registerEntity.getLoginCount() == 0) {
            model.addAttribute("email", email);
            return "UserDashBoard";
        }

        if (registerEntity.getLoginCount() == -1) {
            model.addAttribute("email", email);
            return "SetUserPassword";
        }

        if (registerEntity.getLoginCount() >= 3) {
            return "UserLogin";
        }

        return "UserLogin";
    }

    @PostMapping("/setUserPassword")
    public String setPassword(@RequestParam String email, @RequestParam String password, @RequestParam String confirmPassword) {

        if (userLoginService.setPasswordUpdate(email, password, confirmPassword)) {
            return "UserLogin";
        }
        return "SetUserPassword";
    }

    @GetMapping("/forgotPassword")
    public String getForgotPassword(String email, Model model) {
        model.addAttribute("email", email);

        return "UserForgotPassword";
    }

    @PostMapping("/forgotPassword")
    public String forgotPassword(@RequestParam String email, @RequestParam String password, @RequestParam String confirmPassword) {

        if (userLoginService.setPasswordUpdate(email, password, confirmPassword)) {
            return "UserLogin";
        }
        return "UserForgotPassword";
    }

    @GetMapping("/profileUpdate")
    public String UserProfile(@RequestParam String email, Model model) {
        RegisterDto registerDto = userLoginService.getDataForUpdate(email);
        model.addAttribute("getData", registerDto);
        return "UserProfileUpdate";
    }

    @PostMapping("/updateProfile")
    public String updateUserProfile(@RequestParam("file") MultipartFile multipartFile, RegisterDto registerDto, Model model) throws IOException {

        byte[] bytes = multipartFile.getBytes();
        Path path = Paths.get("M:\\showroom\\UserImg\\" + multipartFile.getOriginalFilename());
        Files.write(path, bytes);

        String fileName = multipartFile.getOriginalFilename().toString();
        registerDto.setUserImg(fileName);

        boolean isUpdate = userLoginService.updateUserProfile(registerDto);

        if (isUpdate) {
            model.addAttribute("email", registerDto.getEmail());
            return "UserDashBoard";
        }

        return "UserProfileUpdate";
    }


    @GetMapping("/schedule")
    public String getSchedule(@RequestParam String email, Model model) {
        return "Schedule";
    }


}
