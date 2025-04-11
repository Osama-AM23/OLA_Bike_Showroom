package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.AddBikeDetailsDto;
import com.xworkz.bikeShowRoom.entity.AddBikeDetailsEntity;
import com.xworkz.bikeShowRoom.repository.AddBikeDetailsRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


@Service
public class AddBikeDetailsServiceImpl implements AddBikeDetailsService {

    @Autowired
    AddBikeDetailsRepository addBikeDetailsRepository;
    AddBikeDetailsEntity bikeDetailsEntity = new AddBikeDetailsEntity();

    @Override
    public boolean validateAndSave(AddBikeDetailsDto addBikeDetailsDto, Model model) {
        boolean isValid = true;
        if (addBikeDetailsDto != null) {

            if (addBikeDetailsDto.getBikeName() != null && addBikeDetailsDto.getBikeName().matches("^[A-Za-z ]{4}[A-Za-z0-9+ ]{0,30}$")) {
                bikeDetailsEntity.setBikeName(addBikeDetailsDto.getBikeName());
            } else {
                model.addAttribute("nameError", "Invalid Bike Name!");
                isValid = false;
            }

            if (addBikeDetailsDto.getYear() != null && addBikeDetailsDto.getYear().matches("^(19|20)\\d{2}$")) {
                bikeDetailsEntity.setYear(addBikeDetailsDto.getYear());
            } else {
                model.addAttribute("yearError", "Invalid Year! Give proper Year");
                isValid = false;
            }

            if (addBikeDetailsDto.getBikeRange() != null && addBikeDetailsDto.getBikeRange().matches("^(7[6-9]|[89][0-9]|1[0-9]{2}|20[0-9])\\s?KM$")) {
                bikeDetailsEntity.setBikeRange(addBikeDetailsDto.getBikeRange());
            } else {
                model.addAttribute("rangeError", "Invalid Range! Give Between(76-209)");
                isValid = false;
            }

            if (addBikeDetailsDto.getMotorPower() != null) {

                if (addBikeDetailsDto.getMotorPower().matches("^\\d{4}$")) {
                    int num = Integer.parseInt(addBikeDetailsDto.getMotorPower());
                    if (num >= 2900 && num <= 9299) {
                        bikeDetailsEntity.setMotorPower(addBikeDetailsDto.getMotorPower());
                    } else {
                        model.addAttribute("motorPowerError", "Invalid Motor Power! Must be between 2900 and 9299.");
                        isValid = false;
                    }
                } else if (addBikeDetailsDto.getMotorPower().matches("^[A-Za-z0-9 ]{4,30}$")) {
                    bikeDetailsEntity.setMotorPower(addBikeDetailsDto.getMotorPower());
                } else {
                    model.addAttribute("motorPowerError", "Invalid Motor Power! Must be 4-digit number or text (A-Z a-z 0-9, 4-30 chars)");
                    isValid = false;
                }
            } else {
                model.addAttribute("motorPowerError", "Motor Power is required!");
                isValid = false;
            }

            if (addBikeDetailsDto.getPrice() != null && addBikeDetailsDto.getPrice().matches("\\d+(\\.\\d+)?")) {
                bikeDetailsEntity.setPrice(addBikeDetailsDto.getPrice());
            } else {
                model.addAttribute("priceError", "Invalid Price! Contain only Numbers");
                isValid = false;
            }

            if (isValid) {
                BeanUtils.copyProperties(addBikeDetailsDto, bikeDetailsEntity);
                bikeDetailsEntity.setImgPaths(addBikeDetailsDto.getImgPaths());
                return addBikeDetailsRepository.save(bikeDetailsEntity);
            }
        }
        return false;
    }

    @Override
    public long getCountOfBikeName(String bikeName) {
        return addBikeDetailsRepository.getCountOfBikeName(bikeName);
    }
}
