<%@ page import="com.klef.jfsd.springboot.models.Faculty" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
Faculty emp = (Faculty) session.getAttribute("faculty");
if (emp == null) {
    response.sendRedirect("sessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .profile-container {
            text-align: center;
            margin: 50px auto;
            padding: 20px;
            width: 60%;
            background-color: #ffffff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h3 {
            margin-bottom: 20px;
        }

        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #ccc;
        }

        .profile-details {
            margin-top: 20px;
        }

        b {
            font-weight: bold;
            color: #333;
        }

        div {
            line-height: 1.8;
        }

        /* Style for Edit button */
        form {
            margin-top: 20px;
        }

        button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <%@include file="facultynavbar.jsp" %>

    <div class="profile-container">
        <h3><u>My Profile</u></h3>

        <!-- Profile Details Section -->
        <div class="profile-details">
            <b>ID:</b> <%= emp.getId() %><br><br>
            <b>NAME:</b> <%= emp.getName() %><br><br>
            <b>GENDER:</b> <%= emp.getGender() %><br><br>
            <b>DATE OF BIRTH:</b> <%= emp.getDateofbirth() %><br><br>
            <b>EMAIL:</b> <%= emp.getEmail() %><br><br>
            <b>CONTACT:</b> <%= emp.getContact() %><br><br>
        </div>

        <!-- Edit Button Section -->
        <form action="updatefaculty.jsp" method="get">
            <button type="submit">Edit</button>
        </form>
    </div>
</body>
</html>
