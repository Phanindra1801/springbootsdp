<%@page import="com.klef.jfsd.springboot.models.Administrator"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ERP</title>
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
            padding: 20px 20px 20px 250px;
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
    <%@include file="administratornavbar.jsp" %>
    <main class="main container" id="main">
        <section class="content">
    <h3 style="text-align: center;">Add Course</h3>
    <div class="form-container">
        <form action="insertcourse" method="post" enctype="multipart/form-data">
            <table align="center">
                <tr>
                    <td><label>Course Name</label></td>
                    <td><input type="text" name="courseName" placeholder="Enter Course Name" required /></td>
                </tr>

                <tr>
                    <td><label>Course Code</label></td>
                    <td><input type="text" name="courseCode" placeholder="Enter Course Code" required /></td>
                </tr>

                <tr>
                    <td><label>Credits</label></td>
                    <td><input type="number" name="credits" placeholder="Enter Credits" min="1" required /></td>
                </tr>

                <tr>
                    <td><label>Department</label></td>
                    <td><input type="text" name="department" placeholder="Enter Department" required /></td>
                </tr>

                <tr>
                    <td><label>LTPS (e.g., 3-1-0-2)</label></td>
                    <td><input type="text" name="ltps" placeholder="Enter LTPS" required /></td>
                </tr>

                <tr>
                    <td><label>Course Coordinator</label></td>
                    <td><input type="text" name="courseCoordinator" placeholder="Enter Coordinator Name" required /></td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Add Course" class="button" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</section>
    </main>

    <script>
        function toggleTheme() {
            document.body.classList.toggle('dark-theme');
        }
    </script>
</body>
</html>
