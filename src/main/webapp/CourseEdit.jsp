<%@ page import="com.example.academy.repos.CourseRepo" %>
<%@ page import="com.example.academy.entity.Course" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Course</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<%
  int courseId = Integer.parseInt(request.getParameter("course_id"));
  CourseRepo courseRepo = new CourseRepo();
  Course course = courseRepo.findById(Course.class, courseId);
%>
<div style="height: 100vh; display: flex; align-items: center; justify-content: center">
  <div class="card p-4 shadow" style="width: 100%; max-width: 360px">
    <h2 class="text-center mb-3">
      Edit Course
    </h2>
    <form action="${pageContext.request.contextPath}/EditCourseServlet" method="Post">
      <div class="mb-3">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= course.getName() %>" required>
      </div>
      <input type="hidden" name="course_id" value="<%= course.getId() %>">
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
