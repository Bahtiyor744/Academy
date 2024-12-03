package com.example.academy.repos;

import com.example.academy.entity.Groups;
import com.example.academy.entity.Student;

import javax.persistence.EntityManager;
import java.util.List;

import static com.example.academy.listener.MyListener.EMF;

public class StudentRepo {
    public static List<Student> getStudentRepo() {

        EntityManager entityManager = null;
        try {
            entityManager = EMF.createEntityManager();
            return entityManager.createQuery("from com.example.academy.entity.Student", Student.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }
}
