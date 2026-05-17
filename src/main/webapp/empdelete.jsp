<%@ page import="java.util.*, com.model.Employee, com.dao.EmployeeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
EmployeeDAO dao = new EmployeeDAO();
List<Employee> list = dao.getAllEmployees();
%>

<html>
<head>
<title>Delete Employee</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>
:root{
    --bg:#0f172a;
    --card:#1e293b;
    --accent:#6366f1;
    --danger:#ef4444;
    --text:#e2e8f0;
    --muted:#94a3b8;
}

body{
    margin:0;
    font-family:'Poppins',sans-serif;
    background:var(--bg);
    color:var(--text);
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

/* TABLE CONTAINER */
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

/* DELETE BUTTON */
.delete-btn{
    background:var(--danger);
    color:white;
    border:none;
    padding:8px 14px;
    border-radius:6px;
    cursor:pointer;
}

.delete-btn:hover{
    background:#dc2626;
}

/* BACK BUTTON */
.btn{
    display:inline-block;
    margin-top:25px;
    padding:12px 25px;
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

<h1>🗑 Delete Employee</h1>

<div class="container">

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
if(list != null && !list.isEmpty()){
  for(Employee e : list){
%>

<tr>
  <td><%= e.getId() %></td>
  <td><%= e.getName() %></td>
  <td>₹ <%= e.getSalary() %></td>
  <td><%= e.getDepartment() %></td>
  <td><%= e.getDateOfJoining() %></td>

  <td>
    <form action="DeleteEmployeeServlet" method="post">
      <input type="hidden" name="id" value="<%= e.getId() %>">
      <input type="submit" value="Delete" class="delete-btn"
             onclick="return confirm('Are you sure you want to delete this employee?');">
    </form>
  </td>
</tr>

<%
  }
} else {
%>

<tr>
  <td colspan="6">No Employees Found</td>
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