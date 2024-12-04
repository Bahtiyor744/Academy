package com.example.academy.repos;

import com.example.academy.entity.Course;
import com.example.academy.entity.Payment;

import javax.persistence.EntityManager;
import java.util.List;

import static com.example.academy.listener.MyListener.EMF;

public class PaymentRepo {
    public static List<Payment> getPaymentRepo() {
        EntityManager entityManager = null;
        try {
            entityManager = EMF.createEntityManager();
            return entityManager.createQuery("from com.example.academy.entity.Payment", Payment.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }

}
