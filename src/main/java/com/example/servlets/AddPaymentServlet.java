package com.example.servlets;

import com.example.academy.entity.Course;
import com.example.academy.entity.Module;
import com.example.academy.entity.Payment;
import com.example.academy.entity.Student;
import com.example.academy.enums.PayType;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

import static com.example.academy.listener.MyListener.EMF;

@WebServlet("/AddPaymentServlet")
public class AddPaymentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager entityManager = null;
        try {
            entityManager = EMF.createEntityManager();
            String sum  = req.getParameter("amount");
            System.out.println("csc" + sum);
            int amount = Integer.parseInt(req.getParameter("amount"));
            PayType payType = PayType.valueOf(req.getParameter("type"));
            int studentId = Integer.parseInt(req.getParameter("student_id"));
            System.out.println("amiunt" + amount);
            System.out.println("studem" + studentId);
            Student student = entityManager.find(Student.class, studentId);
            Payment payment = new Payment(amount,payType, LocalDateTime.now(),student);
            entityManager.getTransaction().begin();
            entityManager.persist(payment);
            entityManager.getTransaction().commit();
            resp.sendRedirect("Student.jsp?group_id=" + student.getGroups().getId());
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

    }
}
