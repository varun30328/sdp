<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Diet Details</title>
</head>
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
    height: auto;
    padding: 10px;
}
  h2 {
    font-family: 'Times New Roman', Times, serif;
    color: black;
    text-align: center;
    font-size: 22px;
    margin-top: 20px;
}

.form-container {
    width: 50%;
    margin: 40px auto;
    background: linear-gradient(185deg,#67dada,grey);;
    box-shadow: 0 4px 8px rgba(1.8, 1.4, 2.0, 2.8);
    border-radius: 18px;
    padding: 20px;
   

}

table {
    width: 100%;
}

table td {
    padding: 10px;
}

label {
    font-weight: bold;
    color: #555;
}

input[type="text"],
input[type="url"],
textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1rem;
    outline: none;
    transition: all 0.3s ease;
}

input[type="text"]:focus,
input[type="url"]:focus,
textarea:focus {
    border-color: #ff9a9e;
    box-shadow: 0 0 5px rgba(255, 154, 158, 0.5);
}

textarea {
    height: 100px;
    resize: none;
}

.button {
    background: linear-gradient(135deg, #69e3e5, #b9f5bd);
    border: none;
    color: #fff;
    padding: 10px 20px;
    font-size: 1rem;
    border-radius: 4px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.button:hover {
    background: linear-gradient(135deg, #fad0c4, #ff9a9e);
    transform: scale(1.05);
}

@media screen and (max-width: 768px) {
    .form-container {
        width: 90%;
    }

}
  h3{
  font-size: 30px;
  }
  
    </style>
<body>
<%@ include file="nutrisionistnavbar.jsp" %>

<h3 align="center"><u>Add Diet Details</u></h3>

<br>

<form action="insertdiet" method="post" class="form-container">

<table align="center">

<tr>
    <td><label>Diet Type</label></td>
    <td>
        <select name="dietType" required="required">
            <option value="">-- Select Diet Type --</option>
            <option value="Vegetarian">Vegetarian</option>
            <option value="Vegan">Vegan</option>
            <option value="Keto">Keto</option>
            <option value="Paleo">Paleo</option>
            <option value="Mediterranean">Mediterranean</option>
        </select>
    </td>
</tr>

<tr><td></td></tr>

<tr>
    <td><label>Dietary Custom</label></td>
    <td>
        <select name="DietaryCustom" required="required">
            <option value="">-- Select Customization --</option>
            <option value="Low Carb">Low Carb</option>
            <option value="Low Fat">Low Fat</option>
            <option value="High Protein">High Protein</option>
            <option value="Gluten-Free">Gluten-Free</option>
        </select>
    </td>
</tr>

<tr><td></td></tr>

<tr>
    <td><label>Breakfast</label></td>
    <td><input type="text" name="breakfast" required="required"/></td>
</tr>

<tr><td></td></tr>

<tr>
    <td><label>Lunch</label></td>
    <td><input type="text" name="lunch" required="required"/></td>
</tr>

<tr><td></td></tr>

<tr>
    <td><label>Dinner</label></td>
    <td><input type="text" name="dinner" required="required"/></td>
</tr>

<tr><td></td></tr>

<tr>
    <td><label>Snack</label></td>
    <td><input type="text" name="snack" required="required"/></td>
</tr>

<tr><td></td></tr>
<tr><td></td></tr>

<tr align="center">
    <td colspan="2"><input type="submit" value="Add Diet Details" class="button"></td>
</tr>

</table>

</form>

</body>
</html>
