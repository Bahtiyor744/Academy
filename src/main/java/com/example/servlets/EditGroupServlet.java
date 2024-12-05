package com.example.servlets;

import com.example.academy.entity.Groups;
import com.example.academy.entity.Module;
import com.example.academy.repos.GroupsRepo;
import com.example.academy.repos.ModuleRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditGroupServlet")
public class EditGroupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int group_id = Integer.parseInt(req.getParameter("group_id"));
        int module_id = Integer.parseInt(req.getParameter("module_id"));
        String name = req.getParameter("name");
        ModuleRepo moduleRepo = new ModuleRepo();
        Module module = moduleRepo.findById(Module.class, module_id);
        GroupsRepo groupsRepo = new GroupsRepo();
        Groups group = groupsRepo.findById(Groups.class, group_id);
        group.setName(name);
        group.setModule(module);
        groupsRepo.edit(group);
        resp.sendRedirect("Groups.jsp?module_id=" + module_id);
    }
}
