<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>View All Recipes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <%@include file="usernavbar.jsp" %>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,900;1,400;1,900&display=swap');

        * {
            padding: 0;
            margin: 0;
            font-family: 'Times New Roman', Times, serif;
            font-size: 22px;
        }

        body {
            background: url(https://images.unsplash.com/photo-1495195129352-aeb325a55b65?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1776&q=80);
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            padding: 10px;
        }

   .search-bar {
    margin: 20px auto;
    display: flex;
    align-items: center; /* Aligns the icon and input field vertically */
    justify-content: center;
    width: 100%;
}

.search-bar .search-icon {
    margin-right: 20px; /* Adds space between the icon and input field */
    color: #ccc; /* Icon color */
}

.search-bar input {
    width: 60%;
    padding: 12px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}
 
        .container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            margin-top: 20px;
        }

        .card {
            background-color: #1D1C20;
            color: white;
            width: 300px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 15px 20px rgba(0, 0, 0, 0.5);
            transition: transform 0.3s ease;
            margin-bottom: 20px;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card-image {
            width: 100%;
            height: 200px;
            overflow: hidden;
        }

        .card-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease, filter 0.3s ease;
        }

        .card-image img:hover {
            transform: scale(1.1);
            filter: brightness(1.2);
        }

        .card-text {
            padding: 20px;
        }

        .card-title {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        .card-meal-type,
        .card-body {
            font-size: 1rem;
            margin-bottom: 10px;
            line-height: 1.5;
        }

        .card-price {
            background-color: #970C0A;
            color: #fff;
            font-size: 1.5rem;
            text-align: center;
            padding: 10px;
            margin-top: 10px;
            border-radius: 4px;
        }

        /* Responsive design for cards */
        @media (max-width: 1200px) {
            .container {
                justify-content: space-evenly;
            }
        }

        @media (max-width: 768px) {
            .container {
                justify-content: center;
            }

            .card {
                width: 90%;
            }

            .search-bar input {
                width: 80%;
            }
        }

        @media (max-width: 480px) {
            .search-bar input {
                width: 100%;
            }

            .card {
                width: 100%;
            }
        }
    </style>

    <script>
        function filterCards() {
            const searchValue = document.getElementById("searchInput").value.toUpperCase();
            const cards = document.getElementsByClassName("card");
            for (let i = 0; i < cards.length; i++) {
                const title = cards[i].querySelector(".card-title").textContent.toUpperCase();
                if (title.indexOf(searchValue) > -1) {
                    cards[i].style.display = "";
                } else {
                    cards[i].style.display = "none";
                }
            }
        }
    </script>

</head>

<body>

    <div class="search-bar">
    <i class="fa fa-search" style="font-size:24px" class="search-icon"></i>
    <input type="text" id="searchInput" placeholder="Search by Recipe Name" onkeyup="filterCards()" />
</div>
<br>

    <!-- Container for cards -->
    <div class="container">
        <c:forEach items="${recipelist}" var="recipe">
            <div class="card">
                <div class="card-image">
                    <img src="displayrecipeimage?id=${recipe.id}" alt="Recipe Image">
                </div>
                <div class="card-text">
                    <h2 class="card-title">${recipe.name}</h2>
                    <p class="card-meal-type">Category: ${recipe.category}</p>
                    <p class="card-body">Level: ${recipe.level}</p>
                    <p class="card-body">${recipe.description}</p>
                    <p class="card-body">Preparation Time: ${recipe.prep}</p>
                    <p class="card-body">Nutrition Facts: ${recipe.nutritionfacts}</p>
                    <p class="card-price">Calories: ${recipe.calorie}</p>
                </div>
            </div>
        </c:forEach>
    </div>

</body>

</html>
