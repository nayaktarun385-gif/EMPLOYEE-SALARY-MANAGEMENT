<%@ page import="java.sql.*, java.util.*, com.dao.DBConnection, com.dao.EmployeeDAO" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM employee WHERE emp_id=?");
ps.setInt(1, id);

ResultSet rs = ps.executeQuery();

String name="", dept="";
double salary=0;
java.sql.Date doj=null;

if(rs.next()){
    name = rs.getString("name");
    salary = rs.getDouble("salary");
    dept = rs.getString("department");
    doj = rs.getDate("date_of_joining");
}

EmployeeDAO dao = new EmployeeDAO();
List<String> deptList = dao.getDepartments();
%>

<html>
<head>
<title>Edit Employee</title>

<style>
body{
  font-family:Poppins;
  background:linear-gradient(135deg,#667eea,#764ba2);
  color:white;
  text-align:center;
}

.card{
  width:350px;
  margin:40px auto;
  padding:30px;
  background:rgba(255,255,255,0.2);
  border-radius:10px;
}

input,select{
  width:100%;
  padding:10px;
  margin:10px 0;
  box-sizing:border-box;
}

.btn{
  border:none;
  cursor:pointer;
  font-size:16px;
}

.update-btn{
  background:#4CAF50;
  color:white;
}

.update-btn:hover{
  background:#45a049;
}

.back-btn{
  background:#f44336;
  color:white;
}

.back-btn:hover{
  background:#d32f2f;
}

.button-group{
  display:flex;
  gap:10px;
  margin-top:15px;
}
</style>

</head>

<body>

<h1>Edit Employee</h1>

<div class="card">

<form action="UpdateEmployeeServlet" method="post">

<input type="hidden" name="id" value="<%= id %>">

<label>Name</label>
<input type="text" name="name" value="<%= name %>" required>

<label>Salary</label>
<input type="number" name="salary" value="<%= salary %>" required>

<label>Department</label>
<select name="department">
<%
for(String d : deptList){
%>
<option <%= d.equals(dept) ? "selected" : "" %>><%= d %></option>
<%
}
%>
</select>

<label>Date of Joining</label>
<input type="date" name="doj" value="<%= doj %>" required>

<div class="button-group">
    <input type="button" value="Back" class="btn back-btn"
           onclick="window.location.href='DisplayEmployeeServlet'">

    <input type="submit" value="Update Employee" class="btn update-btn">
</div>

</form>

</div>

</body>
</html>