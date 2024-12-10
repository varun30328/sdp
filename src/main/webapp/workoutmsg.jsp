<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Success</title>
<style>
body { 
 
    margin: 0%;
    padding:0px;
    background: linear-gradient(140deg,rgb(179, 213, 247),rgb(140,250 ,173 ));
    height: 100vh;
    overflow: hidden;
    display: block;
    justify-content:center;
    align-items:center;
    
   h2 {
    font-family: Arial, sans-serif; /* Sets the font type */
    font-size: 24px; /* Adjusts the font size */
    color: #333; /* Text color */
    text-align: center; /* Centers the text */
    font-weight: bold; /* Makes the text bold */
    margin: 20px 0; /* Adds space around the heading */
    padding: 10px; /* Adds space within the heading box */
    background-color: #f0f0f0; /* Background color for the heading */
    border-radius: 12px; /* Rounds the corners */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Adds a subtle shadow */
    align-content: center;
    padding-top
    padding-left: 10px;
    padding-right: 10px;
   
}


a.signin {
    display: inline-block; /* Makes it behave like a button */
    font-family: Arial, sans-serif; /* Font style */
    font-size: 16px; /* Text size */
    color: #fff; /* Text color */
    background-color: facf92; /* Button background color */
    padding: 10px 20px; /* Padding around the text */
    text-decoration: none; /* Removes the underline */
    border-radius: 7px; /* Rounds the corners */
    transition: background-color 0.3s ease; /* Adds a smooth transition on hover */
}

/* Hover effect */
a.signin:hover {
    background-color: #0056b3; /* Darker shade for hover */
}
}
</style>
</head>
<body>
<h2> Workout Added Successfully </h2>

<a href="addworkout.jsp" class="signin">Back</a>
</body>
</html>
