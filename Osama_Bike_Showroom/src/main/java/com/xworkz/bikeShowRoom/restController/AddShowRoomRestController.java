package com.xworkz.bikeShowRoom.restController;

import com.xworkz.bikeShowRoom.service.AddShowRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/")
public class AddShowRoomRestController {
    @Autowired
    private AddShowRoomService addShowRoomService;

    @GetMapping(value = "/address/{address}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onAddress(@PathVariable String address) {
        Long count = addShowRoomService.getCountByAddress(address);
        if (count == 0) {
            return "";
        }
        return "Showroom is Already available in this Address";
    }

    @GetMapping(value = "/contact/{contact}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onContact(@PathVariable String contact) {
        Long count = addShowRoomService.getCountByContact(contact);
        if (count == 0) {
            return "";
        }
        return "Contact is Already Exist";
    }

    @GetMapping(value = "/showroomName/{showroomName}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onShowroomName(@PathVariable String showroomName) {
        return "";
    }

    @GetMapping(value = "/city/{city}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onCity(@PathVariable String city) {
        return "";
    }
}
