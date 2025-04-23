package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.dto.AddShowRoomDto;
import com.xworkz.bikeShowRoom.entity.AddBikeDetailsEntity;
import com.xworkz.bikeShowRoom.entity.AddShowRoomEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import java.util.*;
import java.util.stream.Collectors;

@Repository
public class AssignBikesRepositoryImpl implements AssignBikesRepository {

    @Autowired
    EntityManagerFactory emf;

    @Override
    public List<AddShowRoomEntity> getAll() {
        EntityManager eManag = emf.createEntityManager();
        return emf.createEntityManager().createNamedQuery("getAllForAssign").getResultList();
    }

    @Override
    public AddShowRoomEntity findByShowroomAddress(String address) {
        EntityManager eManag = emf.createEntityManager();
        EntityTransaction eTrans = eManag.getTransaction();
        try {
            return eManag.createNamedQuery("findShowroomAddress", AddShowRoomEntity.class)
                    .setParameter("address", address).getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public List<String> getAllBikes() {
        EntityManager eManag = emf.createEntityManager();
        return emf.createEntityManager().createNamedQuery("getAllBikes").getResultList();
    }

    @Override
    public boolean assignShowroomBikes(String address, List<String> bikeNames) {
        EntityManager eManag = emf.createEntityManager();
        EntityTransaction eTrans = eManag.getTransaction();
        try {
            eTrans.begin();
            List<AddShowRoomEntity> allShowrooms = eManag.createNamedQuery("getAllShowroom").getResultList();

            Set<String> assignedBikes = new HashSet<>();
            for (AddShowRoomEntity showroom : allShowrooms) {
                if (showroom.getAssignedBikes() != null) {
                    assignedBikes.addAll(Arrays.asList(showroom.getAssignedBikes().split(",")));
                }
            }

            List<String> availableBikes = bikeNames.stream().filter(bike -> !assignedBikes.contains(bike))
                    .collect(Collectors.toList());

            if (availableBikes.size() < bikeNames.size()) {
                return false;
            }
            AddShowRoomEntity showroom = findByShowroomAddress(address);
            if (showroom == null) {
                eTrans.rollback();
                return false;
            }

            String updatedBikes = (showroom.getAssignedBikes() == null || showroom.getAssignedBikes().isEmpty())
                    ? String.join(",", availableBikes)
                    : showroom.getAssignedBikes() + "," + String.join(",", availableBikes);

            showroom.setAssignedBikes(updatedBikes);
            eManag.merge(showroom);

            for (String bikeName : availableBikes) {
                List<AddBikeDetailsEntity> bikes = eManag.createNamedQuery("findBikeByName", AddBikeDetailsEntity.class)
                        .setParameter("bikeName", bikeName)
                        .getResultList();

                for (AddBikeDetailsEntity bike : bikes) {
                    if (bike.getAddress() == null || bike.getAddress().isEmpty()) {
                        bike.setAddress(address);
                        eManag.merge(bike);
                    }
                }
            }

            eTrans.commit();
            return true;

        } catch (Exception e) {
            if (eTrans.isActive()) {
                eTrans.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            eManag.close();
        }

    }
}
