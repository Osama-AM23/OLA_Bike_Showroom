package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.RegisterDto;
import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import com.xworkz.bikeShowRoom.entity.ViewRegisterEntity;
import com.xworkz.bikeShowRoom.repository.FollowUpRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class FollowUpServiceImpl implements FollowUpService {

    @Autowired
    FollowUpRepository followUpRepo;

    RegisterEntity registerEntity = new RegisterEntity();

    @Override
    public List<RegisterDto> getAllDetails() {
        List<RegisterDto> dtos = new ArrayList<>();
        List<RegisterEntity> entities = followUpRepo.getAllDetails();

        for (RegisterEntity entity : entities) {
            RegisterDto dto = new RegisterDto();
            BeanUtils.copyProperties(entity, dto);
            dtos.add(dto);
        }
        return dtos;
    }

    @Override
    public RegisterEntity updateReson(String customerName, String reason) {
        registerEntity.setCustomerName(customerName);
        registerEntity.setReason(reason);

        boolean isUpdated = followUpRepo.updateReasonByName(registerEntity);
        if (isUpdated) {
            System.out.println("Register Update");
            return registerEntity;
        } else {
            System.out.println("Register update failed");
            return null;
        }

    }

    @Override
    public List<ViewRegisterEntity> getAllByName(String customerName) {
        List<ViewRegisterEntity> viewDetails = followUpRepo.getAllByName(customerName);
        if (viewDetails != null) {
            return viewDetails;
        }
        return null;
    }
}
