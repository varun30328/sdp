<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NutriFine</title>
    <%@include file="usernavbar.jsp" %>
    <style>
    
      
    * {
    padding: 0;
    margin: 0;
    font-family: 'Times New Roman', Times, serif;
    font-size: 22px; /* Ensure consistent font size */
}
        body {
            font-family: 'Times New Roman', Times, serif;
            font-size: 22px;
            background: url(https://images.unsplash.com/photo-1495195129352-aeb325a55b65?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1776&q=80);
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            height: auto;
        }

        .form-container {
            width: 50%;
            max-width: 600px;
            margin: 60px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .form-container:hover {
            transform: scale(1.01);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }

        h2, h3 {
            color: #f33974;
            text-align: center;
            font-weight: 600;
        }

        .form-step {
            display: none;
        }

        .form-step.active {
            display: block;
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        label {
            font-size: 16px;
            color: #555;
            margin-bottom: 5px;
            display: inline-block;
            width: 30%;
            text-align: right;
            padding-right: 10px;
        }

        input, select {
            width: 60%;
            padding: 10px 15px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            transition: border-color 0.3s;
        }

        input:focus, select:focus {
            border-color: #4993c1;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-top: 20px;
        }

        button {
            width: 120px;
            padding: 12px;
            background-color: #4993c1;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        button:hover {
            background-color: #62c2e8;
            transform: scale(1.05);
        }

        button:disabled {
            background-color: #ccc;
            cursor: not-allowed;
            transform: none;
        }

        .form-navigation {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<br><br><br>
    <div class="form-container">
        <form id="multiStepForm">
            <!-- Step 1: Personal Information -->
            <div class="form-step active">
                <h3>Personal Information</h3>
                <div class="form-group">
                    <label for="height">Height (cm):</label>
                    <input type="number" id="height" name="height" required>
                </div>
                <div class="form-group">
                    <label for="weight">Weight (kg):</label>
                    <input type="number" id="weight" name="weight" required>
                </div>
                <div class="form-group">
                    <label for="healthCondition">Health Conditions:</label>
                    <select id="healthCondition" name="healthCondition">
                        <option value="--select--">Select</option>
                        <option value="Diabetes">Diabetes</option>
                        <option value="HighBloodPressure">High Blood Pressure</option>
                        <option value="HeartDisease">Heart Disease</option>
                        <option value="none">none</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="supplements">Supplements Used:</label>
                    <input type="text" id="supplements" name="supplements" required>
                </div>
            </div>

            <!-- Step 2: Dietary Preferences -->
            <div class="form-step">
                <h3>Dietary Preferences</h3>
                <div class="form-group">
                    <label for="dietType">Diet Type:</label>
                    <select id="dietType" name="dietType">
                        <option value="select">Select</option>
                        <option value="vegetarian">Vegetarian</option>
                        <option value="vegan">Vegan</option>
                        <option value="keto">Keto</option>
                        <option value="paleo">Paleo</option>
                        <option value="balanced">Balanced</option>
                        <option value="custom">Custom</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="allergies">Food Allergies:</label>
                    <input type="text" id="allergies" name="allergies" placeholder="e.g., Nuts, Dairy">
                </div>
            </div>

            <!-- Step 3: Health Goals -->
            <div class="form-step">
                <h3>Health Goals</h3>
                <div class="form-group">
                    <label for="goal">Primary Goal:</label>
                    <select id="goal" name="goal">
                        <option value="select">Select</option>
                        <option value="weightloss">Weight Loss</option>
                        <option value="musclegain">Muscle Gain</option>
                        <option value="maintainweight">Maintain Weight</option>
                        <option value="energy">Improve Energy Levels</option>
                        <option value="wellness">General Wellness</option>
                    </select>
                    
                    
                </div>
                 <br><br><br>
            </div>

            <!-- Navigation Buttons -->
            <div class="form-navigation">
                <button type="button" id="prevBtn" class="button-disabled" disabled>Previous</button>
                <button type="button" id="nextBtn">Next</button>
            </div>
            <br><br><br>
        </form>
    </div>
<br><br><br> <br><br><br> <br>
    <script>
    const steps = document.querySelectorAll(".form-step");
    const nextBtn = document.getElementById("nextBtn");
    const prevBtn = document.getElementById("prevBtn");
    let currentStep = 0;

    // Show the current step
    function showStep(index) {
        steps.forEach((step, i) => {
            step.classList.toggle("active", i === index);
        });
        prevBtn.disabled = index === 0;
        prevBtn.classList.toggle("button-disabled", index === 0);
        nextBtn.textContent = index === steps.length - 1 ? "Submit" : "Next";
    }

    // Next Button Click
    nextBtn.addEventListener("click", () => {
        if (currentStep < steps.length - 1) {
            currentStep++;
            showStep(currentStep);
        } else {
            const formData = new FormData(document.getElementById("multiStepForm"));
            const jsonData = Object.fromEntries(formData.entries());

            fetch("/submit", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(jsonData),
            })
            .then(response => {
                if (response.ok) {
                    alert("Form submitted successfully!");
                    window.location.href = "/viewallrecipe";
                } else {
                    alert("Error submitting form");
                }
            })
            .catch(error => console.error("Error:", error));
        }
    });

    // Previous Button Click
    prevBtn.addEventListener("click", () => {
        if (currentStep > 0) {
            currentStep--;
            showStep(currentStep);
        }
    });

    // Initialize form
    showStep(currentStep);
    </script>

</body>
</html>
