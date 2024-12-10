<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <%@include file="mainnavbar.jsp" %>
    <br> <br>
    <link rel="stylesheet" href="registration.css">
</head>
<body>
    <div class="container">
        <div class="title"> User Registration </div>
        <form method="post" action="insertuser">
            <div class="user-details">

                <div class="input-box">
                    <span class="details"><label for="uname">Enter Name</label></span>
                    <input type="text" placeholder="Please Enter Your Name" id="uname" name="uname" required>
                </div>

                <div class="gender-details">
                    <span class="gender-title">Select Gender</span>
                    <div class="category">
                        <label for="male">
                            <span class="dot one"></span>
                            <span class="gender">Male</span>
                            <input type="radio" name="ugender" id="male" value="MALE" required>
                        </label>
                        <label for="female">
                            <span class="dot two"></span>
                            <span class="gender">Female</span>
                            <input type="radio" name="ugender" id="female" value="FEMALE" required>
                        </label>
                        <label for="others">
                            <span class="dot three"></span>
                            <span class="gender">Others</span>
                            <input type="radio" name="ugender" id="others" value="OTHERS">
                        </label>
                    </div>
                </div>

                <div class="input-box">
                    <span class="details"><label for="uage">Enter Age</label></span>
                    <input type="number" id="uage" name="uage" placeholder="Please Enter Your Age" required>
                </div>

                <div class="input-box">
                    <span class="details"><label for="uemail">Enter E-mail</label></span>
                    <input type="email" id="uemail" name="uemail" placeholder="Please Enter Your E-mail" required>
                </div>

                <div class="input-box">
                    <span class="details"><label for="upassword">Enter Password</label></span>
                    <input type="password" id="upassword" name="upassword" placeholder="Please Enter Your Password" required>
                </div>

                <div class="input-box">
                    <span class="details"><label for="ucontact">Enter Contact</label></span>
                    <input type="text" id="ucontact" name="ucontact" placeholder="Please Enter Contact Number" required>
                </div>

                <div class="input-box">
                    <span class="details"><label for="ulocation">Enter Location</label></span>
                    <input type="text" id="ulocation" name="ulocation" placeholder="Please Enter Your Location" required>
                </div>

                <!-- Optional: Registration Date -->
                <div class="input-box">
    <span class="details"><label for="uregistrationDate">Registration Date</label></span>
    <input type="text" id="uregistrationDate" name="uregistrationDate" value="<%= new java.util.Date() %>" readonly>
</div>


                <div class="button">
                    <input type="submit" value="Register">
                    <input type="reset" value="Clear">
                </div>

            </div>
        </form>
    </div>
</body>
</html>