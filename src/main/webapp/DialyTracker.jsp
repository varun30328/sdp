<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Daily Tracker</title>
    <%@include file="usernavbar.jsp" %>
 <br>

    <style type="text/css">
    
    * {
    padding: 0;
    margin: 0;
    font-family: 'Times New Roman', Times, serif;
    font-size: 22px; /* Ensure consistent font size */
}

body {
    display: block;
    background: url(https://images.unsplash.com/photo-1495195129352-aeb325a55b65?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1776&q=80);
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    background-repeat:no-repeat;
    height: 120vh;
    padding: 10px;
}

h2, h3 {
    font-family: serif;
    color: navy;
    font-size: 22px;
    text-align: center;
}

    /* Main container styling */
    .container {
        display: flex;
        width: 700px;
        margin: 30px auto;
        padding: 20px;
        gap: 10px;
    }

    .tracker-container {
        width: 100%;
        background-color: #b4b2b3; /* Dark Purple */
        color: #f1f1f1;
        padding: 10px;
        border-radius: 10px;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.5);
    }

    .tracker-container h1 {
        color: #FF6384; /* Red */
        text-align: center;
        font-size: 32px;
        font-weight: bolder;
        margin-bottom: 20px;
    }

    /* Form styling */
    form {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    form label {
        font-weight: bold;
        color: black;
    }

    form input, form textarea {
        padding: 10px;
        font-size: 16px;
        border:2px solid white; /* Purple */
        border-radius: 5px;
        background-color:#dcc1ac;
        color:#c13e52;
    }

    form input:focus, form textarea:focus {
        outline: none;
        border-color: #FF6384; /* Red */
    }

    form button {
        padding: 10px 15px;
        font-size: 16px;
        background-color: #FF6384; /* Red */
        color: white;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        font-weight: bold;
        transition: background-color 0.3s;
    }

    form button:hover {
        background-color: #ff4c5b;
    }

    @media (max-width: 768px) {
        /* Responsive layout for smaller screens */
        .container {
            flex-direction: column;
            align-items: center;
        }

        .tracker-container {
            width: 100%;
        }
    }
    </style>
</head>
<body>

<div class="container">
    <!-- Form Section -->
    <div class="tracker-container">
        <h1>Daily Tracker Form</h1>
        
        <form id="trackerForm" action="/savedailytracker" method="POST">
    <label for="date">Date</label>
    <input type="date" id="date" name="date" required>

    <label for="meals">How many meals did you take?</label>
    <input type="number" id="meals" name="meals" min="0" required>

    <label for="calories">Calories Intake</label>
    <input type="number" id="calories" name="calories" min="0" required>

    <label for="protein">Protein Intake (grams)</label>
    <input type="number" id="protein" name="protein" min="0" required>

    <label for="water">Water Intake (liters)</label>
    <input type="number" id="water" name="water" min="0" step="0.1" required>

    <label for="steps">Steps Taken</label>
    <input type="number" id="steps" name="steps" min="0" required>

    <label for="sleep">Sleep Duration (hours)</label>
    <input type="number" id="sleep" name="sleep" min="0" step="0.1" required>
    <label for="workout">Daily Workout (minutes)</label>
    <input type="number" id="workout" name="workout" min="0" required>

    <button type="submit">Submit</button>
</form>

    </div>
</div>

<script>
    function submitForm() {
        const meals = parseInt(document.getElementById('meals').value)  0;
        const calories = parseInt(document.getElementById('calories').value)  0;
        const protein = parseInt(document.getElementById('protein').value)  0;
        const water = parseFloat(document.getElementById('water').value)  0;
        const steps = parseInt(document.getElementById('steps').value)  0;
        const sleep = parseFloat(document.getElementById('sleep').value)  0;
        const workout = parseInt(document.getElementById('workout').value) || 0;

        // You can handle the form submission data here
        console.log({
            meals,
            calories,
            protein,
            water,
            steps,
            sleep,
            workout
        });
    }
</script>

</body>
</html>