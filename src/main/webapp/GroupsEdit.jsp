<%@ page import="com.example.academy.repos.CourseRepo" %>
<%@ page import="com.example.academy.entity.Course" %>
<%@ page import="com.example.academy.repos.ModuleRepo" %>
<%@ page import="com.example.academy.entity.Module" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.academy.repos.GroupsRepo" %>
<%@ page import="com.example.academy.entity.Groups" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Module</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<%
  int group_id = Integer.parseInt(request.getParameter("group_id"));
  GroupsRepo groupsRepo = new GroupsRepo();
  Groups group = groupsRepo.findById(Groups.class, group_id);
%>
<div style="height: 100vh; display: flex; align-items: center; justify-content: center">
  <div class="card p-4 shadow" style="width: 100%; max-width: 360px">
    <h2 class="text-center mb-3">
      Edit Module
    </h2>
    <form action="${pageContext.request.contextPath}/EditGroupServlet" method="Post">
      <div class="mb-3">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= group.getName() %>" required>
      </div>
      <div class="mb-3">
        <label for="productCategory" class="form-label">Module</label>
        <select class="form-select" id="productCategory" name="module_id" required>
          <%
            ModuleRepo moduleRepo = new ModuleRepo();
            List<Module> moduleList = moduleRepo.get(Module.class);
            for (Module module : moduleList) {
          %>
          <option value="<%= module.getId() %>"><%= module.getName() %>
          </option>
          <%
            }
          %>
        </select>
      </div>
      <input type="hidden" name="group_id" value="<%= group_id %>">
      <div class="d-flex justify-content-between align-items-center">
        <button type="submit" class="btn btn-primary">
          Save
        </button>
      </div>
    </form>
  </div>
</div>
</body>
</html>
