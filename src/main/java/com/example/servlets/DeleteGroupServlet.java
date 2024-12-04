package com.example.servlets;

import com.example.academy.entity.Groups;
import com.example.academy.entity.Module;
import com.example.academy.repos.GroupsRepo;
import com.example.academy.repos.ModuleRepo;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteGroupServlet")
public class DeleteGroupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String module_id = req.getParameter("module_id");
        int group_id = Integer.parseInt(req.getParameter("group_id"));
        GroupsRepo groupsRepo = new GroupsRepo();
        groupsRepo.delete(Groups.class, group_id);
        resp.sendRedirect("Groups.jsp?course_id=" + module_id);
    }
}
