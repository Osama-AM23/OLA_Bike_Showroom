package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.dto.ViewRegisterDto;
import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import com.xworkz.bikeShowRoom.entity.ViewRegisterEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;

@Repository
public class FollowUpRepositoryImpl implements FollowUpRepository {

    @Autowired
    EntityManagerFactory emFac;

    @Override
    public List<RegisterEntity> getAllDetails() {
        EntityManager eManag = emFac.createEntityManager();

        return eManag.createNamedQuery("getAllData").getResultList();
    }

    @Override
    public boolean updateReasonByName(RegisterEntity registerEntity) {
        EntityManager eManag = emFac.createEntityManager();
        EntityTransaction eTrans = eManag.getTransaction();

        try {
            eTrans.begin();

            Query query = eManag.createNamedQuery("updateReasonByName");
            query.setParameter("reason", registerEntity.getReason());
            query.setParameter("customerName", registerEntity.getCustomerName());
            query.setParameter("scheduleDays", registerEntity.getScheduleDays());
            int updateRows = query.executeUpdate();

            ViewRegisterEntity viewRegEnt = new ViewRegisterEntity();
            ViewRegisterDto viewRegDto = new ViewRegisterDto();
            viewRegEnt.setId(viewRegDto.getId());
            viewRegEnt.setCustomerName(registerEntity.getCustomerName());
            viewRegEnt.setReason(registerEntity.getReason());
            viewRegEnt.setReScheduledDay(registerEntity.getScheduleDays());
            viewRegEnt.setUpdatedTiming(LocalDateTime.now().toString());

            eManag.merge(viewRegEnt);
            eTrans.commit();
            return updateRows > 0;
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

    @Override
    public List<ViewRegisterEntity> getAllByName(String customerName) {
        EntityManager eManag = emFac.createEntityManager();
        Query query = eManag.createNamedQuery("getAllByName").setParameter("customerName", customerName);
        query.getResultList();
        return (List<ViewRegisterEntity>) query.getResultList();
    }
}
