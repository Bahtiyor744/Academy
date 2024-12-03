<%@ page import="java.util.List" %>
<%@ page import="com.example.academy.entity.Module" %>
<%@ page import="com.example.academy.repos.ModuleRepo" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30.11.2024
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Module</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">
        Module
    </h2>
    <table class="table table-bordered tablet-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Course Name</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Module> moduleList = ModuleRepo.getModuleList();
            String course_idStr = request.getParameter("course_id");
            int courseId;
            if (course_idStr == null) {
                String module_idStr = request.getParameter("module_id");
                Module module1 = moduleList.stream().filter(module -> module.getId() == Integer.parseInt(module_idStr)).findFirst().orElse(null);
                assert module1 != null;
                courseId = module1.getCourse().getId();
            } else {
                courseId = Integer.parseInt(course_idStr);
            }
            for (Module module : moduleList) {
                if (module.getCourse().getId() == courseId) {

        %>

        <tr>
            <td>
                <%= module.getId() %>
            </td>
            <td>
                <%= module.getName() %>
            </td>
            <td>
                <%= module.getCourse().getName() %>
            </td>
            <td>
                <form action="Groups.jsp" method="get"
                      style="display: inline;">
                    <button class="btn" style="outline: none; color: #fff; background: red"
                            name="module_id" value="<%= module.getId() %>">
                        View
                    </button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>

    </table>
    <div class="mt-3 text-center">
        <form action="Course.jsp" method="get">
            <button class="btn btn-lg btn-primary" style="outline: none; background: steelblue; color: #ffffff;">
                Back
            </button>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
