package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
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
            eManag.persist(registerEntity);
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
}
