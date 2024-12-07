<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Attendance</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
        background-color: #f8f9fa;
    }

    .navbar {
        position: fixed;
        width: -10%; /* Adjust this based on your navbar width */
        height: 100vh;
        background-color: #343a40;
        padding: 10px;
        color: white;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    }

    .content {
        margin-left: 22%; /* Same as the navbar width + some space */
        padding: 10px;
    }

    h2 {
        text-align: center;
        color: white;
        background-color: #343a40; /* Optional: Add a background for better visibility */
        padding: 10px 0;
        border-radius: 5px;
        margin-bottom: 20px;
    }

    table {
        width: 80%;
        margin: 0 auto; /* Center the table horizontally */
        border-collapse: collapse;
        text-align: center;
        background-color: #ffffff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    th, td {
        border: 1px solid #ddd;
        padding: 10px;
    }

    th {
        background-color: #6c757d;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }

    input[type="submit"] {
        display: block;
        margin: 20px auto;
        padding: 10px 20px;
        background-color: #6c757d;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    input[type="submit"]:hover {
        background-color: #5a6268;
    }

    .success-message {
        text-align: center;
        color: green;
        font-weight: bold;
        margin-bottom: 20px;
    }

    body {
        background-color: #343a40; /* Match your dark theme */
        transition: background-color 0.3s ease-in-out;
    }
</style>
<script>
    // JavaScript function to handle "Select All" functionality
    function toggleSelectAll(selectAllCheckbox) {
        const checkboxes = document.querySelectorAll('input[type="checkbox"][name^="att"]');
        checkboxes.forEach(checkbox => checkbox.checked = selectAllCheckbox.checked);
    }
</script>
</head>
<body>
    <div class="navbar">
        <%@include file="facultynavbar.jsp" %>
    </div>

    <div class="content">
        <h2><u>Post Attendance</u></h2>
        
        <!-- Success message display -->
        <c:if test="${not empty successMessage}">
            <div class="success-message">
                <c:out value="${successMessage}" />
            </div>
        </c:if>
        
        <form method="post" action="/postatt">
            <table>
                <tr>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>DEPARTMENT</th>
                    <th>YEAR OF STUDY</th>
                    <th>
                        Attendance
                        <br>
                        <input type="checkbox" onclick="toggleSelectAll(this)" /> Select All
                    </th>
                </tr>
                <c:forEach items="${stulist}" var="stu">
                    <tr>
                        <td><c:out value="${stu.id}"/></td>
                        <td><c:out value="${stu.name}"/></td>
                        <td><c:out value="${stu.department}"/></td>
                        <td><c:out value="${stu.yearofstudy}"/></td>
                        <td>
                            <input type="text" hidden="true" name="id${stu.id}" value="${stu.id}" />
                            <input type="text" hidden="true" name="name${stu.id}" value="${stu.name}" />
                            <input type="checkbox" name="att${stu.id}" />
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <input type="submit" value="Post" />
        </form>
    </div>
</body>
</html>
