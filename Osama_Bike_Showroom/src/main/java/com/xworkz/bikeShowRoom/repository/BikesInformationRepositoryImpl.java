package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.AddBikeDetailsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.List;

@Repository
public class BikesInformationRepositoryImpl implements BikesInformationRepository {

    @Autowired
    EntityManagerFactory emFac;

    @Override
    public List<AddBikeDetailsEntity> getAllDetails() {
        EntityManager eManag = emFac.createEntityManager();
        Query query = eManag.createNamedQuery("getAllDetails");
        List<AddBikeDetailsEntity> lists = query.getResultList();
        return lists;
    }
}
