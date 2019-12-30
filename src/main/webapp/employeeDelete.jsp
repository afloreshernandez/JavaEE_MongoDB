<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="org.bson.types.ObjectId, com.collabera.mongo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Delete</title>
</head>
<body>
Employee Delete
<hr>
<%
String empId=request.getParameter("id");
//out.print(empId+ "is valid : " + ObjectId.isValid(empId));

EmployeeMongoDao dao = new EmployeeMongoDao();
dao.connectToMongo();

dao.deleteEmployee(new ObjectId(empId));

out.print("<h1>Employee - deleted!</h1>");

%>
<hr>
<a href="employeeList.jsp">Back to Employee List</a>

</body>
</html>