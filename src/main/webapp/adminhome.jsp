<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="navbar.css">
<style>
/* Dashboard Section Styling */
/* General Body Styling */
body {
    background: url(https://images.unsplash.com/photo-1495195129352-aeb325a55b65?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1776&q=80);
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    padding: 10px;
    font-family: 'Arial', sans-serif;
    color: #ffffff; /* Light text for contrast */
}

/* Dashboard Styling */
.dashboard {
    margin: 100px auto;
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    gap: 20px;
    max-width: 1200px;
}

/* Card Styling */
.card {
    background: rgba(0, 0, 0, 0.6); /* Dark transparent background */
    border-radius: 10px;
    box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.5); /* Enhanced shadow for depth */
    padding: 20px;
    width: 300px;
    text-align: left;
    position: relative;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    color: #ffffff; /* White text for readability */
}

.card:hover {
    transform: translateY(-10px);
    box-shadow: 0px 15px 25px rgba(0, 0, 0, 0.7); /* Increased shadow on hover */
    background: rgba(0, 0, 0, 0.8); /* Slightly darker on hover */
}

/* Icon Styling */
.card .icon {
    position: absolute;
    top: 20px;
    right: 20px;
    background: rgba(255, 255, 255, 0.2); /* Semi-transparent icon background */
    border-radius: 50%;
    width: 50px;
    height: 50px;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #38a169; /* Green for icons */
    font-size: 1.5em;
    transition: background 0.3s ease, color 0.3s ease;
}

.card .icon:hover {
    background: #38a169; /* Bright green on hover */
    color: #ffffff; /* White icon color on hover */
}

/* Text Styling */
.card h2 {
    font-size: 2em;
    margin: 0;
    color: #ffffff; /* White text */
}

.card p {
    margin: 10px 0 0;
    font-size: 1.2em;
    color: #d1d1d1; /* Light gray text */
}

/* Chart Section */
canvas {
    background: rgba(255, 255, 255, 0.1); /* Transparent chart background */
    border-radius: 10px;
    padding: 10px;
    box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3); /* Soft shadow for chart */
}
/* Chart Container Styling */
.chart-container {
    margin: 50px auto;
    text-align: center;
    width: 80%;
    background: rgba(0, 0, 0, 1.8); /* Dark transparent background */
    border-radius: 10px;
    box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.5); /* Enhanced shadow for depth */
    padding: 20px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.chart-container:hover {
    transform: translateY(-10px); /* Float effect on hover */
    box-shadow: 0px 15px 25px rgba(0, 0, 0, 0.7); /* Increased shadow on hover */
    background: rgba(0, 0, 0, 1.2); /* Slightly darker on hover */}

.chart-container h3 {
    color: #ffffff; /* White text */
    margin-bottom: 20px;
    font-size: 1.5em;
}
.daily-tracker-container {
    margin: 50px auto;
    text-align: center;
    width: 50%; /* Decreased the width */
    background: rgba(0, 0, 0, 1.8); /* Dark transparent background */
    border-radius: 10px;
    box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.5); /* Enhanced shadow */
    padding: 20px;
}

.daily-tracker-container:hover {
    transform: translateY(-10px); /* Float effect */
    box-shadow: 0px 15px 25px rgba(0, 0, 0, 1.7); /* Enhanced shadow */
    background: rgba(0, 0, 0, 1); /* Slightly darker on hover */
}

.daily-tracker-container h3 {
    color: #ffffff; /* White text */
    margin-bottom: 20px;
    font-size: 1.5em;
}

.daily-tracker-container canvas {
    max-width: 100%; /* Ensures the chart fits within the container */
    height: auto; /* Adjusts the height automatically */
}



</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<!-- Include Navbar -->
<%@ include file="adminnavbar.jsp" %>

<!-- Dashboard Content -->
<div class="dashboard">
    <div class="card">
        <div class="icon">
            <i>&#128100;</i>
        </div>
        <h2><c:out value="${userCount}" /></h2>
        <p>Total Clients</p>
    </div>
    <div class="card">
        <div class="icon">
            <i>&#x1F4CA;</i>
        </div>
        <h2><c:out value="${nutritionistCount}" /></h2>
        <p>Total Nutritionists</p>
    </div>
    <div class="card">
        <div class="icon">
            <i>&#x1F958;</i>
        </div>
        <h2>${recipeCount}</h2>
        <p>Total Recipes</p>
    </div>
</div>



<!-- Chart Section -->
<div class="chart-container">
    <h3>Monthly Registrations</h3>
    <canvas id="activityChart"></canvas>
</div>

<div class="daily-tracker-container">
    <h3>Daily Tracker Insights</h3>
    <canvas id="dailyTrackerChart"></canvas>
</div>



<!-- Separate Canvas for Workout Stats -->
<div class="chart-container">
    <h3>Workout Statistics</h3>
    <canvas id="workoutStatsChart"></canvas>
</div>


<script>
    fetch('/activityStats')
        .then(response => response.json())
        .then(data => {
            const months = Object.keys(data.userRegistrations);
            const userRegistrations = Object.values(data.userRegistrations);
            const nutritionistRegistrations = Object.values(data.nutritionistRegistrations);

            const ctx = document.getElementById('activityChart').getContext('2d');
            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: months,
                    datasets: [
                        {
                            label: 'User Registrations',
                            data: userRegistrations,
                            borderColor: 'rgba(255, 99, 132, 1)',
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderWidth: 2,
                        },
                        {
                            label: 'Nutritionist Registrations',
                            data: nutritionistRegistrations,
                            borderColor: 'rgba(75, 192, 192, 1)',
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderWidth: 2,
                        }
                    ]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        title: {
                            display: true,
                            text: 'Monthly Registrations'
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        })
        .catch(error => console.error('Error fetching activity stats:', error));
    fetch('/dailyTrackerInsights')
    .then(response => response.json())
    .then(data => {
        const labels = Object.keys(data); // E.g., ['Water', 'Steps', 'Sleep', ...]
        const values = Object.values(data); // E.g., [2, 5000, 7, ...]

        const ctx = document.getElementById('dailyTrackerChart').getContext('2d');
        new Chart(ctx, {
            type: 'doughnut', // Doughnut chart type
            data: {
                labels: labels,
                datasets: [{
                    label: 'Daily Tracker Insights',
                    data: values,
                    backgroundColor: [
                        '#FF6384', '#36A2EB', '#FFCE56',
                        '#4BC0C0', '#9966FF', '#FF9F40', '#C9CBCF'
                    ],
                    borderColor: '#000000', // Gap color (Black or White)
                    borderWidth: 4, // Creates the gaps between segments
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'right', // Legend position
                        labels: {
                            boxWidth: 20,
                            padding: 15,
                        },
                    },
                    title: {
                        display: true,
                        text: 'Daily Tracker Insights',
                    },
                },
                cutout: '70%', // Inner radius for the doughnut effect
            }
        });
    })
    .catch(error => console.error('Error fetching tracker insights:', error));
    
    fetch('/workoutStats')
    .then(response => response.json())
    .then(data => {
        // Ensure the data is in the expected format
        if (data && data.type && data.difficulty) {
            const types = Object.keys(data.type); // Workout types
            const typeCounts = Object.values(data.type); // Count per type
            const difficulties = Object.keys(data.difficulty); // Difficulty levels
            const difficultyCounts = Object.values(data.difficulty); // Count per difficulty

            // Create chart on the correct canvas for workout stats
            const ctx = document.getElementById('workoutStatsChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar', // Using 'bar' chart type for workout stats
                data: {
                    labels: types, // The workout types will be the X-axis labels
                    datasets: [
                        {
                            label: 'Workout Types', // Dataset 1: Workout Types
                            data: typeCounts, // Data for Workout Types
                            backgroundColor: 'rgba(54, 162, 235, 0.6)', // Blue color
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1,
                        },
                        {
                            label: 'Difficulty Levels', // Dataset 2: Difficulty Levels
                            data: difficultyCounts, // Data for Difficulty Levels
                            backgroundColor: 'rgba(255, 99, 132, 0.6)', // Red color
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1,
                        }
                    ]
                },
                options: {
                    responsive: true, // Ensure the chart is responsive
                    plugins: {
                        legend: {
                            position: 'top', // Position of the legend
                        },
                        title: {
                            display: true,
                            text: 'Workout Statistics', // Title of the chart
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true, // Ensure the Y-axis starts at 0
                        }
                    }
                }
            });
        } else {
            console.error('Invalid workout stats data:', data);
        }
    })
    .catch(error => console.error('Error fetching workout stats:', error));



</script>
</body>
</html>