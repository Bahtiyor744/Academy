package com.example.servlets;

import com.example.academy.entity.Payment;
import com.example.academy.entity.Student;
import com.example.academy.repos.PaymentRepo;
import com.example.academy.repos.StudentRepo;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeletePaymentServlet")
public class DeletePaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String student_id = req.getParameter("student_id");
        String group_id = req.getParameter("group_id");
        int payment_id = Integer.parseInt(req.getParameter("payment_id"));
        PaymentRepo paymentRepo = new PaymentRepo();
        paymentRepo.delete(Payment.class, payment_id);
        resp.sendRedirect("Payments.jsp?student_id=" + student_id + "&&group_id="+group_id);
    }
}
