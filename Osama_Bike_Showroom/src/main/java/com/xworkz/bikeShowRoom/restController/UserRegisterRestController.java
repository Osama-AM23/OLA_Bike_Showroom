package com.xworkz.bikeShowRoom.restController;

import com.xworkz.bikeShowRoom.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/")
public class UserRegisterRestController {
    @Autowired
    RegisterService userRegisterService;

    @GetMapping(value = "/getBikes", produces = "application/json")
    @ResponseBody
    public List<String> getBikesForShowroom(@RequestParam String showroomName) {
        System.out.println("REST CONTROLLER :: " + showroomName);
        return userRegisterService.getBikesByShowroom(showroomName);
    }

    @GetMapping(value = "/customerName/{customerName}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onName(@PathVariable String customerName) {
        long count = userRegisterService.getCountOfName(customerName);
        if (count == 0) {
            return "";
        } else {
            return "User Name Is Already Exist";
        }
    }

    @GetMapping(value = "/contactNo/{contactNo}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onContact(@PathVariable String contactNo) {
        long count = userRegisterService.getCountOfContact(contactNo);
        if (count == 0) {
            return "";
        } else {
            return "Contact No Is Already Exist";
        }
    }

    @GetMapping(value = "/email/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onEmail(@PathVariable String email) {
        long count = userRegisterService.getCountOfEmail(email);
        if (count == 0) {
            return "";
        } else {
            return "Email Id Is Already Exist";
        }
    }

    @GetMapping(value = "/drivingLicense/{drivingLicense}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onLicense(@PathVariable String drivingLicense) {
        long count = userRegisterService.getCountOfLicense(drivingLicense);
        if (count == 0) {
            return "";
        } else {
            return "Driving License No Is Already Exist";
        }
    }


}
