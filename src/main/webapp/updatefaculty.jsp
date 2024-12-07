<%@page import="com.klef.jfsd.springboot.models.Faculty"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Faculty</title>
    <style>
        /* CSS Variables for Dark Theme */
        :root {
            --first-color: hsl(228, 70%, 63%);
            --background-light: hsl(228, 18%, 96%);
            --title-color: hsl(228, 12%, 61%);
            --text-color: hsl(228, 12%, 61%);
            --dark-background: hsl(228, 24%, 16%);
            --body-color: hsl(228, 24%, 16%);
            --shadow-color: hsla(228, 80%, 20%, 0.3);
        }

        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--dark-background);
            color: var(--text-color);
            padding: 200px 20px 20px 500px;
            transition: background-color 0.4s, color 0.4s;
        }

        /* Dark theme styles */
        body.dark-theme {
            background-color: var(--body-color);
            color: var(--text-color);
        }

        .main {
            max-width: 1000px;
            margin: auto;
            padding: 20px 20px 20px 20px;
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

        .form-container {
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 12px;
        }

        label {
            font-weight: bold;
            color: var(--text-color);
            transition: color 0.4s;
        }

        body.dark-theme label {
            color: var(--first-color);
        }

        input[type="text"],
        input[type="date"],
        input[type="number"],
        input[type="email"],
        input[type="password"],
        textarea,
        input[type="file"] {
            width: 100%;
            padding: 8px;
            margin: 4px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            transition: background-color 0.4s, color 0.4s, border-color 0.4s;
        }

        textarea {
            resize: vertical;
            height: 60px;
        }
        body.dark-theme input[type="text"],
        body.dark-theme input[type="date"],
        body.dark-theme input[type="number"],
        body.dark-theme input[type="email"],
        body.dark-theme input[type="password"],
        body.dark-theme textarea,
        body.dark-theme input[type="file"] {
            background-color: #333;
            color: #ddd;
            border-color: #555;
        }

        .gender-radio {
            display: flex;
            gap: 10px;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        .button {
            background-color: var(--first-color);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.4s;
        }

        .button:hover {
            background-color: #006b99;
        }

        .theme-toggle {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 10px 15px;
            background-color: var(--shadow-color);
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.4s, color 0.4s;
        }
        body.dark-theme .theme-toggle {
            background-color: var(--first-color);
            color: #333;
        }

        .theme-toggle:hover {
            background-color: var(--first-color);
            color: white;
        }
    </style>
</head>
<body>
  <%@include file="facultynavbar.jsp" %>
   <h4 align="center" style="color:red">
  <c:out value="${message}"></c:out>
  </h4>
  
    <h3 style="text-align: center;"><u>Update Faculty Profile</u></h3>
    <div class="form-container">
        <form method="post" action="updatefacultyprofile">
            <table>
                <tr>
                    <td><label for="fid">Faculty ID</label></td>
                    <td><input type="number" id="fid" name="fid" readonly value="<%= faculty.getId() %>" required/></td>
                </tr>
               <tr>
                    <td><label for="fname">Enter Name</label></td>
                    <td><input type="text" id="fname" name="fname" value="<%= faculty.getName() %>" required/></td>
                </tr>
<%--                 <tr>
                    <td><label>Select Gender</label></td>
                    <td>
                        <input type="radio" id="male" name="fgender" value="MALE" <%= faculty.getGender().equals("MALE") ? "checked" : "" %> required/>
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="fgender" value="FEMALE" <%= faculty.getGender().equals("FEMALE") ? "checked" : "" %> required/>
                        <label for="female">Female</label>
                        <input type="radio" id="others" name="fgender" value="OTHERS" <%= faculty.getGender().equals("OTHERS") ? "checked" : "" %> required/>
                        <label for="others">Others</label>
                    </td>
                </tr> --%>
                <tr>
                    <td><label for="fdob">Enter Date of Birth</label></td>
                    <td><input type="date" id="fdob" name="fdob" value="<%= faculty.getDateofbirth() %>" required/></td>
                </tr>
         
     
                    <td><label for="femail">Enter Email ID</label></td>
                    <td><input type="email" id="femail" name="femail" readonly value="<%= faculty.getEmail() %>" required/></td>
                </tr>
                
                 <td><label for="fpassword">Enter Password ID</label></td>
                    <td><input type="password" id="fpassword" name="fpassword" value="<%= faculty.getPassword() %>" required/></td>
                </tr>
               
                    <td><label for="fcontact">Enter Contact</label></td>
                    <td><input type="number" id="fcontact" name="fcontact" value="<%= faculty.getContact() %>" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Update"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
