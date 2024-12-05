<%@ page import="com.example.academy.repos.CourseRepo" %>
<%@ page import="com.example.academy.entity.Course" %>
<%@ page import="com.example.academy.repos.ModuleRepo" %>
<%@ page import="com.example.academy.entity.Module" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.academy.repos.GroupsRepo" %>
<%@ page import="com.example.academy.entity.Groups" %>
<%@ page import="com.example.academy.repos.StudentRepo" %>
<%@ page import="com.example.academy.entity.Student" %>
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
  int student_id = Integer.parseInt(request.getParameter("student_id"));
  StudentRepo studentRepo = new StudentRepo();
  Student student = studentRepo.findById(Student.class, student_id);
%>
<div style="height: 100vh; display: flex; align-items: center; justify-content: center">
  <div class="card p-4 shadow" style="width: 100%; max-width: 360px">
    <h2 class="text-center mb-3">
      Edit Student
    </h2>
    <form action="${pageContext.request.contextPath}/EditStudentServlet" method="Post">
      <div class="mb-3">
        <label for="First Name" class="form-label">First Name</label>
        <input type="text" class="form-control" id="First Name" name="firstName" value="<%=student.getFirstName()%>" required>
      </div>
      <div class="mb-3">
        <label for="Last Name" class="form-label">Last Name</label>
        <input type="text" class="form-control" id="Last Name" name="lastname" value="<%=student.getLastName()%>" required>
      </div>
      <div class="mb-3">
        <label for="Age" class="form-label">Age</label>
        <input type="text" class="form-control" id="Age" name="age" value="<%=student.getAge()%>" required>
      </div>
      <div class="mb-3">
        <label for="Phone" class="form-label">Phone</label>
        <input type="text" class="form-control" id="Phone" name="phone" value="<%=student.getPhone()%>" required>
      </div>
      <div class="mb-3">
        <label for="studentGroup" class="form-label">Groups</label>
        <select class="form-select" id="studentGroup" name="group_id" required>
          <%
            GroupsRepo groupsRepo = new GroupsRepo();
            List<Groups> groupsList = groupsRepo.get(Groups.class);
            for (Groups groups : groupsList) {
          %>
          <option value="<%= groups.getId() %>"><%= groups.getName() %>
          </option>
          <%
            }
          %>
        </select>
      </div>
      <input type="hidden" name="student_id" value="<%= student_id %>">
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
