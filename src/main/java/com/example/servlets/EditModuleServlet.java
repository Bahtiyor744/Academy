package com.example.servlets;

import com.example.academy.entity.Course;
import com.example.academy.entity.Module;
import com.example.academy.repos.CourseRepo;
import com.example.academy.repos.ModuleRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditModuleServlet")
public class EditModuleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int courseId = Integer.parseInt(req.getParameter("course_id"));
        int module_id = Integer.parseInt(req.getParameter("module_id"));
        String name = req.getParameter("name");
        CourseRepo courseRepo = new CourseRepo();
        Course course = courseRepo.findById(Course.class, courseId);
        ModuleRepo moduleRepo = new ModuleRepo();
        Module module = moduleRepo.findById(Module.class, module_id);
        module.setName(name);
        module.setCourse(course);
        moduleRepo.edit(module);
        resp.sendRedirect("Module.jsp?course_id=" + courseId);
    }
}
