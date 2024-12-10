<%@page import="com.jfsd.sdp.model.Nutritionist"%>
<%
 Nutritionist  nu = (Nutritionist)session.getAttribute("nutri");
if(nu==null)
{
	response.sendRedirect("nsessionexpiry");
	return;
	
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Home</title>
<style>
*{
padding: 0;
margin: 0;
}
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
</head>
<body>
<%@include file="nutrisionistnavbar.jsp" %>
<h3> Welcome <%=nu.getFullname() %> </h3>  
</body>
</html>