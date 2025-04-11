package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.AddBikeDetailsDto;
import org.springframework.ui.Model;

public interface AddBikeDetailsService {

    boolean validateAndSave(AddBikeDetailsDto addBikeDetailsDto, Model model);

    long getCountOfBikeName(String bikeName);
}
