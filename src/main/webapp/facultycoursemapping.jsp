<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>JPA Mapping</title>
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
        padding: 0;
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
        font-size: 24px;
        font-weight: 600;
        transition: color 0.4s;
    }

    body.dark-theme h3 {
        color: var(--first-color);
    }

    .form-container {
        width: 80%;
        margin: 0 auto;
        background-color: var(--background-light);
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        transition: background-color 0.4s, color 0.4s;
    }

    body.dark-theme .form-container {
        background-color: var(--body-color);
        box-shadow: 0 0 10px var(--shadow-color);
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        font-weight: bold;
        display: block;
        margin-bottom: 8px;
    }

    .form-group select,
    .form-group input[type="number"],
    .form-group input[type="text"],
    .form-group input[type="email"],
    .form-group input[type="password"],
    .form-group textarea {
        width: 100%;
        padding: 10px;
        border-radius: 4px;
        border: 1px solid var(--text-color);
        box-sizing: border-box;
    }

    .form-group select:focus,
    .form-group input[type="number"]:focus,
    .form-group input[type="text"]:focus,
    .form-group input[type="email"]:focus,
    .form-group input[type="password"]:focus {
        outline-color: var(--first-color);
    }

    .button-container {
        display: flex;
        justify-content: center;
        gap: 20px;
    }

    .button {
        padding: 8px 16px;
        background-color: #4CAF50;
        color: white;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
    }

    .button-delete {
        background-color: #f44336;
    }

    .button:hover {
        background-color: #45a049;
    }

    .button-delete:hover {
        background-color: #e53935;
    }

    .button-container input[type="reset"] {
        background-color: #f44336;
    }

  </style>
</head>
<%@include file="administratornavbar.jsp" %>
<body>

<h3>${message}</h3>
<form method="post" action="fcoursemappinginsert">
  <div class="form-container">
    <div class="form-group">
      <label for="fid">Select Faculty</label>
      <select name="fid" id="fid" required>
        <option value="">--Select--</option>
        <c:forEach items="${facultydata}" var="faculty">
          <option value="${faculty.id}">${faculty.id}-${faculty.name}</option>
        </c:forEach>
      </select>
    </div>

    <div class="form-group">
      <label for="cid">Select Course</label>
      <select name="cid" id="cid" required>
        <option value="">--Select--</option>
        <c:forEach items="${coursedata}" var="course">
          <option value="${course.id}">${course.courseCode}-${course.courseName}</option>
        </c:forEach>
      </select>
    </div>

    <div class="form-group">
      <label for="section">Provide Section</label>
      <input type="number" name="section" id="section" min="1" max="10" required>
    </div>

    <div class="form-group">
      <label for="ftype">Select Faculty Type</label>
      <select name="ftype" id="ftype" required>
        <option value="">--Select--</option>
        <option value="MAIN">Main Faculty</option>
        <option value="ASSISTANCE">Assistance Faculty</option>
      </select>
    </div>

    <div class="button-container">
      <input type="submit" name="Submit" value="Submit" class="button">
      <input type="reset" name="Clear" value="Clear" class="button button-delete">
    </div>
  </div>
</form>

</body>
</html>
