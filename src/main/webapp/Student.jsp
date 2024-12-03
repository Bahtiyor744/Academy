<%@ page import="java.util.List" %>
<%@ page import="com.example.academy.entity.Module" %>
<%@ page import="com.example.academy.repos.ModuleRepo" %>
<%@ page import="com.example.academy.repos.GroupsRepo" %>
<%@ page import="com.example.academy.entity.Groups" %>
<%@ page import="com.example.academy.repos.StudentRepo" %>
<%@ page import="com.example.academy.entity.Student" %>
<%@ page import="com.example.academy.repos.PaymentRepo" %>
<%@ page import="com.example.academy.entity.Payment" %><%--
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
        Student
    </h2>
    <button type="button" class="btn btn-primary"
            style="position: absolute; top: 50px; right: 110px; margin: 10px;"
            data-bs-toggle="modal" data-bs-target="#addCategoryModal">
        ADD
    </button>
    <table class="table table-bordered tablet-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
            <th>Phone</th>
            <th>Group Name</th>
            <th>Payments</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Payment> paymentList = PaymentRepo.getPaymentRepo();
            int group_id = Integer.parseInt(request.getParameter("group_id"));
            List<Student> students = StudentRepo.getStudentRepo();
            for (Student student : students) {
                int sum = 0;
                if (student.getGroups().getId() == group_id){
                    for (Payment payment : paymentList) {
                        if (payment.getStudent().getId().equals(student.getId())){
                            sum += payment.getAmount();
                        }
                    }
        %>

        <tr>
            <td>
                <%= student.getId() %>
            </td>
            <td>
                <%= student.getFirstName() %>
            </td>
            <td>
                <%= student.getLastName() %>
            </td>
            <td>
                <%= student.getAge() %>
            </td>
            <td>
                <%= student.getPhone() %>
            </td>
            <td>
                <%= student.getGroups().getName() %>
            </td>
            <td>
                <%= sum %>
            </td>
            <td>
                <form action="Student.jsp" method="get"
                      style="display: inline;">
                    <button class="btn" style="outline: none; color: #fff; background: red"
                            name="group_id" value="<%= student.getId() %>">
                        Add Payment
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
            <form action="Groups.jsp" method="get">
                <button class="btn btn-lg btn-primary" style="outline: none; background: steelblue; color: #ffffff;"
                        name="group_id" value="<%= group_id%>">
                    Back
                </button>
            </form>
        </div>
</div>
<div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCategoryModalLabel">Add New Student</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/AddStudentServlet" method="post">
                    <div class="mb-3">
                        <label for="First Name" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="First Name" name="firstName" required>
                    </div>
                    <div class="mb-3">
                        <label for="Last Name" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="Last Name" name="lastname" required>
                    </div>
                    <div class="mb-3">
                        <label for="Age" class="form-label">Age</label>
                        <input type="text" class="form-control" id="Age" name="age" required>
                    </div>
                    <div class="mb-3">
                        <label for="Phone" class="form-label">Phone</label>
                        <input type="text" class="form-control" id="Phone" name="phone" required>
                    </div>
                    <div class="mb-3">
                        <label for="productCategory" class="form-label">Groups</label>
                        <select class="form-select" id="productCategory" name="group_id" required>
                            <%
                                List<Groups> groupsList = GroupsRepo.getGroupsList();
                                for (Groups groups : groupsList) {
                            %>
                            <option value="<%= groups.getId() %>"><%= groups.getName() %>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Add Student</button>
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
