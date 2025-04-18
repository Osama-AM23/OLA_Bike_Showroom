package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.AddShowRoomEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.util.Collections;
import java.util.List;

@Repository
public class AddShowRoomRepositoryImpl implements AddShowRoomRepository {
    @Autowired
    private EntityManagerFactory emFac;

    @Override
    public boolean save(AddShowRoomEntity addShowRoomEntity) {
        EntityManager eMang = emFac.createEntityManager();
        EntityTransaction eTrans = eMang.getTransaction();
        try {
            eTrans.begin();
            eMang.persist(addShowRoomEntity);
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
    public long getCountOfAddress(String address) {
        EntityManager eMang = emFac.createEntityManager();
        EntityTransaction eTrans = eMang.getTransaction();
        Query query = eMang.createNamedQuery("getAddressCount");
        query.setParameter("address", address);
        Long count = (Long) query.getSingleResult();
        try {
            eTrans.begin();
            eTrans.commit();
        } catch (Exception e) {
            if (eTrans.isActive()) {
                eTrans.rollback();
            }
            e.printStackTrace();
        } finally {
            eMang.close();
        }

        return count;
    }

    @Override
    public long getCountOfContact(String contact) {
        EntityManager eMang = emFac.createEntityManager();
        EntityTransaction eTrans = eMang.getTransaction();
        Query query = eMang.createNamedQuery("getContactCount");
        query.setParameter("contact", contact);
        Long count = (Long) query.getSingleResult();
        try {
            eTrans.begin();
            eTrans.commit();
        } catch (Exception e) {
            if (eTrans.isActive()) {
                eTrans.rollback();
            }
            e.printStackTrace();
        } finally {
            eMang.close();
        }
        return count;
    }

    @Override
    public List<AddShowRoomEntity> getAllShowroom() {

        EntityManager eManag = emFac.createEntityManager();
        Query query = eManag.createNamedQuery("getShowrooms");
        List<AddShowRoomEntity> showRoomEntities = query.getResultList();
        return showRoomEntities;
    }
}
