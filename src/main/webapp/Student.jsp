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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
