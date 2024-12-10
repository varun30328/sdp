<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <br>
  <%@include file="mainnavbar.jsp" %>
      <link rel="stylesheet" type="text/css" href="adminlogin.css">
      <style>
      body
      {
           background-image:url("images/imageb.jpg");
    background-size:cover;
    background-repeat:no-repeat;
      }
      </style>
</head>
<body>
    <div class="center">
        <h1>Admin Login</h1>
        <form method="post" action="checkadminlogin">
            <div class="txt_field">
            <input type="text" id="auname" name="auname" required >
            <span></span>
             <label for="auname"> Username </label>
            </div>

            <div class="txt_field">
                <input type="password" id="apwd" name="apwd" required>
                <span></span>
                <label for="apwd"> Password </label>
                </div>
                
                <input type="submit" value="Login">
                <br> <br>
                 <input type="reset" value="Clear"/>
                

        </form>
    </div>
</body>
</html>
