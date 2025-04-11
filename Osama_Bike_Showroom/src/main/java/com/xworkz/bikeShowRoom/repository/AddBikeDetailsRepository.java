package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.AddBikeDetailsEntity;

public interface AddBikeDetailsRepository {

    boolean save(AddBikeDetailsEntity addBikeDetailsEntity);

    long getCountOfBikeName(String bikeName);
}
