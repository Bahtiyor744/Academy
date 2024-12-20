package com.example.servlets;
import com.example.academy.entity.Course;
import com.example.academy.entity.Module;
import com.example.academy.repos.CourseRepo;
import com.example.academy.repos.ModuleRepo;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/AddModuleServlet")
public class AddModuleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        int courseId = Integer.parseInt(req.getParameter("course_id"));
        CourseRepo courseRepo = new CourseRepo();
        Course course = courseRepo.findById(Course.class,courseId);
        Module module = new Module(name,course);
        ModuleRepo moduleRepo = new ModuleRepo();
        moduleRepo.save(module);
        resp.sendRedirect("Module.jsp?course_id=" + courseId);


    }
}
