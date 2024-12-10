<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Project</title>
    <style>
   * {
    padding: 0;
    margin: auto;
    font-family: 'Times New Roman', Times, serif;
    font-size: 18px; /* Ensure consistent font size */
    }
    
        body 
        {
        display: block;
        background: url(https://images.unsplash.com/photo-1495195129352-aeb325a55b65?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1776&q=80);
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
        height: auto;
        padding: 10px;
        
        }

        h1 {
            color: white;
            text-align: center;
            font-size: 20px;
            margin: 20px 0;
        }

        .container {
            width: 90%;
            max-width: 800px;
            margin: 20px auto;
        }

        .diet-card {
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            margin: 20px 0;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .diet-card:hover {
            transform: scale(1.02);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
        }

        .diet-header {
            background-color: #ff6f61;
            color: #fff;
            padding: 15px;
            font-size: 1.5rem;
            text-align: center;
        }

        .diet-content {
            padding: 20px;
        }

        .diet-field {
            font-size: 1rem;
            color: #555;
            margin: 10px 0;
        }

        .diet-field span {
            font-weight: bold;
            color: #ff6f61;
        }

        a {
            color: #ff6f61;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            h3 {
                font-size: 2rem;
            }

            .diet-content {
                padding: 15px;
            }

            .diet-header {
                font-size: 1.2rem;
            }
        }
    </style>
</head>

<body>
    <%@ include file="usernavbar.jsp" %>

    <h1><u>View All Diet Plans</u></h1>

    <div class="container">
        <c:forEach items="${lists}" var="list">
            <div class="diet-card">
                <div class="diet-header">
                    <c:out value="${list.dietType}" />
                </div>
                <div class="diet-content">
                    <div class="diet-field">
                        <span>Dietary Custom:</span> <c:out value="${list.dietaryCustom}" />
                    </div>
                    <div class="diet-field">
                        <span>Breakfast:</span> <c:out value="${list.breakfast}" />
                    </div>
                    <div class="diet-field">
                        <span>Lunch:</span> <c:out value="${list.lunch}" />
                    </div>
                    <div class="diet-field">
                        <span>Dinner:</span> <c:out value="${list.dinner}" />
                    </div>
                    <div class="diet-field">
                        <span>Snack:</span> <c:out value="${list.snack}" />
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <br> <br> <br> <br>     <br> <br> <br> <br>     <br> <br> <br> <br>     <br> <br> <br> <br>     <br> <br> <br> <br>    <br> <br> <br> <br>
</body>

</html>
