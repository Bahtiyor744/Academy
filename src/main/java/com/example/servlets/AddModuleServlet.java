package com.example.servlets;

import com.example.academy.entity.Course;
import com.example.academy.entity.Module;

import javax.persistence.EntityManager;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.example.academy.listener.MyListener.EMF;

@WebServlet("/AddModuleServlet")
public class AddModuleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        EntityManager entityManager = null;
        try {
            entityManager = EMF.createEntityManager();
            String name = req.getParameter("name");
            int courseId = Integer.parseInt(req.getParameter("course_id"));
            Course course = entityManager.find(Course.class, courseId);
            Module module = new Module(name,course);
            entityManager.getTransaction().begin();
            entityManager.persist(module);
            entityManager.getTransaction().commit();
            resp.sendRedirect("Module.jsp?course_id=" + courseId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }

    }
}
