package com.xworkz.bikeShowRoom.restController;

import com.xworkz.bikeShowRoom.service.AddBikeDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class AddBikeDetailsRestController {
    @Autowired
    AddBikeDetailsService bikeDetailsService;

    @GetMapping(value = "/bikeName/{bikeName}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onBikename(@PathVariable String bikeName) {
        long isCount = bikeDetailsService.getCountOfBikeName(bikeName);
        if (isCount == 0) {
            return "";
        }
        return "Bike Name is Already Exist";
    }

    @GetMapping(value = "/price/{price}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onPrice(@PathVariable String price) {
        return "";
    }
}
