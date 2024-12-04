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

@WebServlet("/DeleteModuleServlet")
public class DeleteModuleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String courseId = req.getParameter("course_id");
        int module_id = Integer.parseInt(req.getParameter("module_id"));
        ModuleRepo moduleRepo = new ModuleRepo();
        moduleRepo.delete(Module.class, module_id);
        resp.sendRedirect("Course.jsp?course_id=" + courseId);
    }
}
