package com.example.servlets;

import com.example.academy.entity.Course;
import com.example.academy.repos.CourseRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditCourseServlet")
public class EditCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int courseId = Integer.parseInt(req.getParameter("course_id"));
        String name = req.getParameter("name");
        CourseRepo courseRepo = new CourseRepo();
        Course course = courseRepo.findById(Course.class, courseId);
        course.setName(name);
        courseRepo.edit(course);
        resp.sendRedirect("Course.jsp");
    }
}
