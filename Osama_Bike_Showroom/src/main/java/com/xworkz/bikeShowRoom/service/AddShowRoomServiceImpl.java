package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.AddShowRoomDto;
import com.xworkz.bikeShowRoom.entity.AddShowRoomEntity;
import com.xworkz.bikeShowRoom.repository.AddShowRoomRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class AddShowRoomServiceImpl implements AddShowRoomService {
    @Autowired
    AddShowRoomRepository addShowRoomRepository;

    @Override
    public boolean validateAndSave(AddShowRoomDto addShowRoomDto, Model model) {

        boolean isValidate = true;

        if (addShowRoomDto != null) {
            AddShowRoomEntity addShowRoomEntity = new AddShowRoomEntity();
            addShowRoomEntity.setShowroomName(addShowRoomDto.getShowroomName());
            addShowRoomEntity.setAddress(addShowRoomDto.getAddress());
            addShowRoomEntity.setCity(addShowRoomDto.getCity());
            addShowRoomEntity.setContact(addShowRoomDto.getContact());

            if (addShowRoomDto.getShowroomName() != null && addShowRoomDto.getShowroomName().length() >= 5 && addShowRoomDto.getShowroomName().matches("^[a-zA-Z_./\\s]+$")) {
                addShowRoomEntity.setShowroomName(addShowRoomDto.getShowroomName());
            } else {
                isValidate = false;
                model.addAttribute("showroomError", "Showroom Name is Invalid");

            }

            if (addShowRoomDto.getAddress() != null && addShowRoomDto.getAddress().length() >= 5 && addShowRoomDto.getAddress().length() <= 40 && addShowRoomDto.getAddress().matches("^[A-Za-z0-9.,\\s]+$")) {
                addShowRoomEntity.setAddress(addShowRoomDto.getAddress());
            } else {
                isValidate = false;
                model.addAttribute("addressError", "Showroom Address is Invalid");
            }

            if (addShowRoomDto.getContact() != null && addShowRoomDto.getContact().length() == 10 && addShowRoomDto.getContact().matches("^[9876]\\d{9}$")) {
                addShowRoomEntity.setContact(addShowRoomDto.getContact());
            } else {
                isValidate = false;
                model.addAttribute("contactError", "Invalid Contact Number");
            }
            if (isValidate) {
                boolean saved= addShowRoomRepository.save(addShowRoomEntity);
                return saved;
            }
        }
        return false;
    }

    @Override
    public long getCountByAddress(String address) {
        return addShowRoomRepository.getCountOfAddress(address);
    }

    @Override
    public long getCountByContact(String contact) {
        return addShowRoomRepository.getCountOfContact(contact);
    }
}
