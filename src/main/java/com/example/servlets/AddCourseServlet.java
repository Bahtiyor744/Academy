package com.example.servlets;
import com.example.academy.entity.Course;
import com.example.academy.repos.CourseRepo;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/AddCourseServlet")
public class AddCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        Course course = new Course(name);
        CourseRepo courseRepo = new CourseRepo();
        courseRepo.save(course);
        resp.sendRedirect("Course.jsp");
    }
}
