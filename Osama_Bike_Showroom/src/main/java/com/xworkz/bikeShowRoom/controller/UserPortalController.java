package com.xworkz.bikeShowRoom.controller;

import com.xworkz.bikeShowRoom.constants.RegisterScheduleConstants;
import com.xworkz.bikeShowRoom.constants.RegisterScheduleDayConstants;
import com.xworkz.bikeShowRoom.dto.AddBikeDetailsDto;
import com.xworkz.bikeShowRoom.dto.AddShowRoomDto;
import com.xworkz.bikeShowRoom.dto.RegisterDto;
import com.xworkz.bikeShowRoom.dto.ShowRoomInfoDto;
import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import com.xworkz.bikeShowRoom.service.AddShowRoomService;
import com.xworkz.bikeShowRoom.service.RegisterService;
import com.xworkz.bikeShowRoom.service.UserPortalService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

@Slf4j
@Controller
@RequestMapping("/")
public class UserPortalController {

    @Autowired
    UserPortalService userPortalService;

    @Autowired
    AddShowRoomService addShowRoomService;

    @Autowired
    RegisterService registerService;

    @GetMapping("/userLogin")
    public String getUserPage() {
        return "UserLogin";
    }

    @GetMapping("/userDashBoard")
    public String getDashBoard(@RequestParam String email, Model model) {
        model.addAttribute("email", email);
        return "UserDashBoard";
    }

    @PostMapping("/userLogin")
    public String onUserLogin(@RequestParam String email, @RequestParam String password, Model model) {
        RegisterDto registerDto = new RegisterDto();
        RegisterEntity registerEntity = userPortalService.userlogin(email, password, model);

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

        if (userPortalService.setPasswordUpdate(email, password, confirmPassword)) {
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

        if (userPortalService.setPasswordUpdate(email, password, confirmPassword)) {
            return "UserLogin";
        }
        return "UserForgotPassword";
    }

    @GetMapping("/profileUpdate")
    public String UserProfile(@RequestParam String email, Model model) {
        RegisterDto registerDto = userPortalService.getDataForUpdate(email);
        model.addAttribute("getData", registerDto);
        model.addAttribute("email", registerDto.getEmail());
        return "UserProfileUpdate";
    }

    @PostMapping("/updateProfile")
    public String updateUserProfile(@RequestParam("file") MultipartFile multipartFile, RegisterDto registerDto, Model model) throws IOException {

        byte[] bytes = multipartFile.getBytes();
        Path path = Paths.get("M:\\showroom\\UserImg\\" + multipartFile.getOriginalFilename());
        Files.write(path, bytes);

        String fileName = multipartFile.getOriginalFilename().toString();
        registerDto.setUserImg(fileName);

        boolean isUpdate = userPortalService.updateUserProfile(registerDto);

        if (isUpdate) {
            model.addAttribute("email", registerDto.getEmail());
            return "UserDashBoard";
        }

        return "UserProfileUpdate";
    }


    @GetMapping("/schedule")
    public String getSchedule(@RequestParam String email, Model model) {

        List<RegisterScheduleConstants> schedule = new ArrayList<>(Arrays.asList(RegisterScheduleConstants.values()));
        model.addAttribute("schedule", schedule);

        List<RegisterScheduleDayConstants> scheduleDay = new ArrayList<>(Arrays.asList(RegisterScheduleDayConstants.values()));
        model.addAttribute("scheduleDays", scheduleDay);

        List<ShowRoomInfoDto> showrooms = registerService.getAllShowroom();
        model.addAttribute("showrooms", showrooms);

        RegisterDto registerDto = userPortalService.getDataForUpdate(email);
        model.addAttribute("sdul", registerDto);

        model.addAttribute("email", registerDto.getEmail());
        return "Schedule";
    }

    @PostMapping("/scheduleUpdate")
    public String onScheduleUpdate(RegisterDto registerDto, Model model) {

        boolean isUpdate = userPortalService.updateUserSchedule(registerDto);

        if (isUpdate) {
            log.info(":: Schedule Updated from Controller ::");
            model.addAttribute("email", registerDto.getEmail());
            return "UserDashBoard";
        }
        return "Schedule";
    }

    @GetMapping("/exploreBikes")
    public String exploreBikes(@RequestParam String email, Model model, AddShowRoomDto addShowRoomDto, RegisterDto registerDto) {
        List<AddShowRoomDto> lists = addShowRoomService.getAllShowroom();
        model.addAttribute("img", addShowRoomDto.getImgPath());
        model.addAttribute("info", lists);

        model.addAttribute("email", email);
        return "ExploreBikes";
    }

    @GetMapping("/showroomDisplay")
    public void getImage(@RequestParam String imgPath, HttpServletResponse servletResponse) throws IOException {
        servletResponse.setContentType("image/jpg");
        File file = new File("M:\\showroom\\showroomImages" + imgPath);
        if (file.exists()) {
            try (InputStream input = new BufferedInputStream(new FileInputStream(file));
                 ServletOutputStream outputStream = servletResponse.getOutputStream()) {
                IOUtils.copy(input, outputStream);
                servletResponse.flushBuffer();
            }
        } else {
            servletResponse.setStatus(HttpServletResponse.SC_NOT_FOUND);
            servletResponse.getWriter().write("Image not found");
        }
    }

    @GetMapping("/showroomBikes")
    public String getShowroomBikes(@RequestParam("address") String address,@RequestParam("email") String email, Model model) {
        List<AddBikeDetailsDto> bikesByAddress = userPortalService.getBikesByAddress(address);
        model.addAttribute("bikes", bikesByAddress);
        model.addAttribute("email", email);
        return "ShowroomBikes";
    }

    @GetMapping("/bikesDisplay")
    public void imageDisplay(@RequestParam String imgPaths, HttpServletResponse servletResponse) throws IOException {
        servletResponse.setContentType("image/jpg");
        File file = new File("M:\\showroom\\bikes\\" + imgPaths);
        InputStream input = new BufferedInputStream(new FileInputStream(file));
        ServletOutputStream outputStream = servletResponse.getOutputStream();
        IOUtils.copy(input, outputStream);
        servletResponse.flushBuffer();
    }

}
