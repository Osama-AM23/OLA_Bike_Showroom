package com.xworkz.bikeShowRoom.controller;

import com.xworkz.bikeShowRoom.dto.AddBikeDetailsDto;
import com.xworkz.bikeShowRoom.service.BikesInformationService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

@Controller
@RequestMapping("/")
public class BikesInformationController {

    @Autowired
    BikesInformationService bikesInfoService;

    @GetMapping("/bikesInformation")
    public String getBikesInfo(Model model) {
        List<AddBikeDetailsDto> lists = bikesInfoService.getAllDetails();
        model.addAttribute("info", lists);
        return "BikesInformation";
    }

    @GetMapping("/imageDisplay")
    public void imageDisplay(@RequestParam String imgPaths, HttpServletResponse servletResponse) throws IOException {
        servletResponse.setContentType("image/jpg");
        File file = new File("M:\\showroom\\bikes\\" + imgPaths);
        InputStream input = new BufferedInputStream(new FileInputStream(file));
        ServletOutputStream outputStream = servletResponse.getOutputStream();
        IOUtils.copy(input, outputStream);
        servletResponse.flushBuffer();
    }
}
