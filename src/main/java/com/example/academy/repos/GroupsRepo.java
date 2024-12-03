package com.example.academy.repos;

import com.example.academy.entity.Groups;
import com.example.academy.entity.Module;

import javax.persistence.EntityManager;
import java.util.List;

import static com.example.academy.listener.MyListener.EMF;

public class GroupsRepo {
    public static List<Groups> getGroupsList() {

        EntityManager entityManager = null;
        try {
            entityManager = EMF.createEntityManager();
            return entityManager.createQuery("from com.example.academy.entity.Groups", Groups.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }
}
