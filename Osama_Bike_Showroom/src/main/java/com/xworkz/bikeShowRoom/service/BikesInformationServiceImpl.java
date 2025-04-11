package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.AddBikeDetailsDto;
import com.xworkz.bikeShowRoom.entity.AddBikeDetailsEntity;
import com.xworkz.bikeShowRoom.repository.BikesInformationRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class BikesInformationServiceImpl implements BikesInformationService {

    @Autowired
    BikesInformationRepository bikesInformationRepository;

    @Override
    public List<AddBikeDetailsDto> getAllDetails() {
        List<AddBikeDetailsDto> dtos = new ArrayList<>();
        List<AddBikeDetailsEntity> entities = bikesInformationRepository.getAllDetails();

        for (AddBikeDetailsEntity entity : entities) {
            AddBikeDetailsDto dto = new AddBikeDetailsDto();
            BeanUtils.copyProperties(entity, dto);
            dto.setImgPaths(entity.getImgPaths());
            dtos.add(dto);
        }
        return dtos;
    }
}
