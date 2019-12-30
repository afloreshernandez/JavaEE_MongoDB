<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.collabera.mongo.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee List</title>
<style>
body{
text-align:center;
}
table{
margin: auto;
background-color: #FFF8DC;
font: 14px arial, sans-serif;
margin-bottom: 10px;
}
table.emp-table tr:hover{
background-color: lightGray;
}
tr:nth-child(odd) {background-color: lightblue;}
tr:nth-child(even) {background-color: #FFFAFA;}
th{
background-color: #FFDEAD;
padding: 8px 0;
}
td{
min-width: 100px;
}
.page-link{
margin: 2px;
padding:4px 6px;
text-decoration: none;
border: solid 1px #FFFFFF;
}
.page-link:hover{
border: solid 1px #4CAF50;
}
.page-link.active{
background-color: #4CAF50;
color: white;
font-weight:bold;
}
.container{
width: 100%;
}
.page-no{
position:absolute;
left:90px;
}
.add-employee{
position:absolute;
right:90px;
}
</style>
</head>
<body>
<%
EmployeeMongoDao dao = new EmployeeMongoDao();
dao.connectToMongo();
List<Employee> list=dao.listAllEmployees();

%>
<h1>Welcome to my page.</h1>
<h1>Employee List</h1>
<div class="container">

<table border="0" style="width:400px;">
<tr>
<td></td>
<td><a href="employeeInsert.jsp?">Add Employee</a></td>
<td><a href="logout.jsp?">Log-out</td>
</tr>
</table>
<table class="emp-table" border="1">
<tr>
<th>Id</th>
<th>First Name</th>
<th>Last Name</th>
<th>Age</th>
<th>Action</th>
</tr>

<%for(Employee e:list){ %>
<tr>
<td><%=e.getId()%></td>
<td><%=e.getFirstName()%></td>
<td><%=e.getLastName()%></td>
<td><%=e.getAge()%></td>
<td>
<a href="employeeUpdate.jsp?id=<%=e.getId() %>">Update</a>
<a href="employeeDelete.jsp?id=<%=e.getId() %>">Delete</a>
</td>
</tr>
<%}%>
</table>

</div>
</body>
</html>
