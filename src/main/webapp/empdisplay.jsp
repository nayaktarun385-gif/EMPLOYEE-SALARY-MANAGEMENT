<%@ page import="java.util.*, com.model.Employee, java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
List<Employee> list = (List<Employee>) request.getAttribute("empList");
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
%>

<html>
<head>
<title>Employee Details</title>

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

.sidebar h2{ color:white; }

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

/* CONTAINER */
.container{
    width:95%;
    margin:auto;
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
    table-layout:fixed;
}

th{
    background:var(--accent);
    color:white;
    padding:14px;
    text-align:center;
}

td{
    padding:14px;
}

/* ALIGNMENT */
th:nth-child(1), td:nth-child(1){ width:10%; text-align:center; }
th:nth-child(2), td:nth-child(2){ width:30%; text-align:left; }
th:nth-child(3), td:nth-child(3){ width:20%; text-align:right; }
th:nth-child(4), td:nth-child(4){ width:25%; text-align:center; }
th:nth-child(5), td:nth-child(5){ width:15%; text-align:center; }

/* ROW STYLE */
tr:nth-child(even){
    background:#f4f4f4;
}

tr:hover{
    background:#e0e7ff;
}

/* BUTTON */
.btn{
    display:inline-block;
    margin-top:25px;
    padding:12px 25px;
    background:var(--accent);
    color:white;
    text-decoration:none;
    border-radius:8px;
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

<h1>Employee Details</h1>

<div class="container">

<table>

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Salary</th>
    <th>Department</th>
    <th>Date of Joining</th>
</tr>

<%
if(list != null && !list.isEmpty()){
    for(Employee e : list){
%>

<tr>
    <td><%= e.getId() %></td>

    <td><%= e.getName() %></td>

    <td>₹ <%= String.format("%.0f", e.getSalary()) %></td>

    <td><%= e.getDepartment() %></td>

    <td>
        <%= (e.getDateOfJoining() != null) 
            ? sdf.format(e.getDateOfJoining()) 
            : "-" %>
    </td>
</tr>

<%
    }
} else {
%>

<tr>
    <td colspan="5">No Employees Found</td>
</tr>

<%
}
%>

</table>

<a href="index.jsp" class="btn">⬅ Back to Home</a>

</div>

</div>

</body>
</html>