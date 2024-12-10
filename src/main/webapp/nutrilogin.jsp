<!DOCTYPE html>
<html>
<head>
    <title>Nutritionist Login</title>
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
        <h1>Health Specialist Login</h1>
        <form method="post" action="checknutrilogin">
            <div class="txt_field">
            <input type="text" id="email" name="email" required >
            <span></span>
             <label for="email"> Username </label>
            </div>

            <div class="txt_field">
                <input type="password" id="password" name="password" required>
                <span></span>
                <label for="password"> Password </label>
                </div>
                
                <input type="submit" value="Login">
                <br> <br>
                 <input type="reset" value="Clear"/>
                

        </form>
    </div>
</body>
</html>
