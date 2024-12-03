package com.example.servlets;

import com.example.academy.entity.Groups;
import com.example.academy.entity.Module;
import com.example.academy.entity.Student;

import javax.persistence.EntityManager;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.example.academy.listener.MyListener.EMF;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        EntityManager entityManager = null;
        try {
            entityManager = EMF.createEntityManager();
            String firstName = req.getParameter("firstName");
            String lastname = req.getParameter("lastname");
            int age = Integer.parseInt(req.getParameter("age"));
            Integer phone = Integer.parseInt(req.getParameter("phone"));
            int group_id = Integer.parseInt(req.getParameter("group_id"));
            Groups groups1 = entityManager.find(Groups.class, group_id);
            Student student = new Student(firstName, lastname, age, phone, groups1);
            entityManager.getTransaction().begin();
            entityManager.persist(student);
            entityManager.getTransaction().commit();
            resp.sendRedirect("Student.jsp?group_id=" + group_id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }

    }
}
