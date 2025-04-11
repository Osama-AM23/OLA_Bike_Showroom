package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.RegisterDto;
import com.xworkz.bikeShowRoom.dto.ShowRoomInfoDto;
import com.xworkz.bikeShowRoom.entity.AddShowRoomEntity;
import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import com.xworkz.bikeShowRoom.repository.RegisterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    RegisterRepository userRegRepo;

    @Override
    public List<ShowRoomInfoDto> getAllShowroom() {
        List<AddShowRoomEntity> showrooms = userRegRepo.getShowroomNames();
        Set<ShowRoomInfoDto> info = new HashSet<>();

        for (AddShowRoomEntity showroom : showrooms) {
            info.add(new ShowRoomInfoDto(showroom.getShowroomName(), showroom.getAddress()));
        }
        return new ArrayList<>(info);
    }

    @Override
    public List<String> getBikesByShowroom(String showroomName) {
        System.out.println("SERVICE LAYER :: " + showroomName);
        return userRegRepo.getAssignedBikesByShowroom(showroomName);
    }

    @Override
    public boolean validateAndSaveUser(RegisterDto userRegisterDto, Model model) {

        boolean validation = true;

        if (userRegisterDto != null) {
            RegisterEntity userEntity = new RegisterEntity();
            userEntity.setCustomerName(userRegisterDto.getCustomerName());
            userEntity.setAge(userRegisterDto.getAge());
            userEntity.setContactNo(userRegisterDto.getContactNo());
            userEntity.setEmail(userRegisterDto.getEmail());
            userEntity.setAddress(userRegisterDto.getAddress());
            userEntity.setDrivingLicense(userRegisterDto.getDrivingLicense());
            userEntity.setSchedule(userRegisterDto.getSchedule());
            userEntity.setBikeNames(userRegisterDto.getBikeNames());
            userEntity.setShowroomNames(userRegisterDto.getShowroomNames());

            if (userRegisterDto.getCustomerName() != null && userRegisterDto.getCustomerName().length() >= 4 && userRegisterDto.getCustomerName().length() <= 30 && userRegisterDto.getCustomerName().matches("^[A-Za-z.\\s]+$")) {
                userEntity.setCustomerName(userRegisterDto.getCustomerName());
            } else {
                validation = false;
                model.addAttribute("nameError", "Invalid User Name! give proper User Name It contains only Character, and Minimum 5 character");
            }

            if (userRegisterDto.getAge() != null && userRegisterDto.getAge().matches("^(1[89]|[2-9][0-9])$")) {
                userEntity.setAge(userRegisterDto.getAge());
            } else {
                validation = false;
                model.addAttribute("ageError", "Invalid Age! Age must be Above 18");
            }

            if (userRegisterDto.getContactNo() != null && userRegisterDto.getContactNo().length() == 10 && userRegisterDto.getContactNo().matches("^[9876]\\d{9}$")) {
                userEntity.setContactNo(userRegisterDto.getContactNo());
            } else {
                validation = false;
                model.addAttribute("contactError", "Invalid Contact! Give Proper Contact & It's Must be 10 Digits");
            }

            if (userRegisterDto.getEmail() != null && userRegisterDto.getEmail().contains("@gmail.com") && userRegisterDto.getEmail().matches("^[a-z0-9.]+@gmail\\.com$")) {
                userEntity.setEmail(userRegisterDto.getEmail());
            } else {
                validation = false;
                model.addAttribute("emailError", "Invalid Email! Give Proper Email");
            }

            if (userRegisterDto.getAddress() != null && userRegisterDto.getAddress().length() >= 6 && userRegisterDto.getAddress().length() <= 100 && userRegisterDto.getAddress().matches("^[A-Za-z0-9,_. ]+$")) {
                userEntity.setAddress(userRegisterDto.getAddress());
            } else {
                validation = false;
                model.addAttribute("addressError", "Invalid Address! Give proper Address");
            }

            if (userRegisterDto.getDrivingLicense() != null && userRegisterDto.getDrivingLicense().matches("^[A-Z0-9]{15}$")) {
                userEntity.setDrivingLicense(userRegisterDto.getDrivingLicense());
            } else {
                validation = false;
                model.addAttribute("licenseError", "Invalid Driving License! Once Check your License No");
            }

            if (validation) {
                boolean saved = userRegRepo.save(userEntity);
                return saved;
            }
        }
        return false;
    }

    @Override
    public long getCountOfName(String name) {
        return userRegRepo.getCountOfName(name);
    }

    @Override
    public long getCountOfContact(String contactNo) {
        return userRegRepo.getCountOfContact(contactNo);
    }

    @Override
    public long getCountOfEmail(String email) {
        return userRegRepo.getCountOfEmail(email);
    }

    @Override
    public long getCountOfLicense(String drivingLicense) {
        return userRegRepo.getCountOfLicense(drivingLicense);
    }
}
