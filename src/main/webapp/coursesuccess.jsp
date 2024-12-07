<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>

<head>
    <meta charset="UTF-8">
    <title>Registration Success</title>
    <style>
        /* Style for centering the message */
        .message-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
            font-size: 1.5em;
        }
    </style>
</head>

<body>
    <%@ include file="administratornavbar.jsp" %>

    <div class="message-container">
        <c:out value="${message}"></c:out>
    </div>
</body>

</html>
