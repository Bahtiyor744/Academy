<%@ page import="com.example.academy.entity.Course" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.repos.CourseRepo" %><%--
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
                <form action="${pageContext.request.contextPath}/viewOrderItem.jsp" method="get"
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
<%--    <div class="mt-3 text-center">--%>
<%--        <form action="${pageContext.request.contextPath}/myOrders.jsp" method="get">--%>
<%--            <button class="btn btn-lg btn-primary" style="outline: none; background: steelblue; color: #ffffff;">--%>
<%--                Back--%>
<%--            </button>--%>
<%--        </form>--%>
<%--    </div>--%>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
