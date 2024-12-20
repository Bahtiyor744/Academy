package com.example.servlets;
import com.example.academy.entity.Groups;
import com.example.academy.entity.Student;
import com.example.academy.repos.GroupsRepo;
import com.example.academy.repos.StudentRepo;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String firstName = req.getParameter("firstName");
        String lastname = req.getParameter("lastname");
        int age = Integer.parseInt(req.getParameter("age"));
        Integer phone = Integer.parseInt(req.getParameter("phone"));
        int group_id = Integer.parseInt(req.getParameter("group_id"));
        GroupsRepo groupsRepo = new GroupsRepo();
        Groups groups = groupsRepo.findById(Groups.class,group_id);
        StudentRepo studentRepo = new StudentRepo();
        studentRepo.save(new Student(firstName, lastname, age, phone, groups));
        resp.sendRedirect("Student.jsp?group_id=" + group_id);
    }
}
