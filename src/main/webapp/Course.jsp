<%@ page import="com.example.academy.entity.Course" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.academy.repos.CourseRepo" %><%--
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
    <title>Course</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">
        Course
    </h2>
    <div class="col-6 text-end">
        <button type="button" class="btn btn-primary"
                style="position: absolute; top: 50px; right: 110px; margin: 10px;"
                data-bs-toggle="modal" data-bs-target="#addCategoryModal">
            ADD
        </button>
    </div>
    <table class="table table-bordered tablet-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Course> courseList = CourseRepo.getCourseList();
            for (Course course : courseList) {
        %>

        <tr>
            <td>
                <%= course.getId() %>
            </td>
            <td>
                <%= course.getName() %>
            </td>
            <td>
                <form action="Module.jsp" method="get"
                      style="display: inline;">
                    <button class="btn" style="outline: none; color: #fff; background: red"
                            name="course_id" value="<%= course.getId() %>">
                        View
                    </button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>

    </table>
</div>
<div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCategoryModalLabel">Add New Course</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/AddCourseServlet" method="post">
                    <div class="mb-3">
                        <label for="Course Name" class="form-label">Course Name</label>
                        <input type="text" class="form-control" id="Course Name" name="name" required>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Add Course</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
