package com.example.academy.repos;

import com.example.academy.entity.Course;
import com.example.academy.entity.Module;

import javax.persistence.EntityManager;
import java.util.List;

import static com.example.academy.listener.MyListener.EMF;

public class ModuleRepo {
    public static List<Module> getModuleList() {

        EntityManager entityManager = null;
        try {
            entityManager = EMF.createEntityManager();
            return entityManager.createQuery("from com.example.academy.entity.Module", Module.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }
}
