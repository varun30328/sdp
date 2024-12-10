<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Daily Tracker Entry</title>
    
<%@include file="usernavbar.jsp" %>
 
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
    *
    {
      margin:0;
      padding:0;
      font-family: 'Times New Roman', Times, serif;
     font-size: 22px; /* Ensure consistent font size */
    }
    
        body {
         font-family: 'Times New Roman', Times, serif;
         background: url(https://images.unsplash.com/photo-1495195129352-aeb325a55b65?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1776&q=80);
         background-size: cover;
         background-position: center;
         background-attachment: fixed;
         background-color: #f5f5f5;
         height:auto;
         color: #333;
         height: 140vh;
        }

        .container {
            width: 700px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }

        h3 {
            color: #3a0ca3;
            text-align: center;
        }

        form {
            text-align: center;
            margin-bottom: 20px;
        }

        form input[type="date"] {
            padding: 8px;
            font-size: 16px;
        }

        form button {
            padding: 8px 15px;
            font-size: 16px;
            color: #fff;
            background-color: #3a0ca3;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        form button:hover {
            background-color: #2a088e;
        }

        .card {
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            background-color: #fff;
        }

        .card h4 {
            color: #3a0ca3;
            text-align: center;
            margin-bottom: 20px;
        }

        .card p {
            margin: 5px 0;
            font-size: 16px;
            color: #555;
        }

        canvas {
            margin: 20px auto;
            display: block;
        }
    </style>
</head>
<body>
<br><br><br>
<div class="container">
    <h3>View Daily Tracker Entry</h3>
    <br>

    <!-- Date Selection Form -->
    <form action="fetchdailytracker" method="post">
        <label for="date">Select Date:</label>
        <input type="date" id="date" name="date" required>
        <button type="submit">View Entry</button>
    </form>

    <!-- Display Data if Available -->
    <c:if test="${not empty entry}">
        <div class="card">
            <h4>Daily Tracker Entry for ${date}</h4>
            <p><strong>Meals:</strong> ${entry.meals}</p>
            <p><strong>Calories:</strong> ${entry.calories}</p>
            <p><strong>Protein:</strong> ${entry.protein} g</p>
            <p><strong>Water Intake:</strong> ${entry.water} liters</p>
            <p><strong>Steps Taken:</strong> ${entry.steps}</p>
            <p><strong>Sleep Duration:</strong> ${entry.sleep} hours</p>
            <p><strong>Workout Duration:</strong> ${entry.workout} minutes</p>
        </div>

        <!-- Chart Section -->
        <canvas id="dailyTrackerChart" width="400" height="400"></canvas>

        <script>
            // Fetch data from JSP variables
            const chartData = {
                labels: ['Meals', 'Calories', 'Protein (g)', 'Water Intake (liters)', 'Steps', 'Sleep (hours)', 'Workout (minutes)'],
                datasets: [{
                    data: [
                        ${entry.meals}, 
                        ${entry.calories}, 
                        ${entry.protein}, 
                        ${entry.water}, 
                        ${entry.steps}, 
                        ${entry.sleep}, 
                        ${entry.workout}
                    ],
                    backgroundColor: [
                        '#FF6384', // Red
                        '#36A2EB', // Blue
                        '#FFCE56', // Yellow
                        '#4BC0C0', // Green
                        '#9966FF', // Purple
                        '#FF9F40', // Orange
                        '#E7E9ED'  // Gray
                    ],
                }]
            };
            // Render Pie Chart
            const ctx = document.getElementById('dailyTrackerChart').getContext('2d');
            const dailyTrackerChart = new Chart(ctx, {
                type: 'pie',
                data: chartData,
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'bottom',
                        },
                    },
                },
            });
        </script>
    </c:if>

    <!-- Message if No Data Found -->
   
</div>

</body>
</html>