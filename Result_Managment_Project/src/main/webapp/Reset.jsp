<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Result Management Managment</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: url('https://example.com/your-collage-image.jpg') no-repeat center center fixed; 
        background-size: cover;
        color: #333;
    }
    header {
        background-color: rgba(76, 175, 80, 0.8);
        color: white;
        padding: 20px;
        text-align: center;
        font-size: 28px; /* Increased font size for better visibility */    
        position: relative; /* Ensure it stays above other content */
        z-index: 1000; /* Keep it above other elements */
    }
    nav {
        background-color: rgba(51, 51, 51, 0.8);
        overflow: hidden;
        z-index: 1000;
        position: fixed;
        width: 100%;
        top: 0;
        left: 0;
        padding: 0 10px; /* Added padding for better spacing */
    }
    nav a {
        float: left;
        display: block;
        color: white;
        text-align: center;
        padding: 14px 20px;
        text-decoration: none;
    }
    nav a:hover {
        background-color: #575757;
    }
    .main-header {
        background-color: rgba(76, 175, 80, 0.8);
        color: white;
        padding: 10px;
        text-align: center;
        font-size: 24px; /* Adjusted font size for the new header */
        margin-top: 70px; /* Space for fixed nav */
        margin-bottom: 30px; /* Space between the main header and the form */
    }
    .login-link {
        display: block;
        text-align: center;
        margin: 20px 0;
    }
    .login-link a {
        color: #4CAF50;
        text-decoration: none;
        font-size: 18px;
        padding: 10px 20px;
        border: 2px solid #4CAF50;
        border-radius: 4px;
        transition: background-color 0.3s, color 0.3s;
    }
    .login-link a:hover {
        background-color: #4CAF50;
        color: white;
    }
    .container {
        padding: 20px;
        max-width: 600px;
        margin: 0 auto;
    }
    form {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 100%;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 10px;
        text-align: left;
    }
    th {
        text-align: right;
        width: 30%;
    }
    td input[type="text"],
    td input[type="tel"],
    td input[type="password"],
    td select {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
        transition: border-color 0.3s, box-shadow 0.3s;
    }
    td input[type="text"]:focus,
    td input[type="tel"]:focus,
    td input[type="password"]:focus,
    td select:focus {
        border-color: #4CAF50;
        box-shadow: 0 0 8px rgba(76, 175, 80, 0.3);
    }
    button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s, transform 0.3s;
        display: block;
        margin: 0 auto;
    }
    button:hover {
        background-color: #45a049;
        transform: scale(1.05);
    }
    footer {
        background-color: rgba(51, 51, 51, 0.8);
        color: white;
        text-align: center;
        padding: 10px;
        position: fixed;
        width: 100%;
        bottom: 0;
        left: 0;
    }
</style>
</head>
<body>

<nav>
    <a href="home.jsp">Home</a>
    <a href="index.jsp">Registration</a>
    <a href="fetch.jsp">student</a>
    <a href="fetchresult.jsp">Result</a>
    <a href="Reset.jsp">Reset_Password</a>
    <a href="logout">Logout</a>
</nav>

<div class="main-header">
    Admin Password Reset
</div>



<div class="container">
    <form action="Controllerservlet" method="post">
    <input type="hidden" id="data" name="data" value=reset required>
        <table>
        
                    <tr>
                <th><label for="password">Old Password:</label></th>
                <td><input type="password" id="password" name="old" required></td>
            </tr>
            <tr>
                <th><label for="password">New Password:</label></th>
                <td><input type="password" id="password" name="newpass" required></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <button type="submit">Reset password</button>
                </td>
            </tr>
        </table>
    </form>
</div>

<footer>
    &copy; 2024 Student Result Management System. All rights reserved.
</footer>

</body>
</html>
