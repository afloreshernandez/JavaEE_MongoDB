

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="org.bson.types.ObjectId, com.collabera.mongo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Insert</title>
<style>
form label{
display: inline-block;
min-width:120px;
}

</style>
</head>
<body>
<%

String firstName=request.getParameter("firstName");
String lastName=request.getParameter("lastName");
String sAge=request.getParameter("age");

if(firstName !=null && lastName!=null){
EmployeeMongoDao dao = new EmployeeMongoDao();
dao.connectToMongo();
int age = Integer.parseInt(sAge);
Employee emp = new Employee(firstName, lastName, age);
dao.insertEmployee(emp);
out.print("Inserted: " + emp + " <hr>");
}

%>

<h2>Insert Employee</h2>
<hr>

<form action="employeeInsert.jsp" method="post">

<label>First Name:</label>
<input type="text" name="firstName" value=""><br><br>
<label>Last Name:</label>
<input type="text" name="lastName" value=""><br><br>
<label>Age:</label>
<input type="text" name="age" value=""><br><br>
<hr>
<input type="submit" value="Save">
</form>

<hr>
<a href="employeeList.jsp">Back to Employee List</a>
</body>
</html>