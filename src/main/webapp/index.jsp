<%@ page import="java.sql.*, com.dao.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
int totalEmployees = 0;
double maxSalary = 0;

try {
    Connection con = DBConnection.getConnection();

    // TOTAL EMPLOYEES
    Statement st1 = con.createStatement();
    ResultSet rs1 = st1.executeQuery("SELECT COUNT(*) FROM employee");
    if(rs1.next()){
        totalEmployees = rs1.getInt(1);
    }

    // MAX SALARY
    Statement st2 = con.createStatement();
    ResultSet rs2 = st2.executeQuery("SELECT MAX(salary) FROM employee");
    if(rs2.next()){
        maxSalary = rs2.getDouble(1);
    }

} catch(Exception e){
    e.printStackTrace();
}
%>

<html>
<head>
<title>Employee Dashboard</title>

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

.sidebar a{
    display:block;
    color:var(--muted);
    padding:12px;
    text-decoration:none;
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

/* CARDS */
.cards{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:20px;
}

.card{
    background:var(--card);
    padding:20px;
    border-radius:10px;
}

/* ACTION */
.actions{
    margin-top:30px;
    display:grid;
    grid-template-columns:repeat(5,1fr);
    gap:15px;
}

.action{
    background:var(--card);
    padding:15px;
    text-align:center;
    border-radius:10px;
}

.action a{
    color:white;
    text-decoration:none;
}
</style>
</head>

<body>

<div class="sidebar">
    <h2>EMS</h2>
    <a href="index.jsp">Dashboard</a>
    <a href="empadd.jsp">Add Employee</a>
    <a href="DisplayEmployeeServlet">View</a>
    <a href="empupdate.jsp">Update</a>
    <a href="empdelete.jsp">Delete</a>
    <a href="report_form.jsp">Reports</a>
</div>

<div class="main">

<h1>🚀 Employee Dashboard</h1>

<div class="cards">

    <div class="card">
        <h3>Total Employees</h3>
        <h2><%= totalEmployees %></h2>
    </div>

    <div class="card">
        <h3>Departments</h3>
        <h2>8</h2>
    </div>

    <div class="card">
        <h3>Highest Salary</h3>
        <h2>₹ <%= (maxSalary == 0 ? "--" : maxSalary) %></h2>
    </div>

    <div class="card">
        <h3>Reports</h3>
        <h2>Active</h2>
    </div>

</div>

<div class="actions">

    <div class="action"><a href="empadd.jsp">Add</a></div>
    <div class="action"><a href="DisplayEmployeeServlet">View</a></div>
    <div class="action"><a href="empupdate.jsp">Update</a></div>
    <div class="action"><a href="empdelete.jsp">Delete</a></div>
    <div class="action"><a href="report_form.jsp">Report</a></div>

</div>

</div>

</body>
</html>