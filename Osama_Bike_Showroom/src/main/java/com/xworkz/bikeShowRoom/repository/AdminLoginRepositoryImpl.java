package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.AdminLoginEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.List;

@Repository
public class AdminLoginRepositoryImpl implements AdminLoginRepository {

    @Autowired
    private EntityManagerFactory emFac;

    @Override
    public AdminLoginEntity getAdminEmail(String email) {
        EntityManager eMang = emFac.createEntityManager();
        Query query = eMang.createNamedQuery("getByEmail").setParameter("email", email);

        List<AdminLoginEntity> results = query.getResultList();
        if (results.isEmpty()) {
            return null;
        }
        return results.get(0);
    }
}
