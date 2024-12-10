<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Workout Management</title>
     <link rel="stylesheet" type="text/css" href="addresource.css">
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
    background: linear-gradient(185deg, #b8fae3, #b8afa3);;
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
    color: #333;
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
  
    </style>
</head>

<body>

<%@ include file="nutrisionistnavbar.jsp" %>

<h2><u>Add Workout</u></h2>

<form action="insertworkout" method="post" enctype="multipart/form-data" class="form-container">

    <table>
        <tr>
            <td><label for="name">Workout Name</label></td>
            <td><input type="text" id="name" name="name" required="required" /></td>
        </tr>

        <tr>
            <td><label for="type">Workout Type</label></td>
            <td>
                <select id="type" name="type" required="required">
                    <option value="">---Select---</option>
                    <option value="Strength">Strength</option>
                    <option value="Cardio">Cardio</option>
                    <option value="Flexibility">Flexibility</option>
                    <option value="Balance">Balance</option>
                </select>
            </td>
        </tr>

       

        <tr>
            <td><label for="equipment">Equipment</label></td>
            <td><input type="text" id="equipment" name="equipment" /></td>
        </tr>

        <tr>
            <td><label for="difficulty">Difficulty Level</label></td>
            <td>
                <select id="difficulty" name="difficulty" required="required">
                    <option value="">---Select---</option>
                    <option value="Easy">Easy</option>
                    <option value="Medium">Medium</option>
                    <option value="Hard">Hard</option>
                </select>
            </td>
        </tr>

        <tr>
            <td><label for="instructions">Instructions</label></td>
            <td><textarea id="instructions" name="instructions" rows="4" required="required"></textarea></td>
        </tr>

        <tr>
            <td><label for="setsandrepetitions">Sets and Repetitions</label></td>
            <td><input type="text" id="setsandrepetitions" name="setsandrepetitions" required="required" /></td>
        </tr>

        <tr>
            <td><label for="duration">Duration (in minutes)</label></td>
            <td><input type="number" id="duration" name="duration" required="required"  /></td>
        </tr>

        <tr>
            <td><label for="image">Workout Image</label></td>
            <td><input type="file" id="image" name="workoutimage" required="required" /></td>
        </tr>

        <tr>
            <td><label for="url">Reference URL</label></td>
            <td><input type="url" id="url" name="url" /></td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="AddWorkout" class="button" />
            </td>
        </tr>
    </table>

</form>

</body>
</html>