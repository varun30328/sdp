<%@page import="com.jfsd.sdp.model.Nutritionist"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="jakarta.tags.core" prefix="c" %> --%>

<% 
Nutritionist nu= (Nutritionist)session.getAttribute("nutri");
if(nu ==null)
{
	response.sendRedirect("nutrisessionexpiry.jsp");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Profile</title>
</head>
<body>
<%@include file="nutrisionistnavbar.jsp" %>
 <br><br><br>
    <link rel="stylesheet" type="text/css" href="nutriprofile.css">
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
    
    h3{
    padding-top:150px;
    padding-left:80px;
    text-align: center;
    font-family:serif;
    font-size:28px;
    color: navy;
    }
</style>

<div class="container">
<div class="content">
<h3 align="center">My Profile</h3>
<br>  <br>
            <b>ID:</b><%=nu.getId()%><br><br>
            <b>Full Name:</b><%=nu.getFullname()%><br><br>
            <b>Gender:</b><%=nu.getGender()%><br><br>
             <b>Email:</b><%=nu.getEmail()%><br><br>
                                     <b>Qualifications:</b><%=nu.getQualifications()%><br><br>
                                     <b>PreferedConsultation:</b><%=nu.getPreferedConsultation()%><br><br>
             <b>License No:</b><%=nu.getLicenseno()%><br><br>
              <b>Experience:</b><%=nu.getExperience()%><br><br>
              <b>Specializations:</b><%=nu.getSpecializations()%><br><br>
                        <b>Available hours:</b><%=nu.getAvailablehours()%><br><br>
                        
            
           
         
</div>
<div class="flap"></div>
</div>
</body>
</html>