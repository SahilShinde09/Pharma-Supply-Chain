<%@page import="java.sql.*"%>
<%@page import="java.io.InputStream"%> 
<%@page import="java.io.FileInputStream"%> 
<%@page import="java.io.File"%> 
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%> 
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%
	String id = request.getParameter("wo_id");
	String status = request.getParameter("status");
	
	Connection con = (Connection) application.getAttribute("mycon");
	PreparedStatement ps=null;
	
	
	ps= con.prepareStatement("insert into wholesaler_order_track(wo_id,status) values(?,?)",
			ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	
	ps.setString(1, id);
	ps.setString(2, status);
	
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
<jsp:forward page="UserManufacturerOrder.jsp"></jsp:forward>
<%
	}

	else {
		
		
%>
<jsp:forward page="UserManufacturerOrder.jsp"></jsp:forward>
<%
	}
%>

