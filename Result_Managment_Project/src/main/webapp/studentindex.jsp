<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dau.Connecter"%>
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
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    nav {
        background-color: rgba(51, 51, 51, 0.8);
        overflow: hidden;
        z-index: 1000;
        position: fixed;
        width: 100%;
        top: 0;
        left: 0;
        padding: 0 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
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

    .side-menu {
        position: fixed;
        top: 70px; /* Space for fixed nav */
        left: 0;
        width: 200px;
        background-color: rgba(51, 51, 51, 0.8);
        color: white;
        list-style: none;
        padding: 0;
        margin: 0;
        z-index: 1000;
        height: calc(100vh - 70px); /* Adjust height to fill the screen */
        overflow-y: auto;
    }

    .side-menu li {
        padding: 15px;
        border-bottom: 1px solid #444;
    }

    .side-menu li.active {
        background-color: #4CAF50;
    }

    .side-menu li a {
        color: white;
        text-decoration: none;
        display: flex;
        align-items: center;
    }

    .side-menu i {
        margin-right: 10px;
    }

    .side-menu a:hover {
        background-color: #575757;
    }

    header {
        background-color: rgba(76, 175, 80, 0.8);
        color: white;
        padding: 15px;
        text-align: center;
        font-size: 28px;
        position: relative;
        z-index: 1000;
        margin-top: 70px; /* Space for fixed nav */
    }

 .main-header {
    background: linear-gradient(90deg, rgba(76, 175, 80, 0.8), rgba(51, 51, 51, 0.8));
    color: white;
    padding: 10px;
    text-align: center;
    font-size: 24px;
    margin-top: 70px;
    margin-bottom: 30px;
}

    .container {
        padding: 20px;
        margin-left: 90px; /* Ensure space for the sidebar */
        margin-top: 20px; /* Space below the main header */
        margin-bottom: 70px; /* Space for the footer */
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        max-width: calc(100% - 240px); /* Adjust width for sidebar */
    }

    .section {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: calc(33.333% - 20px);
        text-align: center;
        box-sizing: border-box;
        transition: background-color 0.3s, transform 0.3s;
    }

    .section:hover {
        background-color: #f4f4f4;
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
       .main-header {
        background-color: rgba(76, 175, 80, 0.8);
        color: white;
        padding: 10px;
        text-align: center;
        font-size: 24px;
        margin-top: 70px; /* Space for fixed nav */
        margin-bottom: 30px; /* Space between the header and form */
    }
</style>
</head>
<body>
<nav>
    <a href="#">Home</a>
    <a href="resultview.jsp?password=<%=request.getParameter("password")%>">Result</a>
    <a href="logout">logout</a>
</nav>
<div class="main-header">
    Student Dashboard
</div>

<div class="container">
    <!-- Sections displayed as squares -->
    <div class="section"><b></b><br><br>Result</div>
    <div class="section"><b></b><br><br>Notification</div>
</div>

<footer>
    &copy; 2024 Student Result Management System. All rights reserved.
</footer>

</body>
</html>
