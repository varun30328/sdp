<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="navbar.css">
</head>
<body>
<header>
        <div class="logo">NUTRIFINE
        </div>
        <nav>
            <ul class="nav__links">
                <li><a href="home.jsp"><span>Home</span></a></li>
                <li class="dropdown">
                    <a href="#signin" id="signinDropdown"><span>SignIn</span></a>
                    <ul class="dropdown-menu">
                        <li><a href="adminlogin.jsp">Admin Login</a></li>
                        <li><a href="userlogin.jsp">User Login</a></li>
                        <li><a href="nutrilogin.jsp">Health Specialist Login</a></li>
                        
                 
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#signup" id="signupDropdown"><span>SignUp</span></a>
                    <ul class="dropdown-menu">
                        <li><a href="userregistration.jsp">User Registration</a></li>
                         <li><a href="nreg.jsp">Health Specialist Registration</a></li>
                    </ul>
                </li>
<!--                 <li><a href="contact.jsp"><span>Contact</span></a></li> -->
            </ul>
        </nav>
        
    </header>
</body>
</html>