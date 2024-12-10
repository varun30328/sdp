<%@page import="com.jfsd.sdp.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="jakarta.tags.core" prefix="c" %> --%>

<% 
User user1 = (User)session.getAttribute("buyer");
if(user1 ==null)
{
	response.sendRedirect("usersessionexpiry.jsp");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Profile</title>
</head>
<body>
<%@include file="usernavbar.jsp" %>
 <br>
    <link rel="stylesheet" type="text/css" href="profile.css">
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
    height: 100vh;
    padding: 10px;
}

h2, h3 {
    font-family: serif;
    color: navy;
    font-size: 42px;
    text-align: center;
}

   
</style>
<br> <br> <br>
<div class="container">
<div class="content">
<h3 align="center">My Profile</h3>
<br>
            <b>ID:</b><%=user1.getId()%><br><br>
            <b>NAME:</b><%=user1.getName()%><br><br>
           <b>GENDER:</b><%=user1.getGender()%><br><br>
           <b>Age:</b><%=user1.getAge()%><br><br>
           <b>EMAIL:</b><%=user1.getEmail()%><br><br>
           <b>Password:</b><%=user1.getPassword()%><br><br>
           <b>CONTACT:</b><%=user1.getContact()%><br><br>
            <b>LOCATION:</b><%=user1.getLocation()%><br><br>
         
</div>
<div class="flap"></div>
</div>
</body>
</html>