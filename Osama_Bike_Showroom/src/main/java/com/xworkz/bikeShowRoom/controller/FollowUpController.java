package com.xworkz.bikeShowRoom.controller;

import com.xworkz.bikeShowRoom.constants.RegisterScheduleDayConstants;
import com.xworkz.bikeShowRoom.dto.RegisterDto;
import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import com.xworkz.bikeShowRoom.entity.ViewRegisterEntity;
import com.xworkz.bikeShowRoom.service.FollowUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/")
public class FollowUpController {

    @Autowired
    FollowUpService followUpServ;


    @GetMapping("/followUp")
    public String getFollowUp(Model model) {
        List<RegisterDto> dtoList = followUpServ.getAllDetails();
        model.addAttribute("details", dtoList);

        List<RegisterScheduleDayConstants> scheduleDay = new ArrayList<>(Arrays.asList(RegisterScheduleDayConstants.values()));
        model.addAttribute("scheduleDays", scheduleDay);

        return "FollowUp";
    }

    @PostMapping("/updateReason")
    public String onUpdateReason(@RequestParam("customerName") String customerName, @RequestParam("reason") String reason, @RequestParam("scheduleDays") String scheduleDays, Model model) {

        RegisterEntity updateReason = followUpServ.updateReson(customerName, reason, scheduleDays);
        if (updateReason != null) {
            List<RegisterDto> dtoList = followUpServ.getAllDetails();
            model.addAttribute("details", dtoList);

            List<RegisterScheduleDayConstants> scheduleDay = new ArrayList<>(Arrays.asList(RegisterScheduleDayConstants.values()));
            model.addAttribute("scheduleDays", scheduleDay);

            return "FollowUp";
        }
        List<RegisterDto> dtoList = followUpServ.getAllDetails();
        model.addAttribute("details", dtoList);
        return "AdminSuccess";
    }

    @GetMapping("/viewDetails")
    public String getViewDetails(@RequestParam String customerName, Model model) {
        List<ViewRegisterEntity> regDetails = followUpServ.getAllByName(customerName);
        model.addAttribute("view", regDetails);
        return "ViewDetails";
    }
}
