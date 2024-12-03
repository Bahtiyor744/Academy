package com.example.servlets;

import com.example.academy.entity.Course;
import com.example.academy.entity.Groups;
import com.example.academy.entity.Module;

import javax.persistence.EntityManager;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.example.academy.listener.MyListener.EMF;

@WebServlet("/AddGroupServlet")
public class AddGroupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        EntityManager entityManager = null;
        try {
            entityManager = EMF.createEntityManager();
            String name = req.getParameter("name");
            int moduleId = Integer.parseInt(req.getParameter("module_id"));
            Module module1 = entityManager.find(Module.class, moduleId);
            Groups groups = new Groups(name,module1);
            entityManager.getTransaction().begin();
            entityManager.persist(groups);
            entityManager.getTransaction().commit();
            resp.sendRedirect("Groups.jsp?module_id=" + moduleId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }

    }
}
