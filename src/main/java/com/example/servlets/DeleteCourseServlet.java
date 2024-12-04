package com.example.servlets;

import com.example.academy.entity.Course;
import com.example.academy.repos.CourseRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteCourseServlet")
public class DeleteCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int courseId = Integer.parseInt(req.getParameter("course_id"));
        CourseRepo courseRepo = new CourseRepo();
        courseRepo.delete(Course.class,courseId);
        resp.sendRedirect("Course.jsp");
    }
}
