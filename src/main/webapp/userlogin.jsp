<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Login</title>
    <br>
    <%@include file="mainnavbar.jsp" %>
     <br><br><br><br><br>
    <link rel="stylesheet" type="text/css" href="login.css">
    <style>
    body{
     background-image:url("images/image1.jpg");
    background-size:cover;
    background-repeat:no-repeat;
    }
    </style>
</head>
<body>
  
  <br>
    <div class="center">
        <h1>Please SignIn</h1>
        <form method="post" action="checkuserlogin">
            <div class="txt_field">
            <input type="email" id="uemail" name="uemail" required >
            <span></span>
             <label for="uemail"> Username </label>
            </div>

            <div class="txt_field">
                <input type="password" id="upassword" name="upassword" required>
                <span></span>
                <label for="upassword"> Password </label>
                </div>

                <div class="pass">Forgot Password ?</div>
                <input type="submit" value="Login">

                <div class="signup_link">
               Not a Member ? <a href="userregistration.jsp">Signup</a>
                </div>

        </form>
    </div>
</body>
</html>
