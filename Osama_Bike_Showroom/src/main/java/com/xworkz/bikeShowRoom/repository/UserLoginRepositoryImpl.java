package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

@Repository
public class UserLoginRepositoryImpl implements UserLoginRepository {

    @Autowired
    private EntityManagerFactory emf;

    @Override
    public RegisterEntity userLogin(String email) {

        EntityManager eManag = emf.createEntityManager();
        Query query = eManag.createNamedQuery("getEmailAndPassword").setParameter("email", email);

        try {
            RegisterEntity registerEntity = (RegisterEntity) query.getSingleResult();
            return registerEntity;
        } catch (Exception e) {
            return null;
        }
    }
}
