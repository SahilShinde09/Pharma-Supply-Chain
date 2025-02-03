<%@page import="java.sql.*"%>
<%@page import="java.io.InputStream"%> 
<%@page import="java.io.FileInputStream"%> 
<%@page import="java.io.File"%> 
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%> 
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%
	String usertype = request.getParameter("type");
	String id = request.getParameter("id");

	
	Connection con = (Connection) application.getAttribute("mycon");
	PreparedStatement ps=null;
	if(usertype.equals("Manufacturer"))
	{
		ps= con.prepareStatement("delete from manufacturer where m_id=?",
			ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	}
	else if(usertype.equals("Wholesaler"))
	{
		ps= con.prepareStatement("delete from wholesaler where w_id=?",
				ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	}
	else if(usertype.equals("Distributor"))
	{
		ps= con.prepareStatement("delete from Distributor where d_id=?",
				ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	}

	ps.setString(1, id);
	
	
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
<jsp:forward page="adminHome.jsp"></jsp:forward>
<%
	}

	else {
		
		
%>
<jsp:forward page="adminHome.jsp"></jsp:forward>
<%
	}
%>

