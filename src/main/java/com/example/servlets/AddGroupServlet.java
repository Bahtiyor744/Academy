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


@WebServlet("/AddGroupServlet")
public class AddGroupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        int moduleId = Integer.parseInt(req.getParameter("module_id"));
        ModuleRepo moduleRepo = new ModuleRepo();
        Module module = moduleRepo.findById(Module.class, moduleId);
        Groups groups = new Groups(name,module);
        GroupsRepo groupsRepo = new GroupsRepo();
        groupsRepo.save(groups);
        resp.sendRedirect("Groups.jsp?module_id=" + moduleId);
    }
}
