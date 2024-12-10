<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Resources</title>
    <style>
    
    * {
    padding: 0;
    margin: 0;
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
        
        


        h3 {
            text-align: center;
            font-size: 2.5rem;
            margin: 20px 0;
            color: black;
        }

        .container {
            width: 90%;
            margin: auto;
            padding: 20px;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .card {
            background-color: #25273d;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            width: calc(33.333% - 20px);
            min-width: 280px;
            max-width: 350px;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
        }

        .card-header {
            background-color: #f9b234;
            padding: 10px;
            text-align: center;
            font-size: 1.2rem;
            font-weight: bold;
            color: #1a1a2e;
        }

        .card-body {
            padding: 15px;
        }

        .card-field {
            margin: 10px 0;
            color: #ffffff; /* Ensures side text is white */
        }

        .card-field span {
            font-weight: bold;
            color: #f9b234;
        }

        .card-field a {
            color: #f9b234;
            text-decoration: none;
        }

        .card-field a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .card {
                width: calc(50% - 20px);
            }
        }

        @media (max-width: 480px) {
            .card {
                width: 100%;
            }
        }
    </style>
</head>

<body>
    <%@ include file="usernavbar.jsp" %>

    <h3>View All Resources</h3>

    <div class="container">
    <br> 
        <div class="card-container">
            <c:forEach items="${list}" var="resource">
                <div class="card">
                    <div class="card-header">
                        <c:out value="${resource.title}" />
                    </div>
                    <div class="card-body">
                        <div class="card-field">
                            <span>Description:</span> <c:out value="${resource.description}" />
                        </div>
                        <div class="card-field">
                            <span>URL:</span> 
                            <a href="<c:url value='${resource.url}' />" target="_blank">Visit Resource</a>
                        </div>
                        <div class="card-field">
                            <span>Recommended By:</span> <c:out value="${resource.recommendedBy}" />
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>

</html>
