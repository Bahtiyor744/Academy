<%@ page import="java.util.List" %>
<%@ page import="com.example.academy.repos.PaymentRepo" %>
<%@ page import="com.example.academy.entity.Payment" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
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
        Student`s Payments
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
            <th>Amount</th>
            <th>Pay Type</th>
            <th>Date</th>
            <th>Student</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            String student_id = request.getParameter("student_id");
            PaymentRepo paymentRepo = new PaymentRepo();
            List<Payment> paymentList = paymentRepo.get(Payment.class);
            String group_id = request.getParameter("group_id") ;
            int sum = 0;
            for (Payment payment : paymentList) {
                if (payment.getStudent().getId() == Integer.parseInt(student_id)){
                    sum += payment.getAmount();
        %>

        <tr>
            <td>
                <%= payment.getId() %>
            </td>
            <td>
                <%= payment.getAmount() %>
            </td>
            <td>
                <%= payment.getPayType() %>
            </td>
            <td>
                <%= payment.getDate().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm")) %>
            </td>
            <td>
                <%= payment.getStudent().getFirstName() + " " + payment.getStudent().getLastName() %>
            </td>
            <td>
                <form action="${pageContext.request.contextPath}/DeletePaymentServlet" method="post"
                      style="display: inline;">
                    <input type="hidden" name="student_id" value="<%= student_id %>">
                    <input type="hidden" name="group_id" value="<%= group_id %>">
                    <button class="btn" style="outline: none; color: #fff; background: red"
                            name="payment_id" value="<%= payment.getId() %>">
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
        <form action="Student.jsp" method="get">
            <button class="btn btn-lg btn-primary" style="outline: none; background: steelblue; color: #ffffff;"
                    name="group_id" value="<%= group_id %>">
                Back
            </button>
        </form>
    </div>
</div>
<div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCategoryModalLabel">Add New Payment</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/AddPaymentServlet" method="post">
                    <div class="mb-3">
                        <label for="Amount" class="form-label">Amount</label>
                        <input type="text" class="form-control" id="Amount" name="amount" required>
                    </div>
                    <label for="PayType" class="form-label">Pay Type</label>
                    <select class="form-select" id="PayType" name="type" required>
                        <option value="CASH">CASH</option>
                        <option value="BANK">BANK</option>
                        <option value="CARD">CARD</option>
                    </select>
                    <input type="hidden" name="student_id" value="<%=student_id%>">
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Add Payment</button>
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
