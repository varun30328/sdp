<%@page import="com.jfsd.sdp.model.Nutritionist"%>
<%@page import="com.jfsd.sdp.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Nutritionist nu = (Nutritionist)session.getAttribute("nutri");
if(nu ==null)
{
	response.sendRedirect("nutrisessionexpiry.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Nutritionist Registration</title>
    <%@include file="nutrisionistnavbar.jsp" %>
    <br> <br>
    <link rel="stylesheet" href="updatenutrition.css" />
</head>
<body>
  <div class="container">
        <h3>Update Profile</h3>
        <form method="post" action="updatenutriprofile">
         <div class="user-details">
         
                <div class="input-box">
                    <label for="id"> ID</label>
                    <input type="number" id="id" name="id" readonly value="<%=nu.getId() %>" required/>
                </div>
            <!-- Full Name -->
            <div class="input-box">
                <label for="fullname">Full Name</label>
                <input type="text" class="form-control" id="fullname" name="fullname" value="<%=nu.getFullname() %>" required>
            </div>

            <!-- Gender -->
<div class="gender-details">
    <label>Gender</label>
    <div>
        <input type="radio" id="male" name="gender" readonly value="MALE" <%= "MALE".equals(nu.getGender()) ? "checked" : "" %> required>
        <label for="male">Male</label>

        <input type="radio" id="female" name="gender" readonly value="FEMALE" <%= "FEMALE".equals(nu.getGender()) ? "checked" : "" %> required>
        <label for="female">Female</label>

        <input type="radio" id="other" name="gender" readonly value="OTHER" <%= "OTHER".equals(nu.getGender()) ? "checked" : "" %> required>
        <label for="other">Other</label>
    </div>
</div>


            <!-- Email -->
            <div class="input-box">
                <label for="email">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" readonly value="<%=nu.getEmail() %>"  required>
            </div>

            <!-- Password -->
            <div class="input-box">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password"  value="<%=nu.getPassword() %>" required>
            </div>

            <!-- Contact -->
            <div class="input-box">
                <label for="contact">Contact Number</label>
                <input type="text" class="form-control" id="contact" name="contact" value="<%=nu.getContact()%>" required>
            </div>

            <!-- Qualifications -->
            <div class="input-box">
                <label for="qualifications">Qualifications</label>
                <input type="text" class="form-control" id="qualifications" name="qualifications" value="<%=nu.getQualifications() %>" required>
            </div>

            <!-- Specializations -->
            <div class="input-box">
                <label for="specializations">Specializations</label>
                <input type="text" class="form-control" id="specializations" name="specializations" value="<%=nu.getSpecializations() %>">
            </div>

            <!-- Experience -->
            <div class="input-box">
                <label for="experience">Years of Experience</label>
                <input type="number" step="0.1" class="form-control" id="experience" name="experience" value="<%=nu.getExperience() %>" required>
            </div>

            <!-- License Number -->
            <div class="input-box">
                <label for="licenseno">License Number</label>
                <input type="text" class="form-control" id="licenseno" name="licenseno" readonly value="<%=nu.getLicenseno() %>"  required="required">
            </div>

            <!-- Available Hours -->
            <div class="input-box">
                <label for="availablehours">Available Hours</label>
                <input type="text" class="form-control" id="availablehours" name="availablehours" value="<%=nu.getAvailablehours() %>"  required="required"> 
            </div>

            <!-- Preferred Consultation Method -->
<div class="form-group">
    <label for="preferedConsultation">Preferred Consultation Method</label>
    <select class="form-control" id="preferedConsultation" name="preferedConsultation">
        <option value="select" <%= "select".equals(nu.getPreferedConsultation()) ? "selected" : "" %>>--Select--</option>
        <option value="In-person" <%= "In-person".equals(nu.getPreferedConsultation()) ? "selected" : "" %>>In-person</option>
        <option value="Online" <%= "Online".equals(nu.getPreferedConsultation()) ? "selected" : "" %>>Online</option>
        <option value="Phone" <%= "Phone".equals(nu.getPreferedConsultation()) ? "selected" : "" %>>Phone</option>
    </select>
</div>


            <!-- Submit Button -->
            <div class="button ">
                <input type="submit" value="update">
            </div>
            </div>
        </form>
</div>
<br> <br> <br> <br> <br> 
</body>
</html>
