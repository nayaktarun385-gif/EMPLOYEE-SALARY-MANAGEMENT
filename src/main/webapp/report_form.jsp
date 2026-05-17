<%@ page import="java.util.*, com.dao.EmployeeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
EmployeeDAO dao = new EmployeeDAO();
List<String> deptList = dao.getDepartments();
%>

<html>
<head>
<title>Generate Report</title>

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

h1{
    margin-bottom:20px;
}

/* CARD */
.card{
    width:420px;
    margin:auto;
    padding:30px;
    border-radius:15px;
    background:var(--card);
    box-shadow:0 10px 30px rgba(0,0,0,0.4);
}

/* INPUTS */
label{
    display:block;
    margin-top:12px;
    font-size:14px;
}

input,select{
    width:100%;
    padding:12px;
    margin-top:6px;
    border-radius:8px;
    border:none;
    outline:none;
    background:#0f172a;
    color:white;
}

/* BUTTON */
.btn{
    width:100%;
    padding:12px;
    margin-top:20px;
    border:none;
    border-radius:8px;
    background:var(--accent);
    color:white;
    font-size:16px;
    cursor:pointer;
}

.btn:hover{
    background:#4f46e5;
}
</style>

<script>
function showFields(){

    let type = document.getElementById("type").value;

    document.getElementById("deptDiv").style.display = "none";
    document.getElementById("expDiv").style.display = "none";
    document.getElementById("salaryDiv").style.display = "none";
    document.getElementById("nameDiv").style.display = "none";

    if(type === "experience"){
        document.getElementById("deptDiv").style.display = "block";
        document.getElementById("expDiv").style.display = "block";
    }
    else if(type === "department"){
        document.getElementById("deptDiv").style.display = "block";
        document.getElementById("salaryDiv").style.display = "block";
    }
    else if(type === "name"){
        document.getElementById("nameDiv").style.display = "block";
    }
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

<h1>📊 Generate Report</h1>

<div class="card">

<form action="ReportCriteriaServlet" method="post">

<label>Select Report Type</label>
<select name="type" id="type" onchange="showFields()" required>
    <option value="">Select Report</option>
    <option value="experience">By Experience</option>
    <option value="department">By Department + Salary</option>
    <option value="name">By Name</option>
</select>

<div id="deptDiv" style="display:none;">
    <label>Department</label>
    <select name="department">
        <option value="">Select Department</option>
        <% for(String d : deptList){ %>
        <option value="<%= d %>"><%= d %></option>
        <% } %>
    </select>
</div>

<div id="expDiv" style="display:none;">
    <label>Minimum Experience</label>
    <input type="number" name="experience">
</div>

<div id="salaryDiv" style="display:none;">
    <label>Salary Range</label>
    <input type="number" name="minSalary" placeholder="Min Salary">
    <input type="number" name="maxSalary" placeholder="Max Salary">
</div>

<div id="nameDiv" style="display:none;">
    <label>Starting Letter</label>
    <input type="text" name="letter">
</div>

<input type="submit" value="Generate Report" class="btn">

</form>

</div>

</div>

</body>
</html>