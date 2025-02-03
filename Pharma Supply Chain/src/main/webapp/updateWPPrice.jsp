<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String wprice = request.getParameter("wprice");
	String wp_id = request.getParameter("wp_id");
	Connection con = (Connection) application.getAttribute("mycon");
	PreparedStatement ps=null;
	ps= con.prepareStatement("update wproduct set wp_price=? where wp_id=?",
			ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ps.setString(1, wprice);
	ps.setString(2, wp_id);
	int i=0;
	try
	{
		i = ps.executeUpdate();
	}
	catch(Exception e)
	{
		System.out.println("H2 : "+e);
	}
	if (i>0) 
	{
		
		
%>
<jsp:forward page="UserWholesalerHome.jsp"></jsp:forward>
<%
	}

	else {
		
		
%>
<jsp:forward page="UserWholesalerHome.jsp"></jsp:forward>
<%
	}
%>