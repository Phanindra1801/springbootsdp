<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="java.util.Base64, java.sql.Blob, java.io.InputStream" %>
<%@ include file="administratornavbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Events</title>
    <style>
        /* Add Event button styling */
        .add-event-container {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .add-event-button {
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #28a745;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .add-event-button:hover {
            background-color: #218838;
        }

        /* Event cards container */
        .events-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        /* Event card styling */
        .event-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .event-card:hover {
            transform: translateY(-5px);
        }

        .event-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        .event-details {
            font-size: 14px;
            color: #666;
            margin-bottom: 15px;
        }

        .view-button {
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .view-button:hover {
            background-color: #0056b3;
        }

        .event-image {
            width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<div class="add-event-container">
    <a href="addEventForm" class="add-event-button">Add Event</a>
</div>

<div class="events-container">
    <c:forEach items="${eventList}" var="event">
        <div class="event-card">
            <!-- Display Event Image -->
            <c:choose>
                <c:when test="${not empty event.image}">
                    <%
                        Blob blob = (Blob) pageContext.findAttribute("event.image");
                        if (blob != null) {
                            InputStream inputStream = blob.getBinaryStream();
                            byte[] imageBytes = inputStream.readAllBytes();
                            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                    %>
                    <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Event Image" class="event-image">
                    <%
                        }
                    %>
                </c:when>
                <c:otherwise>
                    <img src="default-image.jpg" alt="Default Image" class="event-image">
                </c:otherwise>
            </c:choose>

            <div class="event-title"><c:out value="${event.name}" /></div>
            <div class="event-details"><c:out value="${event.description}" /></div>
            <div class="event-details"><strong>Date:</strong> <c:out value="${event.date}" /></div>
            <div class="event-details"><strong>Location:</strong> <c:out value="${event.location}" /></div>
            <a href="viewEventDetails.jsp?eventId=${event.id}" class="view-button">View</a>
        </div>
    </c:forEach>
</div>

</body>
</html>
