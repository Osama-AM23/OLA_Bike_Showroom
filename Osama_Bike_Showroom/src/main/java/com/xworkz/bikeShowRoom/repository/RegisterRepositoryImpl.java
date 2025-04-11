package com.xworkz.bikeShowRoom.repository;

import com.xworkz.bikeShowRoom.entity.AddShowRoomEntity;
import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.util.Arrays;
import java.util.List;

@Repository
public class RegisterRepositoryImpl implements RegisterRepository {
    @Autowired
    EntityManagerFactory emfac;

    @Override
    public List<AddShowRoomEntity> getShowroomNames() {
        EntityManager eManag = emfac.createEntityManager();

        List<AddShowRoomEntity> showroomList = eManag.createNamedQuery("getAllShowroom", AddShowRoomEntity.class)
                .getResultList();
        System.out.println("Repository :: " + showroomList);
        return showroomList;
    }

    @Override
    public List<String> getAssignedBikesByShowroom(String showroomName) {

        EntityManager eManag = emfac.createEntityManager();

        System.out.println("REPO received showroom :: " + showroomName);
        String bikes = (String) eManag.createNamedQuery("getBikesByShowroom")
                .setParameter("showroomName", showroomName)
                .getSingleResult();
        System.out.println("Repository-Retrieved bikes ::" + bikes);
        return Arrays.asList(bikes.split(","));
    }

    @Override
    public boolean save(RegisterEntity userRegisterEntity) {
        EntityManager eMang = emfac.createEntityManager();
        EntityTransaction eTrans = eMang.getTransaction();

        try {
            eTrans.begin();
            eMang.persist(userRegisterEntity);
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
    public long getCountOfName(String customerName) {
        EntityManager eMang = emfac.createEntityManager();
        EntityTransaction eTrans = eMang.getTransaction();
        Query query = eMang.createNamedQuery("getCountOfName");
        query.setParameter("customerName", customerName);
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
        EntityManager eMang = emfac.createEntityManager();
        EntityTransaction eTrans = eMang.getTransaction();
        Query query = eMang.createNamedQuery("getCountOfContact");
        query.setParameter("contactNo", contact);
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
    public long getCountOfEmail(String email) {
        EntityManager eMang = emfac.createEntityManager();
        EntityTransaction eTrans = eMang.getTransaction();
        Query query = eMang.createNamedQuery("getCountOfEmail");
        query.setParameter("email", email);
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
    public long getCountOfLicense(String drivingLicense) {
        EntityManager eMang = emfac.createEntityManager();
        EntityTransaction eTrans = eMang.getTransaction();
        Query query = eMang.createNamedQuery("getCountOfLicense");
        query.setParameter("drivingLicense", drivingLicense);
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
}
