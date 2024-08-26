<%@page import="com.bean.result"%>
<%@page import="com.bean.student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dau.Query"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Data</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: url('https://example.com/your-collage-image.jpg') no-repeat center center fixed; 
        background-size: cover;
        color: #333;
        padding-bottom: 60px; /* Ensures space for footer */
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
        max-width: 1000px;
        margin: 0 auto;
    }
    .search-container {
        margin-bottom: 20px;
    }
    .search-container input[type="text"] {
        width: calc(100% - 20px);
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        margin-right: 10px;
    }
    .search-container button {
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
        font-size: 16px;
    }
    .search-container button:hover {
        background-color: #45a049;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #4CAF50;
        color: white;
    }
    td {
        background-color: rgba(255, 255, 255, 0.9);
    }
    button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        transition: background-color 0.3s, transform 0.3s;
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
        margin-top: 20px; /* Space above the footer */
    }
</style>
<script>
    function searchTable() {
        var input, filter, table, tr, td, i, j, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("studentTable");
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) {
            tr[i].style.display = "none"; 
            td = tr[i].getElementsByTagName("td");
            for (j = 0; j < td.length; j++) {
                if (td[j]) {
                    txtValue = td[j].textContent || td[j].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                        break;
                    }
                }       
            }
        }
    }
</script>
</head>
<body>

<nav>
    <a href="studentindex.jsp?password=<%=request.getParameter("password")%>">Home</a>
    <a href="#">Result</a>
    <a href="logout">logout</a>
</nav>

<div class="main-header">
    Student Result Data
</div>

<div class="container">
    <div class="search-container">
        <input type="text" id="searchInput" onkeyup="searchTable()" placeholder="Search for marks, etc.">
    </div>
    <table id="studentTable" border="1" cellpadding="10" cellspacing="0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Java</th>
                <th>Core Java</th>
                <th>Html</th>
                <th>Css</th>
                <th>Javascript</th>
                <th>Total_Mark</th>
                <th>Percentage</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <% 
            String passworddata=request.getParameter("password");
            System.out.println(passworddata);
            ArrayList<result> li = Query.fetchresultdata(passworddata);
            for(result ob: li) { 
        %>
            <tr>
                <td><%= ob.getId() %></td>
                <td><%= ob.getJava() %></td>
                <td><%= ob.getAjava()%></td>
                <td><%= ob.getHtml() %></td>
                <td><%= ob.getCss() %></td>
                <td><%= ob.getScript()%></td>
                <td><%= ob.getTotal_mark()%></td>
                <td><%= ob.getPer()%></td>  
                <td>
                    <form action="print.jsp" method="post">
                        <input type="hidden" name="data" value="delete">
                        <input type="hidden" name="id" value="<%=ob.getId()%>">
                        <button type="submit" style="background-color: blue">Print</button>
                    </form>
                </td>            
            </tr>
        <% } %> 
        </tbody>
    </table>
</div>
<footer>
    &copy; 2024 Student Result Management System. All rights reserved.
</footer>

</body>
</html>
