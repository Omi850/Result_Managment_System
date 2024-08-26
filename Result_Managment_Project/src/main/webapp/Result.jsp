<%@page import="java.io.PrintWriter"%>
<%@page import="com.bean.student"%>
<%@page import="com.dau.Query"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        padding-bottom: 60px; /* Space for footer */
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
        max-width: 600px;
        margin: 0 auto;
        background-color: rgba(255, 255, 255, 0.9);
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    label {
        font-size: 16px;
        margin-bottom: 5px;
        display: block;
    }
    input[type="text"],
    input[type="tel"],
    input[type="number"] {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
        margin-bottom: 15px;
    }
    input[type="text"]:focus,
    input[type="tel"]:focus,
    input[type="number"]:focus {
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
    Upload Student Result
</div>
<%int id=Integer.parseInt(request.getParameter("id"));
if(Query.resultrun(id)==true){
      PrintWriter pw=response.getWriter();
	  pw.print("<html><script>alert('Result Already Uploaded!!');window.location.replace('fetch.jsp');</script></html>");
}
%>
<div class="container">
    <form action="Controllerservlet" method="post">
        <input type="hidden" id="data" name="data" value="result" required>
        <input type="hidden" id="id" name="id"  value=<%=id%> required>
        
        <label for="name">Core Java:</label>
        <input type="number" id="name" name="java" placeholder="Enter Mark (1-100)" required>
        
        <label for="gender">Advanced java:</label>
        <input type="number" id="gender" name="ajava"  placeholder="Enter Mark (1-100)"  required>
        
        <label for="mobile">Html:</label>
        <input type="number" id="mobile" name="html"  placeholder="Enter Mark (1-100)"  pattern="[0-9]{10}" required>
        
        <label for="city">Css:</label>
        <input type="number" id="city" name="css"  placeholder="Enter Mark (1-100)" required>
        
        <label for="password">JavaScript:</label>
        <input type="number" id="password" name="script"  placeholder="Enter Mark (1-100)"  required>
        
        <button type="submit">Upload</button>
    </form>
</div>

<footer>
    &copy; 2024 Student Result Management System. All rights reserved.
</footer>

</body>
</html>
