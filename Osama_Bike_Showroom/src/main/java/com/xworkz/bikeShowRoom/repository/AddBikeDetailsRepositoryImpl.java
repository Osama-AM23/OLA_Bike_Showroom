package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.AddBikeDetailsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

@Repository
public class AddBikeDetailsRepositoryImpl implements AddBikeDetailsRepository {

    @Autowired
    private EntityManagerFactory emFac;

    @Override
    public boolean save(AddBikeDetailsEntity addBikeDetailsEntity) {
        EntityManager eMang = emFac.createEntityManager();
        EntityTransaction eTrans = eMang.getTransaction();
        try {
            eTrans.begin();
            eMang.merge(addBikeDetailsEntity);
            eTrans.commit();
            return true;
        } catch (Exception e) {
            if (eTrans.isActive()) {
                eTrans.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            eMang.close();
        }
    }

    @Override
    public long getCountOfBikeName(String bikeName) {
        EntityManager eManag = emFac.createEntityManager();
        EntityTransaction eTran = eManag.getTransaction();
        Query query = eManag.createNamedQuery("getCountOfBikeName");
        query.setParameter("bikeName", bikeName);
        Long count = (Long) query.getSingleResult();
        try {
            eTran.begin();
            eTran.commit();
        } catch (Exception e) {
            if (eTran.isActive()) {
                eTran.rollback();
            }
            e.printStackTrace();
        } finally {
            eManag.close();
        }
        return count;
    }
}
