package com.example.servlets;

import com.example.academy.entity.Groups;
import com.example.academy.entity.Module;
import com.example.academy.entity.Student;
import com.example.academy.repos.GroupsRepo;
import com.example.academy.repos.ModuleRepo;
import com.example.academy.repos.StudentRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditStudentServlet")
public class EditStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int group_id = Integer.parseInt(req.getParameter("group_id"));
        int student_id = Integer.parseInt(req.getParameter("student_id"));
        String firstName = req.getParameter("firstName");
        String lastname = req.getParameter("lastname");
        int age = Integer.parseInt(req.getParameter("age"));
        int phone = Integer.parseInt(req.getParameter("phone"));
        GroupsRepo groupsRepo = new GroupsRepo();
        Groups group = groupsRepo.findById(Groups.class, group_id);
        StudentRepo studentRepo = new StudentRepo();
        Student student = studentRepo.findById(Student.class, student_id);
        student.setFirstName(firstName);
        student.setLastName(lastname);
        student.setAge(age);
        student.setPhone(phone);
        student.setGroups(group);
        studentRepo.edit(student);
        resp.sendRedirect("Student.jsp?group_id=" + group_id);
    }
}
