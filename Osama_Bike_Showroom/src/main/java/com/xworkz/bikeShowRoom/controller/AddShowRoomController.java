package com.xworkz.bikeShowRoom.controller;

import com.xworkz.bikeShowRoom.dto.AddShowRoomDto;
import com.xworkz.bikeShowRoom.service.AddShowRoomService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
    public String onAddShowroom(@RequestParam("file") MultipartFile multipartFile, AddShowRoomDto addShowRoomDto, Model model) throws IOException {

        byte[] bytes = multipartFile.getBytes();
        Path path = Paths.get("M:\\showroom\\showroomImages" + multipartFile.getOriginalFilename());
        Files.write(path, bytes);

        String fileName = multipartFile.getOriginalFilename().toString();
        addShowRoomDto.setImgPath(fileName);

        boolean saved = addShowRoomService.validateAndSave(addShowRoomDto, model);
        if (saved) {
            model.addAttribute("img", addShowRoomDto.getImgPath());
            return "AddShowRoomSuccess";
        }

        return "AddShowRoom";
    }

    @GetMapping("/getShowroom")
    public String getBikeInfo(Model model, AddShowRoomDto addShowRoomDto) {
        List<AddShowRoomDto> lists = addShowRoomService.getAllShowroom();
        model.addAttribute("display", lists);
        model.addAttribute("img", addShowRoomDto.getImgPath());
        return "ShowroomInformation";
    }

    @GetMapping("/display")
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
}
