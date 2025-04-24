package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

@Repository
public class UserPortalRepositoryImpl implements UserPortalRepository {

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

    @Override
    public boolean updateLoginCount(RegisterEntity registerEntity) {

        EntityManager eManag = emf.createEntityManager();
        EntityTransaction eTrans = eManag.getTransaction();
        try {
            eTrans.begin();
            eManag.merge(registerEntity);
            eTrans.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            eManag.close();
        }
    }

    @Override
    public boolean setLockTime(String email, RegisterEntity registerEntity) {

        EntityManager eManag = emf.createEntityManager();
        EntityTransaction eTrans = eManag.getTransaction();
        try {
            eTrans.begin();
            eManag.merge(registerEntity);
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

    @Override
    public RegisterEntity getDataForUpdate(String email) {

        EntityManager eManag = emf.createEntityManager();
        EntityTransaction eTrans = eManag.getTransaction();

        try {
            Query query = eManag.createNamedQuery("getDataForUpdate");
            query.setParameter("email", email);
            return (RegisterEntity) query.getSingleResult();
        } catch (Exception e) {
            if (eTrans.isActive()) {
                eTrans.rollback();
            }
            e.printStackTrace();
            return null;
        } finally {
            eManag.close();
        }
    }

    @Override
    public boolean updateNewPassword(RegisterEntity registerEntity) {
        EntityManager eManag = emf.createEntityManager();
        EntityTransaction eTrans = eManag.getTransaction();

        try {
            eTrans.begin();
            Query query = eManag.createNamedQuery("updateNewPassword");
            query.setParameter("password", registerEntity.getPassword());
            query.setParameter("email", registerEntity.getEmail());

            int updateRow = query.executeUpdate();

            eTrans.commit();

            return updateRow > 0;
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
    public boolean updateUserProfile(RegisterEntity registerEntity) {

        EntityManager eManag = emf.createEntityManager();
        EntityTransaction eTrans = eManag.getTransaction();

        try {
            eTrans.begin();
            Query query = eManag.createNamedQuery("updateUserProfile");
            query.setParameter("customerName", registerEntity.getCustomerName());
            query.setParameter("age", registerEntity.getAge());
            query.setParameter("contactNo", registerEntity.getContactNo());
            query.setParameter("address", registerEntity.getAddress());
            query.setParameter("drivingLicense", registerEntity.getDrivingLicense());
            query.setParameter("userImg", registerEntity.getUserImg());
            query.setParameter("email", registerEntity.getEmail());

            int updateRow = query.executeUpdate();
            eTrans.commit();
            return updateRow > 0;
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
    public boolean updateUserSchedule(RegisterEntity registerEntity) {
        EntityManager eManag = emf.createEntityManager();
        EntityTransaction eTrans = eManag.getTransaction();

        try {
            eTrans.begin();
            Query query = eManag.createNamedQuery("updateUserSchedule");
            query.setParameter("schedule", registerEntity.getSchedule());
            query.setParameter("showroomNames", registerEntity.getShowroomNames());
            query.setParameter("bikeNames", registerEntity.getBikeNames());
            query.setParameter("scheduleDays", registerEntity.getScheduleDays());
            query.setParameter("scheduleDate", registerEntity.getScheduleDate());
            query.setParameter("scheduleTime", registerEntity.getScheduleTime());
            query.setParameter("email", registerEntity.getEmail());

            int updateRow = query.executeUpdate();
            eTrans.commit();

            return updateRow > 0;
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
