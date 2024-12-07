<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Sports Event</title>
    <style>
        /* Container styling */
        .event-form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-color: #f4f4f4;
            margin-left: 3%;
        }

        /* Form styling */
        .event-form {
            width: 100%;
            max-width: 600px;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            color: #333;
        }

        .event-form h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .event-form label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #555;
        }

        .event-form input, .event-form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
            color: #333;
        }

        .event-form input::placeholder {
            color: #bbb;
        }

        .event-form button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 4px;
            background-color: #28a745;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .event-form button:hover {
            background-color:  #3498db;
        }

        /* Responsive styling */
        @media (max-width: 480px) {
            .event-form {
                padding: 20px;
            }

            .event-form h2 {
                font-size: 20px;
            }

            .event-form input, .event-form button {
                font-size: 14px;
                padding: 8px;
            }
        }
    </style>
</head>
<body>
<%@ include file="administratornavbar.jsp" %>

<div class="event-form-container">
    <form class="event-form" method="post" action="insertSportsEvent" enctype="multipart/form-data">
        <h2>Add Sports Event</h2>

        <label for="eventName">Event Name</label>
        <input type="text" id="eventName" name="eventName" placeholder="Enter Event Name" required>

        <label for="eventDescription">Event Description</label>
        <input type="text" id="eventDescription" name="eventDescription" placeholder="Enter Event Description" required>

        <label for="eventDate">Event Date</label>
        <input type="date" id="eventDate" name="eventDate" required>

        <label for="eventLocation">Event Location</label>
        <input type="text" id="eventLocation" name="eventLocation" placeholder="Enter Event Location" required>

        <label for="sportType">Type of Sport</label>
        <select id="sportType" name="sportType" required>
            <option value="Football">Football</option>
            <option value="Basketball">Basketball</option>
            <option value="Cricket">Cricket</option>
            <option value="Tennis">Tennis</option>
            <option value="Badminton">Badminton</option>
            <option value="Athletics">Athletics</option>
            <option value="Swimming">Swimming</option>
            <option value="Volleyball">Volleyball</option>
            <option value="Other">Other</option>
        </select>

        <!-- Image upload field -->
        <label for="eventImage">Event Image</label>
        <input type="file" id="eventImage" name="eventImage" accept="image/*">

        <button type="submit">Add Event</button>
    </form>
</div>

</body>
</html>
