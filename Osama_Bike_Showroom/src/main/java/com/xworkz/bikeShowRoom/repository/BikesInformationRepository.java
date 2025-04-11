package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.AddBikeDetailsEntity;

import java.util.List;

public interface BikesInformationRepository {

    List<AddBikeDetailsEntity> getAllDetails();
}
