<%@page import="com.jfsd.sdp.model.User"%> 
<%
 User  user1 = (User)session.getAttribute("buyer");
if(user1==null)
{
	response.sendRedirect("usersessionexpiry");
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
font-family: 'Times New Roman', Times, serif;
 font-size: 22px;
}
body{
   display:block;
    background: url(https://images.unsplash.com/photo-1495195129352-aeb325a55b65?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1776&q=80);
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    height: 140vh;
    align-items:center;
    padding: 10px;
    }
    
    h2{
    padding-top:150px;
    padding-left:80px;
    text-align: center;
    font-family:serif;
    font-size:42px;
    color: navy;
    }
</style>
</head>
<body>
<%@include file="usernavbar.jsp" %>
<h2> Welcome <%=user1.getName() %></h2>  
</body>
</html>