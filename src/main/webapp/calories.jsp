<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Daily Calorie Intake Calculator</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <%@include file="usernavbar.jsp" %>
  
  <style>
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
    height: auto;
    padding: 10px;
}
    .calculator-container {
      width: 400px;
      background: #fff;
      margin-left:600px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      padding: 20px;
    }
    h1 {
      font-size: 1.5em;
      text-align: center;
      margin-bottom: 20px;
    }
    form div {
      margin-bottom: 15px;
    }
    label {
      display: block;
      margin-bottom: 5px;
    }
    input, select, button {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    .activity-level {
      display: flex;
      justify-content: space-between;
    }
    .activity-level label {
      text-align: center;
      font-size: 12px;
    }
    .activity-level input {
      display: none;
    }
    .activity-level i {
      font-size: 24px;
      color: #28a745;
      cursor: pointer;
    }
    .activity-level input:checked + i {
      color: #007bff;
    }
    .result-container {
      margin-top: 20px;
      text-align: center;
    }
    .result-container input {
      margin-top: 10px;
    }
  </style>
</head>
<body>
<br><br><br>
  <div class="calculator-container">
    <h1>Daily Calorie Intake Calculator</h1>
    <form id="calorie-form">
      <div>
        <label>What is your sex?</label>
        <select id="gender" required>
          <option value="male">Male</option>
          <option value="female">Female</option>
        </select>
      </div>
      <div>
        <label>How old are you?</label>
        <input type="number" id="age" placeholder="Age in years" required>
      </div>
      <div>
        <label>How tall are you?</label>
        <input type="number" id="height" placeholder="Height in cm" required>
      </div>
      <div>
        <label>How much do you weigh?</label>
        <input type="number" id="weight" placeholder="Weight in kg" required>
      </div>
      <div>
        <label>How active are you on a daily basis?</label>
        <div class="activity-level">
          <label>
            <input type="radio" name="activity" value="1.2" required>
            <i class="fas fa-chair"></i><br>Lightly Active
          </label>
          <label>
            <input type="radio" name="activity" value="1.375">
            <i class="fas fa-walking"></i><br>Moderately Active
          </label>
          <label>
            <input type="radio" name="activity" value="1.55">
            <i class="fas fa-running"></i><br>Active
          </label>
          <label>
            <input type="radio" name="activity" value="1.725">
            <i class="fas fa-dumbbell"></i><br>Very Active
          </label>
        </div>
      </div>
      <button type="submit">Calculate Calorie Intake</button>
    </form>

    <!-- Result Fields for Lose, Maintain, and Gain Calories -->
    <div class="result-container">
      <label>Lose weight:</label>
      <input type="text" id="lose-weight" readonly>

      <label>Maintain weight:</label>
      <input type="text" id="maintain-weight" readonly>

      <label>Gain weight:</label>
      <input type="text" id="gain-weight" readonly>
    </div>
  </div>

  <script>
    const form = document.getElementById('calorie-form');
    const loseWeightField = document.getElementById('lose-weight');
    const maintainWeightField = document.getElementById('maintain-weight');
    const gainWeightField = document.getElementById('gain-weight');

    form.addEventListener('submit', function (e) {
      e.preventDefault(); // Prevent form submission

      // Gather input data
      const gender = document.getElementById('gender').value;
      const age = parseInt(document.getElementById('age').value);
      const height = parseFloat(document.getElementById('height').value);
      const weight = parseFloat(document.getElementById('weight').value);
      const activity = parseFloat(document.querySelector('input[name="activity"]:checked').value);

      // BMR Calculation
      let bmr;
      if (gender === 'male') {
        bmr = 10 * weight + 6.25 * height - 5 * age + 5;
      } else {
        bmr = 10 * weight + 6.25 * height - 5 * age - 161;
      }

      // Calorie Needs
      const maintainCalories = Math.round(bmr * activity);
      const loseCalories = Math.round(maintainCalories - 500);
      const gainCalories = Math.round(maintainCalories + 500);

      // Display the results in the input fields
      loseWeightField.value = loseCalories + ' calories/day';
      maintainWeightField.value = maintainCalories + ' calories/day';
      gainWeightField.value = gainCalories + ' calories/day';
    });
  </script>
</body>
</html>
