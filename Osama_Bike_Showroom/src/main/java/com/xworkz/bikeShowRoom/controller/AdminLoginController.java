package com.xworkz.bikeShowRoom.controller;

import com.xworkz.bikeShowRoom.dto.AdminLoginDto;
import com.xworkz.bikeShowRoom.service.AdminLoginService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/")
public class AdminLoginController {
    @Autowired
    AdminLoginService adminLoginService;

    private Map<String, String> otpStorage = new HashMap<>();
    private Map<String, Long> otpTimestamps = new HashMap<>();

    @GetMapping("/adminLogin")
    public String getLogin() {
        return "AdminLogin";
    }

    @PostMapping("/adminLogin")
    public String onLogin(@RequestParam String email, Model model) {
        AdminLoginDto adminLoginDto = adminLoginService.getByEmail(email);

        if (adminLoginDto == null) {
            model.addAttribute("error", "Invalid Email! Please Try again");
            return "AdminLogin";
        }

        String sendOtp = adminLoginService.generateOtp();
        otpStorage.put(email, sendOtp);
        otpTimestamps.put(email, System.currentTimeMillis());
        log.info(sendOtp);

        boolean emailSend = adminLoginService.sendEmail(email, sendOtp);
        if (emailSend) {
            model.addAttribute("email", email);
            return "AdminLogin";
        } else {
            model.addAttribute("error", "Error sending OTP! Try again");
            return "AdminLogin";
        }
    }


    @PostMapping("/verifyOtp")
    public String verifyOtp(@RequestParam String email, @RequestParam String otp, Model model, HttpSession session) {
        String storedOtp = otpStorage.get(email);
        Long storedTimestamp = otpTimestamps.get(email);

        if (storedOtp == null || storedTimestamp == null) {
            model.addAttribute("email", email);
            model.addAttribute("error", "OTP Cannot be Empty!");
            return "AdminLogin";
        }

        long currentTime = System.currentTimeMillis();

        if (currentTime - storedTimestamp > 120000) {
            otpStorage.remove(email);
            otpTimestamps.remove(email);
            model.addAttribute("email", email);
            model.addAttribute("error", "OTP expired! Request a new one.");
            return "AdminLogin";
        }

        if (storedOtp.equals(otp)) {
            otpStorage.remove(email);
            otpTimestamps.remove(email);
            session.setAttribute("email", email);
            return "AdminSuccess";
        } else {

            model.addAttribute("email", email);
            model.addAttribute("error", "Incorrect OTP! Try again.");
            return "AdminLogin";
        }
    }


    @PostMapping("/resendOtp")
    public String resendOtp(@RequestParam String email, Model model) {
        String newOtp = adminLoginService.generateOtp();
        otpStorage.put(email, newOtp);
        otpTimestamps.put(email, System.currentTimeMillis());

        boolean emailSent = adminLoginService.sendEmail(email, newOtp);
        log.info(newOtp);
        if (emailSent) {
            model.addAttribute("email", email);
            return "AdminLogin";
        } else {
            model.addAttribute("error", "Error resending OTP. Try again");
            return "AdminLogin";
        }
    }
}
