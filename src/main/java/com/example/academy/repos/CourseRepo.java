package com.example.academy.repos;

import com.example.academy.entity.Course;

import javax.persistence.EntityManager;
import java.util.List;

import static com.example.academy.listener.MyListener.EMF;

public class CourseRepo {
    public static List<Course> getCourseList() {
        EntityManager entityManager = null;
        try {
            entityManager = EMF.createEntityManager();
            return entityManager.createQuery("from com.example.academy.entity.Course", Course.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }

}
