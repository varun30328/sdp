<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Workout Card Search</title>
    <style>
        /* General Styling */
        body {
            background: url(https://images.unsplash.com/photo-1495195129352-aeb325a55b65?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1776&q=80);
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: 'Times New Roman', Times, serif;
            font-size: 22px;
            padding: 20px;
        }

        .search-bar {
            margin: 20px auto;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
        }

        .search-bar input {
            width: 60%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .card-container {
            margin: 25px auto;
            width: 80%;
            max-width: 700px;
        }

        .card {
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .card-body {
            flex: 1;
        }

        .card-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .card-description {
            font-size: 16px;
            margin: 10px 0;
            color: #666;
        }

        .card img {
            width: 330px;
            height: 300px;
            border-radius: 10px;
        }
    </style>
    <script>
        function filterCards() {
            const searchValue = document.getElementById("searchInput").value.toUpperCase();
            const cards = document.getElementsByClassName("card");
            for (let i = 0; i < cards.length; i++) {
                const titleElement = cards[i].querySelector(".card-title");
                if (titleElement) {
                    const title = titleElement.textContent || titleElement.innerText;
                    if (title.toUpperCase().indexOf(searchValue) > -1) {
                        cards[i].style.display = ""; // Show the card
                    } else {
                        cards[i].style.display = "none"; // Hide the card
                    }
                }
            }
        }
    </script>
</head>
<body>
    <%@ include file="usernavbar.jsp" %>
    <br><br><br>

    <!-- Search Bar -->
    <div class="search-bar">
        <input
            type="text"
            id="searchInput"
            onkeyup="filterCards()"
            placeholder="Search for workouts..."
        />
    </div>

    <!-- Workout Cards -->
    <c:forEach items="${list}" var="workout">
        <div class="card-container">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title">Workout Name: <c:out value="${workout.name}" /></h2>
                    <p class="card-description">Sets and Repetitions: <c:out value="${workout.setsandrepetitions}" /></p>
                    <p class="card-description">Type: <c:out value="${workout.type}" /></p>
                    <p class="card-description">Equipment: <c:out value="${workout.equipment}" /></p>
                    <p class="card-description">Duration (mins): <c:out value="${workout.duration}" /></p>
                    <p class="card-description">Instructions: <c:out value="${workout.instructions}" /></p>
                    <p class="card-description"><a href="${workout.url}" target="_blank">Click Here</a></p>
                </div>
                <img src="displayworkoutimage?id=${workout.id}" alt="Workout Image">
            </div>
        </div>
    </c:forEach>
</body>
</html>