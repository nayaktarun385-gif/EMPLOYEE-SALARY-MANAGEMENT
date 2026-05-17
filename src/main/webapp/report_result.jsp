<%@ page import="java.util.*, com.model.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
List<Employee> list = (List<Employee>) request.getAttribute("reportList");
%>

<html>
<head>
<title>Report Result</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>
:root{
    --bg:#0f172a;
    --card:#1e293b;
    --accent:#6366f1;
    --text:#e2e8f0;
    --muted:#94a3b8;
}

body{
    font-family:'Poppins',sans-serif;
    background:var(--bg);
    color:var(--text);
    margin:0;
}

/* SIDEBAR */
.sidebar{
    position:fixed;
    width:220px;
    height:100%;
    background:#020617;
    padding:20px;
}

.sidebar h2{
    color:white;
}

.sidebar a{
    display:block;
    color:var(--muted);
    padding:12px;
    text-decoration:none;
    border-radius:6px;
}

.sidebar a:hover{
    background:var(--accent);
    color:white;
}

/* MAIN */
.main{
    margin-left:240px;
    padding:30px;
}

h1{
    margin-bottom:20px;
}

/* TABLE */
table{
    width:100%;
    border-collapse:collapse;
    background:white;
    color:black;
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 10px 25px rgba(0,0,0,0.3);
}

th{
    background:var(--accent);
    color:white;
    padding:14px;
}

td{
    padding:12px;
}

tr:nth-child(even){
    background:#f4f4f4;
}

tr:hover{
    background:#e0e7ff;
}

/* BOX */
.box{
    background:var(--card);
    padding:40px;
    border-radius:12px;
    box-shadow:0 10px 25px rgba(0,0,0,0.3);
}

.box h2{
    color:#f87171;
}

.box p{
    color:var(--muted);
}

/* BUTTON */
.btn{
    display:inline-block;
    margin-top:15px;
    margin-right:10px;
    padding:10px 20px;
    background:var(--accent);
    color:white;
    text-decoration:none;
    border-radius:8px;
    transition:0.3s;
}

.btn:hover{
    background:#4f46e5;
}
</style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <h2>EMS</h2>
    <a href="index.jsp">Dashboard</a>
    <a href="empadd.jsp">Add Employee</a>
    <a href="DisplayEmployeeServlet">View Employees</a>
    <a href="empupdate.jsp">Update</a>
    <a href="empdelete.jsp">Delete</a>
    <a href="report_form.jsp">Reports</a>
</div>

<!-- MAIN -->
<div class="main">

<h1>📊 Report Result</h1>

<% if(list == null){ %>

    <div class="box">
        <h2>⚠ Invalid Access</h2>
        <p>Please generate report from report page</p>
        <a href="report_form.jsp" class="btn">Go to Report</a>
    </div>

<% } else if(list.isEmpty()){ %>

    <div class="box">
        <h2>⚠ No Records Found</h2>
        <p>Try different filters or adjust your search</p>
        <a href="report_form.jsp" class="btn">Try Again</a>
    </div>

<% } else { %>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Salary</th>
            <th>Department</th>
        </tr>

        <% for(Employee e : list){ %>
        <tr>
            <td><%= e.getId() %></td>
            <td><%= e.getName() %></td>
            <td>₹ <%= e.getSalary() %></td>
            <td><%= e.getDepartment() %></td>
        </tr>
        <% } %>

    </table>

<% } %>

<br><br>

<a href="index.jsp" class="btn">🏠 Home</a>
<a href="report_form.jsp" class="btn">📊 Generate Another Report</a>

</div>

</body>
</html>