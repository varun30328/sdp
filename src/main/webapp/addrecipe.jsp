<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Project</title>
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
    h3 {
        font-family: 'Times New Roman', Times, serif;
        font-size: 22px;
        font-weight: bolder;
        color: black; /* Sets the color of the h3 element to black */
    }
    </style>
</head>

<body>

<%@ include file="nutrisionistnavbar.jsp" %>
<link rel="stylesheet" href="addrecipe.css" />

<br>

<form action="insertrecipe" method="post" enctype="multipart/form-data" class="form-container">
<h3 align=center><u>Add Recipe</u></h3>
<table align="center">

<tr>
<td><label>Category</label></td>
<td>
<select name="category" required="required">
<option value="">---Select---</option>
<option value="BreakFast">BreakFast</option>
<option value="Lunch">Lunch</option>
<option value="Dinner">Dinner</option>
</select>
</td>
</tr>

<tr><td></td></tr>

<tr>
<td><label>Name</label></td>
<td><input type="text" name="name" required="required"/></td>
</tr>

<tr><td></td></tr>
<tr>
<td><label>Level</label></td>
<td><input type="text" name="level" required="required"/></td>
</tr>

<tr><td></td></tr>

<tr>
<td><label>Description</label></td>
<td>
<textarea name="description"></textarea>
</td>
</tr>

<tr><td></td></tr>
<tr>
<td><label>Preparation Time</label></td>
<td><input type="text" name="prep" required="required"/></td>
</tr>

<tr><td></td></tr>

<tr>
<td><label>Nutrition Facts</label></td>
<td><input type="text" name="nutritionfacts" required="required"/></td>
</tr>

<tr><td></td></tr>
<tr>

<td><label>Calorie</label></td>
<td><input type="number" name="calorie" required="required"  /></td>
</tr>

<tr><td></td></tr>

<tr>
<td><label>Image</label></td>
<td><input type="file" name="recipeimage" required="required"/></td>
</tr>

<tr><td></td></tr>
<tr><td></td></tr>

<tr align=center>
<td colspan=2><input type="submit" value="Add" class="button"></td>
</tr>

</table>

</form>

</body>
</html>
