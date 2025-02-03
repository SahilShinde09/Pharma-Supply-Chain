<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String dprice = request.getParameter("dprice");
	String dp_id = request.getParameter("dp_id");
	//System.out.println("OK1 : "+ dprice);
	//System.out.println("OK2 : "+ dp_id);
	Connection con = (Connection) application.getAttribute("mycon");
	PreparedStatement ps=null;
	ps= con.prepareStatement("update dproduct set dp_price=? where dp_id=?",
			ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ps.setString(1, dprice);
	ps.setString(2, dp_id);
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
<jsp:forward page="UserDistributorHome.jsp"></jsp:forward>
<%
	}

	else {
		
		
%>
<jsp:forward page="UserDistributorHome.jsp"></jsp:forward>
<%
	}
%>