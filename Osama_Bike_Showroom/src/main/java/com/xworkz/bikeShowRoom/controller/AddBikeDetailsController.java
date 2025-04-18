package com.xworkz.bikeShowRoom.controller;

import com.xworkz.bikeShowRoom.dto.AddBikeDetailsDto;
import com.xworkz.bikeShowRoom.service.AddBikeDetailsService;
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
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class AddBikeDetailsController {

    @Autowired
    private AddBikeDetailsService addBikeDetailsService;

    @GetMapping("/addBikeDetails")
    public String getBikeDetails(Model model) {

        return "AddBikeDetails";
    }

    @PostMapping("/addBikeDetails")
    public String onBikeDetails(@RequestParam("files") MultipartFile[] multipartFile, AddBikeDetailsDto addBikeDetailsDto, Model model) throws IOException {

        if (multipartFile == null || multipartFile.length == 0) {
            model.addAttribute("fileError", "Please upload images");

            return "AddBikeDetails";
        }

        if (multipartFile.length > 5) {
            model.addAttribute("fileError", "You can upload max of 05 Images");

            return "AddBikeDetails";
        }

        String directoryPath = "M:\\showroom\\bikes\\";
        Path directory = Paths.get(directoryPath);

        if (!Files.exists(directory)) {
            Files.createDirectories(directory);
        }

        List<String> filePaths = new ArrayList<>();

        for (MultipartFile file : multipartFile) {
            if (!file.isEmpty()) {
                String fileName = file.getOriginalFilename();
                Path filePath = directory.resolve(fileName);
                Files.write(filePath, file.getBytes());
                filePaths.add(fileName);
            }
        }

        addBikeDetailsDto.setImgPaths(String.join(",", filePaths));

        boolean saved = addBikeDetailsService.validateAndSave(addBikeDetailsDto, model);
        if (saved) {
            model.addAttribute("img", addBikeDetailsDto.getImgPaths());
            return "AddBikeDetailsSuccess";
        }
        return "AddBikeDetails";
    }
}
