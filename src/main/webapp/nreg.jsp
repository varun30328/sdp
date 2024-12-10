<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutritionist Registration</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <%@include file="mainnavbar.jsp" %>
    <style>
        body {
            background-image: url("images/nutrihome.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            height: 160vh;
        }
        .registration-form {
            max-width: 600px;
            width:100%;
            margin: 0;
            padding: 20px;
            background: #ffffff;
            border-radius: 18px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            position: absolute;
            left: 150px;
            top: 140px;
        }
        .registration-form h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .form-control {
            border-radius: 20px;
        }
        .btn-custom {
            background-color: #ff6b6b;
            color: #fff;
            border-radius: 20px;
        }
        .btn-custom:hover {
            background-color: #ff4b4b;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="registration-form">
        <h2>Health Specialist Registration</h2>
        <form method="post" action="insertnutritionist">
            <!-- Full Name -->
            <div class="form-group">
                <label for="fullname">Full Name</label>
                <input type="text" class="form-control" id="fullname" name="fullname" required>
            </div>

            <!-- Gender -->
            <div class="form-group">
                <label>Gender</label>
                <div>
                    <input type="radio" id="male" name="gender" value="Male" required>
                    <label for="male">Male</label>

                    <input type="radio" id="female" name="gender" value="Female">
                    <label for="female">Female</label>

                    <input type="radio" id="other" name="gender" value="Other">
                    <label for="other">Other</label>
                </div>
            </div>

            <!-- Email -->
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}"  required>
            </div>

            <!-- Contact -->
            <div class="form-group">
                <label for="contact">Contact Number</label>
                <input type="text" class="form-control" id="contact" name="contact" required>
            </div>

            <!-- Qualifications -->
            <div class="form-group">
                <label for="qualifications">Qualifications</label>
                <input type="text" class="form-control" id="qualifications" name="qualifications" required>
            </div>

            <!-- Specializations -->
            <div class="form-group">
                <label for="specializations">Specializations</label>
                <input type="text" class="form-control" id="specializations" name="specializations">
            </div>

            <!-- Experience -->
            <div class="form-group">
                <label for="experience">Years of Experience</label>
                <input type="number" step="0.1" class="form-control" id="experience" name="experience" required>
            </div>

            <!-- License Number -->
            <div class="form-group">
                <label for="licenseno">License Number</label>
                <input type="text" class="form-control" id="licenseno" name="licenseno">
            </div>

            <!-- Available Hours -->
            <div class="form-group">
                <label for="availablehours">Available Hours</label>
                <input type="text" class="form-control" id="availablehours" name="availablehours">
            </div>

            <!-- Preferred Consultation Method -->
            <div class="form-group">
                <label for="preferedConsultation">Preferred Consultation Method</label>
                <select class="form-control" id="preferedConsultation" name="preferedConsultation">
                    <option value="In-person">In-person</option>
                    <option value="Online">Online</option>
                    <option value="Phone">Phone</option>
                </select>
            </div>

            <!-- Submit Button -->
            <div class="form-group text-center">
                <button type="submit" class="btn btn-custom btn-block">Register</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
