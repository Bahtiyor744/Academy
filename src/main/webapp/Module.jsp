<%@ page import="java.util.List" %>
<%@ page import="com.example.academy.entity.Module" %>
<%@ page import="com.example.academy.repos.ModuleRepo" %>
<%@ page import="com.example.academy.repos.CourseRepo" %>
<%@ page import="jdk.jfr.Category" %>
<%@ page import="com.example.academy.entity.Course" %><%--
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
            <th>Course Name</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            ModuleRepo moduleRepo = new ModuleRepo();
            List<Module> moduleList = moduleRepo.get(Module.class);
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
                    <button class="btn btn-outline-primary"
                            name="course_id" value="<%= module.getId() %>">
                        View
                    </button>
                </form>
                <form action="${pageContext.request.contextPath}/DeleteModuleServlet" method="get"
                      style="display: inline;">
                    <input type="hidden" name="course_id" value="<%= course_idStr %>">
                    <button class="btn" style="outline: none; color: #fff; background: red"
                            name="module_id" value="<%= module.getId() %>">
                        Delete
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
<div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCategoryModalLabel">Add New Module</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/AddModuleServlet" method="post">
                    <div class="mb-3">
                        <label for="Module Name" class="form-label">Modul Name</label>
                        <input type="text" class="form-control" id="Module Name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="productCategory" class="form-label">Course</label>
                        <select class="form-select" id="productCategory" name="course_id" required>
                            <%
                                CourseRepo courseRepo = new CourseRepo();
                                List<Course> courseList =  courseRepo.get(Course.class);
                                for (Course course : courseList) {

                            %>
                            <option value="<%= course.getId() %>"><%= course.getName() %>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Add Module</button>
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
