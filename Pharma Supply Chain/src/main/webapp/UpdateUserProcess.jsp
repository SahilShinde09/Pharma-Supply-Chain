<%@page import="java.sql.*"%>
<%@page import="java.io.InputStream"%> 
<%@page import="java.io.FileInputStream"%> 
<%@page import="java.io.File"%> 
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%> 
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%
	String usertype = request.getParameter("usertype");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	
	Connection con = (Connection) application.getAttribute("mycon");
	PreparedStatement ps=null;
	if(usertype.equals("Manufacturer"))
	{
		ps= con.prepareStatement("update manufacturer set m_name=? , password=? where m_id=?",
			ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	}
	else if(usertype.equals("Wholesaler"))
	{
		ps= con.prepareStatement("update wholesaler set w_name=? , password=? where w_id=?",
				ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	}
	else if(usertype.equals("Wholesaler"))
	{
		ps= con.prepareStatement("update Distributor set d_name=? , password=? where d_id=?",
				ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	}
	
	ps.setString(1, name);
	ps.setString(2, password);
	ps.setString(3, id);
	
	
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

