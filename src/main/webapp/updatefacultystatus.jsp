<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Faculty</title>
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
    <%@include file="adminnavbar.jsp" %>
    <h3>View All Faculty</h3>
    <table>
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>GENDER</th>
            <th>DATE OF BIRTH</th>
            <th>DEPARTMENT</th>
            <th>SALARY</th>
            <th>EMAIL</th>
            <th>CONTACT</th>
            <th>LOCATION</th>
            <th>STATUS</th>
            <th>ACTION</th>
        </tr>
        <c:forEach items="${facultylist}" var="faculty">
            <tr>
                <td><c:out value="${faculty.id}"/></td>
                <td><c:out value="${faculty.name}"/></td>
                <td><c:out value="${faculty.gender}"/></td>
                <td><c:out value="${faculty.dateofbirth}"/></td>
                <td><c:out value="${faculty.department}"/></td>
                <td><c:out value="${faculty.salary}"/></td>
                <td><c:out value="${faculty.email}"/></td>
                <td><c:out value="${faculty.contact}"/></td>
                <td><c:out value="${faculty.location}"/></td>
                <td><c:out value="${faculty.status}"/></td>
                <td>
                    <a class="updated-button" href='<c:url value="updatestatus?id=${faculty.id}&status=Accepted"></c:url>'>Accept</a>
                    <a class="update-button" href='<c:url value="updatestatus?id=${faculty.id}&status=Rejected"></c:url>'>Reject</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>