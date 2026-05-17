<%@ page import="java.sql.*, com.dao.DBConnection, java.util.*, com.dao.EmployeeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
int nextId = 1;

try {
    Connection con = DBConnection.getConnection();
    Statement st = con.createStatement();

    ResultSet rs = st.executeQuery("SELECT MAX(emp_id) FROM employee");

    if (rs.next()) {
        nextId = rs.getInt(1) + 1;
    }

} catch(Exception e){
    e.printStackTrace();
}

// Department list
EmployeeDAO dao = new EmployeeDAO();
List<String> deptList = dao.getDepartments();
%>

<html>
<head>
<title>Add Employee</title>

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

/* CARD */
.card{
    width:450px;
    margin:auto;
    padding:30px;
    border-radius:12px;
    background:var(--card);
    box-shadow:0 10px 25px rgba(0,0,0,0.3);
}

/* FORM */
label{
    display:block;
    margin-top:12px;
    text-align:left;
}

input, select{
    width:100%;
    padding:10px;
    margin-top:6px;
    border-radius:8px;
    border:none;
    outline:none;
    box-sizing:border-box;
}

/* BUTTON */
.btn{
    padding:12px;
    background:var(--accent);
    color:white;
    border:none;
    border-radius:8px;
    cursor:pointer;
    width:100%;
}

.btn:hover{
    background:#4f46e5;
}

.back-btn{
    background:#64748b;
}

.back-btn:hover{
    background:#475569;
}

.button-group{
    display:flex;
    gap:10px;
    margin-top:20px;
}
</style>

<script>
function validateForm(){
    let salary = document.forms["f"]["salary"].value;

    if(Number(salary) <= 0){
        alert("Salary must be greater than 0");
        return false;
    }

    return true;
}
</script>

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

<h1>Add Employee</h1>

<div class="card">

<form name="f" action="AddEmployeeServlet" method="post" onsubmit="return validateForm()">

<label>Employee ID</label>
<input type="text" value="<%= nextId %>" readonly>

<label>Name</label>
<input type="text" name="name" required>

<label>Salary</label>
<input type="number" name="salary" min="1" required>

<label>Department</label>
<select name="department" required>
    <option value="">Select Department</option>

    <%
    for(String d : deptList){
    %>
        <option><%= d %></option>
    <%
    }
    %>
</select>

<label>Date of Joining</label>
<input type="date" name="doj" required>

<div class="button-group">
    <input type="button" value="Back" class="btn back-btn"
           onclick="window.location.href='index.jsp'">

    <input type="submit" value="Add Employee" class="btn">
</div>

</form>

</div>

</div>

</body>
</html>