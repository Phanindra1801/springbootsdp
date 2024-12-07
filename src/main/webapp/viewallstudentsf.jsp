<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Employees</title>
        <style>
        :root {
            --first-color: hsl(228, 70%, 63%);
            --background-light: hsl(228, 18%, 96%);
            --title-color: hsl(228, 12%, 61%);
            --text-color: hsl(228, 12%, 61%);
            --dark-background: hsl(228, 24%, 16%);
            --body-color: hsl(228, 24%, 16%);
            --shadow-color: hsla(228, 80%, 20%, 0.3);
        }

        * {
            margin: 0;
            padding: 10;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--dark-background);
            color: var(--text-color);
            padding: 150px 10px 20px 300px;
            transition: background-color 0.4s, color 0.4s;
        }

        body.dark-theme {
            background-color: var(--body-color);
            color: var(--text-color);
        }

        .main {
            max-width: 1000px;
            margin: auto;
            padding: 20px;
            background-color: #f7f7f7;
            border-radius: 8px;
            transition: background-color 0.4s, color 0.4s;
        }

        body.dark-theme .main {
            background-color: #0000;
        }

        h3 {
            color: var(--title-color);
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: 600;
            transition: color 0.4s;
        }

        body.dark-theme h3 {
            color: var(--first-color);
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: var(--background-light);
            transition: background-color 0.4s, color 0.4s;
        }

        body.dark-theme table {
            background-color: var(--body-color);
            box-shadow: 0 0 10px var(--shadow-color);
        }

        table th,
        table td {
            padding: 10px;
            text-align: left;
            border: 1px solid var(--text-color);
            transition: background-color 0.4s, color 0.4s, border-color 0.4s;
        }

        table tr:nth-child(even) {
            background-color: hsl(228, 18%, 90%);
        }

        body.dark-theme table tr:nth-child(even) {
            background-color: hsl(228, 24%, 20%);
        }

        table th {
            background-color: var(--first-color);
            color: white;
        }

        body.dark-theme table th {
            background-color: var(--first-color);
            color: var(--dark-background);
        }

        table td {
            color: var(--text-color);
        }

        body.dark-theme table td {
            color: #ddd;
        }

        .updated-button {
            color: white;
            background-color: green;
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 4px;
        }

        .update-button {
            color: white;
            background-color: red;
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 4px;
        }

        .updated-button:hover {
            background-color: darkgreen;
        }

        .update-button:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>
     <%@include file="facultynavbar.jsp" %>
    <h3 style="text-align: center;">View All Students</h3>
    <table>
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>GENDER</th>
            <th>DATE OF BIRTH</th>
            <th>DEPARTMENT</th>
            <th>YEAR</th>
            <th>LOCATION</th>
            <th>EMAIL</th>
            <th>CONTACT</th>
            <th>PARENT CONTACT</th>
        </tr>
        <c:forEach items="${studentlist}" var="student">
            <tr>
                <td><c:out value="${student.id}"/></td>
                <td><c:out value="${student.name}"/></td>
                <td><c:out value="${student.gender}"/></td>
                <td><c:out value="${student.dateofbirth}"/></td>
                <td><c:out value="${student.department}"/></td>
                <td><c:out value="${student.yearofstudy}"/></td>
                <td><c:out value="${student.email}"/></td>
                <td><c:out value="${student.contact}"/></td>
                <td><c:out value="${student.parentcontact}"/></td>
                <td><c:out value="${student.address}"/></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
