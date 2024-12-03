<%@ page import="java.util.List" %>
<%@ page import="com.example.academy.entity.Module" %>
<%@ page import="com.example.academy.repos.ModuleRepo" %>
<%@ page import="com.example.academy.repos.GroupsRepo" %>
<%@ page import="com.example.academy.entity.Groups" %><%--
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
    <title>Groups</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">
        Groups
    </h2>
    <table class="table table-bordered tablet-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Module Name</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Groups> groupsList = GroupsRepo.getGroupsList();
            String module_idStr = request.getParameter("module_id");
            int moduleId;
            if (module_idStr == null){
                String group_idStr = request.getParameter("group_id");
                Groups groups1 = groupsList.stream().filter(groups -> groups.getId() == Integer.parseInt(group_idStr)).findFirst().orElse(null);
                assert groups1 != null;
                moduleId = groups1.getModule().getId();
            }else {
                moduleId = Integer.parseInt(module_idStr);
            }
            for (Groups groups : groupsList) {
                if (groups.getModule().getId() == moduleId) {
        %>

        <tr>
            <td>
                <%= groups.getId() %>
            </td>
            <td>
                <%= groups.getName() %>
            </td><td>
                <%= groups.getModule().getName() %>
            </td>
            <td>
                <form action="Student.jsp" method="get"
                      style="display: inline;">
                    <button class="btn" style="outline: none; color: #fff; background: red"
                            name="group_id" value="<%= groups.getId() %>">
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
        <form action="Module.jsp" method="get">
            <button class="btn btn-lg btn-primary" style="outline: none; background: steelblue; color: #ffffff;"
                    name="module_id" value="<%= moduleId%>">
                Back
            </button>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
