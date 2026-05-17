<%@ page import="java.util.*, com.model.Employee, com.dao.EmployeeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
EmployeeDAO dao = new EmployeeDAO();
List<Employee> list = dao.getAllEmployees();
%>

<html>
<head>
<title>Update Employee</title>

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

/* TABLE */
table{
    width:95%;
    margin:auto;
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

/* ROW */
tr:nth-child(even){
    background:#f4f4f4;
}

tr:hover{
    background:#e0e7ff;
}

/* BUTTON */
.update-btn{
    background:var(--accent);
    color:white;
    border:none;
    padding:6px 14px;
    border-radius:6px;
    cursor:pointer;
}

.update-btn:hover{
    background:#4f46e5;
}

.btn{
    display:inline-block;
    margin-top:20px;
    padding:10px 20px;
    background:var(--accent);
    color:white;
    text-decoration:none;
    border-radius:8px;
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

<h1>✏️ Update Employee</h1>

<table>

<tr>
  <th>ID</th>
  <th>Name</th>
  <th>Salary</th>
  <th>Department</th>
  <th>Date of Joining</th>
  <th>Action</th>
</tr>

<%
for(Employee e : list){
%>

<tr>
  <td><%= e.getId() %></td>
  <td><%= e.getName() %></td>
  <td>₹ <%= e.getSalary() %></td>
  <td><%= e.getDepartment() %></td>
  <td><%= e.getDateOfJoining() %></td>

  <td>
    <form action="editEmployee.jsp" method="get">
      <input type="hidden" name="id" value="<%= e.getId() %>">
      <input type="submit" value="Update" class="update-btn">
    </form>
  </td>
</tr>

<%
}
%>

</table>

<a href="index.jsp" class="btn">⬅ Back</a>

</div>

</body>
</html>