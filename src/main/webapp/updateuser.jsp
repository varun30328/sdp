<%@page import="com.jfsd.sdp.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
User user1 = (User) session.getAttribute("buyer");
if (user1 == null) {
    response.sendRedirect("usersessionexpiry.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update User</title>
    <%@include file="usernavbar.jsp" %>
    <style>
        /* General Reset */
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
        /* Wrapper for the whole content */
        .page-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            min-height: 100vh;
        }

        /* Navbar Container */
        .navbar-container {
            width: 200px; /* Adjust width as needed */
            margin-right: 20px; /* Space between navbar and form */
        }

        /* Form Container */
        .container {
          
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            max-width: 500px;
            flex-grow: 1;
        }

        /* Form Heading */
        h3 {
            text-align: center;
            font-family: serif;
            font-weight: bold;
            color: #333333;
            border-bottom: 2px solid goldenrod;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        /* Table Styles */
        table {
            width: 100%;
            border-spacing: 0;
            border-collapse: separate;
        }

        table td {
            padding: 10px 0;
        }

        table td:first-child {
            text-align: right;
            padding-right: 20px;
            color: #555555;
            font-weight: bold;
            font-size: 14px;
        }

        table td:last-child {
            text-align: left;
            width: 65%;
        }

        /* Form Elements */
        input[type="text"],
        input[type="number"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            transition: all 0.3s ease-in-out;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #6c63ff;
            box-shadow: 0 0 8px rgba(108, 99, 255, 0.3);
        }

        /* Radio Buttons */
        input[type="radio"] {
            margin-right: 8px;
        }

        input[type="radio"] + label {
            margin-right: 15px;
            font-weight: normal;
            font-size: 14px;
            color: #555555;
        }

        /* Submit Button */
        input[type="submit"] {
            background-color: #6c63ff;
            color: white;
            font-weight: bold;
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
            text-transform: uppercase;
            font-size: 14px;
            letter-spacing: 1px;
            display: block;
            margin: 0 auto;
            width: 100%;
            max-width: 200px;
        }

        input[type="submit"]:hover {
            background-color: #5148c5;
        }

        /* Button Container */
        .button-container {
            text-align: center;
            padding-top: 20px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .page-wrapper {
                flex-direction: column;
                align-items: center;
            }

            .navbar-container {
                width: 100%;
                margin-bottom: 20px;
            }

            .container {
                width: 100%;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="page-wrapper">

        <!-- Form Container -->
        <div class="container">
           
                <h3><u>Update User Profile</u></h3>
                <table>
                    <tr>
                        <td><label for="uid">User ID</label></td>
                        <td><input type="number" id="uid" name="uid" readonly value="<%= user1.getId() %>" required /></td>
                    </tr>
                    <tr>
                        <td><label for="uname">User Name</label></td>
                        <td><input type="text" id="uname" name="uname" value="<%= user1.getName() %>" required /></td>
                    </tr>
                    <tr>
                        <td><label>Select Gender</label></td>
                        <td>
                            <input type="radio" id="male" name="ugender" value="MALE" <%= user1.getGender().equals("MALE") ? "checked" : "" %> required />
                            <label for="male">Male</label>
                            <input type="radio" id="female" name="ugender" value="FEMALE" <%= user1.getGender().equals("FEMALE") ? "checked" : "" %> required />
                            <label for="female">Female</label>
                            <input type="radio" id="others" name="ugender" value="OTHERS" <%= user1.getGender().equals("OTHERS") ? "checked" : "" %> required />
                            <label for="others">Others</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="uage">Enter Age</label></td>
                        <td><input type="number" id="uage" name="uage" value="<%= user1.getAge() %>" required /></td>
                    </tr>
                    <tr>
                        <td><label for="uemail">Enter Email ID</label></td>
                        <td><input type="email" id="uemail" name="uemail" readonly value="<%= user1.getEmail() %>" required /></td>
                    </tr>
                    <tr>
                        <td><label for="upassword">Enter Password</label></td>
                        <td><input type="password" id="upassword" name="upassword" value="<%= user1.getPassword() %>" required /></td>
                    </tr>
                    <tr>
                        <td><label for="ucontact">Enter Contact</label></td>
                        <td><input type="number" id="ucontact" name="ucontact" value="<%= user1.getContact() %>" required /></td>
                    </tr>
                    <tr>
                        <td><label for="ulocation">Enter Location</label></td>
                        <td><input type="text" id="ulocation" name="ulocation" value="<%= user1.getLocation() %>" required /></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="button-container">
                            <input type="submit" value="Update" />
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
