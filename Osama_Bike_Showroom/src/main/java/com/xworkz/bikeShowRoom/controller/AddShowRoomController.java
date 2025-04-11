package com.xworkz.bikeShowRoom.controller;

import com.xworkz.bikeShowRoom.dto.AddShowRoomDto;
import com.xworkz.bikeShowRoom.service.AddShowRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/")
public class AddShowRoomController {
    @Autowired
    AddShowRoomService addShowRoomService;

    @GetMapping("/addShowRoom")
    public String getAddShowroom(Model model) {

        return "AddShowRoom";
    }

    @PostMapping("/addShowRoom")
    public String onAddShowroom(AddShowRoomDto addShowRoomDto, Model model) {
        boolean saved = addShowRoomService.validateAndSave(addShowRoomDto, model);
        if (saved) {
            return "AddShowRoomSuccess";
        }

        return "AddShowRoom";
    }
}
