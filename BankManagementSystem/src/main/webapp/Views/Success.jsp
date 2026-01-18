<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>All Account Holders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container-fluid mt-5 px-4">
        <div class="card shadow">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-middle">
                <h4 class="mb-0">SBI Digital - Registered Account Holders</h4>
                <a href="/register" class="btn btn-light btn-sm">+ New Account</a>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>Acc No</th>
                                <th>Name</th>
                                <th>Mobile</th>
                                <th>Aadhar</th>
                                <th>DOB</th>
                                <th>Age</th>
                                <th>Address</th>
                                <th>Pincode</th>
                                <th>Balance (₹)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="bank" items="${data}">
                                <tr>
                                    <td class="font-monospace fw-bold">${bank.accNo}</td>
                                    <td>${bank.name}</td>
                                    <td>${bank.mobNo}</td>
                                    <td>${bank.adharNo}</td>
                                    <td>${bank.dob}</td>
                                    <td>${bank.age}</td>
                                    <td>${bank.address}</td>
                                    <td>${bank.pincode}</td>
                                    <td class="text-success fw-bold">${bank.balance}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>