  <%@ page import="com.Item" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import= "java.sql.*" %>
    
 <%if (request.getParameter("itemCode") != null) { 
	 Item itemObj = new Item(); 
	 String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), 
			 request.getParameter("itemName"),
			 request.getParameter("itemPrice"), 
			 request.getParameter("itemDescription")
	); 
	 session.setAttribute("statusMsg", stsMsg);
	}
 %> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
if(request.getParameter("itemCode") != null)
{ 
	Item itemObj = new Item(); 
	itemObj.connect(); //For testing the connect method
}
%>

<h1>Items Management JSP</h1>
<form method="post"action="itemps.jsp">
Item code: <input name="itemCode"type="text">
<br> Item name: <input name="itemName"type="text">
<br>Item price: <input name="itemPrice"type="text">
<br>Item description: <input name="itemDescription" type="text">
<br><input name="btnSubmit"type="submit"value="Save">
</form>
<%out.print(session.getAttribute("statusMsg")); %>


<%Item itemObj = new Item(); out.print(itemObj.readItems()); %>

</body>
</html>
