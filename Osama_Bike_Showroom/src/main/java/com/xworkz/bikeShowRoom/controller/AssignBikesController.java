package com.xworkz.bikeShowRoom.controller;

import com.xworkz.bikeShowRoom.dto.AddShowRoomDto;
import com.xworkz.bikeShowRoom.service.AssignBikesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Controller
@RequestMapping("/")
public class AssignBikesController {

    @Autowired
    AssignBikesService assignBikesService;

    @GetMapping("/getDetails")
    public String getAll(Model model) {

        List<AddShowRoomDto> dtos = assignBikesService.getAll();
        model.addAttribute("lists", dtos);
        return "GetAllDetails";
    }

    @GetMapping("/assignBikes")
    public String assignBikePage(@RequestParam("address") String address, Model model) {
        AddShowRoomDto showRoomDto = assignBikesService.getShowroomAddress(address);

        if (showRoomDto == null) {
            model.addAttribute("error", "Showroom not found!");
        } else {
            model.addAttribute("showroom", showRoomDto);
        }

        List<String> allBikes = assignBikesService.getAllBikes();
        model.addAttribute("bikeName", allBikes);

        return "AssignBikes";
    }

    @PostMapping("/assignBikes")
    public String assignBikes(@RequestParam("address") String address, @RequestParam("bikeNames") List<String> bikeNames, RedirectAttributes redirect) throws UnsupportedEncodingException {
        System.out.println("Assign bikes method is executing");
        if (bikeNames.size() > 5) {
           redirect.addFlashAttribute("error", "Only Assign up to 05 Bikes");
            redirect.addFlashAttribute("address", address);
            return "redirect:/assignBikes?address=" + URLEncoder.encode(address, String.valueOf(StandardCharsets.UTF_8));
        }
        boolean update = assignBikesService.assignShowroomBikes(address, bikeNames);

        if (update) {
            System.out.println("data enter into the controller");
            return "redirect:/getDetails";
        } else {
            redirect.addFlashAttribute("error", "Already this Bikes are Assigned");
            redirect.addFlashAttribute("address", address);
            return "redirect:/assignBikes?address=" + URLEncoder.encode(address, String.valueOf(StandardCharsets.UTF_8));
        }
    }
}
