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

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String group_id = req.getParameter("group_id");
        int student_id = Integer.parseInt(req.getParameter("student_id"));
        StudentRepo studentRepo = new StudentRepo();
        studentRepo.delete(Student.class,student_id);
        resp.sendRedirect("Student.jsp?group_id=" + group_id);
    }
}
