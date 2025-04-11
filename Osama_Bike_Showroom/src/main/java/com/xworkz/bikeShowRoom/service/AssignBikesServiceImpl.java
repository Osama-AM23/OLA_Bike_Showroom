package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.AddShowRoomDto;
import com.xworkz.bikeShowRoom.entity.AddShowRoomEntity;
import com.xworkz.bikeShowRoom.repository.AssignBikesRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManagerFactory;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class AssignBikesServiceImpl implements AssignBikesService {

    @Autowired
    AssignBikesRepository assignBikesRepository;

    @Override
    public List<AddShowRoomDto> getAll() {

        List<AddShowRoomDto> dtos = new ArrayList<>();
        List<AddShowRoomEntity> entities = assignBikesRepository.getAll();

        for (AddShowRoomEntity addShowRoomEntity : entities) {
            AddShowRoomDto addShowRoomDto = new AddShowRoomDto();
            BeanUtils.copyProperties(addShowRoomEntity, addShowRoomDto);
            dtos.add(addShowRoomDto);
        }
        return dtos;
    }

    @Override
    public AddShowRoomDto getShowroomAddress(String address) {
        AddShowRoomEntity addShowRoomEntity = assignBikesRepository.findByShowroomAddress(address);
        if (addShowRoomEntity == null) {
            return null;
        }

        AddShowRoomDto showRoomDto = new AddShowRoomDto();
        showRoomDto.setId(addShowRoomEntity.getId());
        showRoomDto.setShowroomName(addShowRoomEntity.getShowroomName());
        showRoomDto.setAddress(addShowRoomEntity.getAddress());
        showRoomDto.setCity(addShowRoomEntity.getCity());
        showRoomDto.setContact(addShowRoomEntity.getContact());

        return showRoomDto;
    }

    @Override
    public List<String> getAllBikes() {
        return assignBikesRepository.getAllBikes();
    }

    @Override
    public boolean assignShowroomBikes(String address, List<String> bikeNames) {
        if (bikeNames.size() > 5) {
            return false;
        }
        return assignBikesRepository.assignShowroomBikes(address, bikeNames);
    }
}
