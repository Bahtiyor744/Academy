package com.example.servlets;
import com.example.academy.entity.Payment;
import com.example.academy.entity.Student;
import com.example.academy.enums.PayType;
import com.example.academy.repos.PaymentRepo;
import com.example.academy.repos.StudentRepo;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
@WebServlet("/AddPaymentServlet")
public class AddPaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int amount = Integer.parseInt(req.getParameter("amount"));
        PayType payType = PayType.valueOf(req.getParameter("type"));
        int studentId = Integer.parseInt(req.getParameter("student_id"));
        StudentRepo studentRepo = new StudentRepo();
        Student student = studentRepo.findById(Student.class,studentId);
        PaymentRepo paymentRepo = new PaymentRepo();
        paymentRepo.save(new Payment(amount,payType, LocalDateTime.now(),student));
        resp.sendRedirect("Payments.jsp?student_id=" + studentId + "&&group_id=" + student.getGroups().getId());
    }
}
