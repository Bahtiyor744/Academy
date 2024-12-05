package com.example.academy.base;

import javax.persistence.EntityManager;

import java.util.List;

import static com.example.academy.listener.MyListener.EMF;

public class BaseRepo<T> {
    public void save(T entity) {
        EntityManager entityManager = null;
        try {
            entityManager = EMF.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.persist(entity);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }

    public T findById(Class<T> entityClass, Object id) {
        EntityManager entityManager = null;
        try {
            entityManager = EMF.createEntityManager();
            return entityManager.find(entityClass, id);
        } catch (Exception e) {
            throw new RuntimeException("Failed to find entity of type " + entityClass.getSimpleName() + " with id " + id, e);
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }

    public List<T> get(Class<T> entityClass) {
        EntityManager entityManager = null;
        try {
            entityManager = EMF.createEntityManager();
            return entityManager.createQuery("from " + entityClass.getSimpleName(), entityClass).getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch entities of type " + entityClass.getSimpleName(), e);
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }
    public void delete(Class<T> entityClass, int id) {
        EntityManager entityManager = null;
        try {
            entityManager = EMF.createEntityManager();
            entityManager.getTransaction().begin();
            T entity = entityManager.find(entityClass, id);
            if (entity != null) {
                entityManager.remove(entity);
            } else {
                throw new IllegalArgumentException("Entity not found for ID: " + id);
            }
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            if (entityManager != null && entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            throw new RuntimeException("Failed to delete entity", e);
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }
    public void edit(T entity) {
        EntityManager entityManager = null;
        try {
            entityManager = EMF.createEntityManager();

            entityManager.getTransaction().begin();
            entityManager.merge(entity);
            entityManager.getTransaction().commit();
            System.out.println("Entity updated successfully.");
        } catch (Exception e) {
            if (entityManager != null && entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            throw new RuntimeException("Failed to update entity", e);
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }


}
