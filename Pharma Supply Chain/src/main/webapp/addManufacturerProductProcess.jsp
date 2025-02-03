<%@page import="java.sql.*"%>
<%@page import="java.io.InputStream"%> 
<%@page import="java.io.FileInputStream"%> 
<%@page import="java.io.File"%> 
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%> 
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%

	String mp_id = request.getParameter("mp_id");
	String mp_name = request.getParameter("mp_name");
	String mp_desc = request.getParameter("mp_desc");
	String mp_price = request.getParameter("mp_price");
	String myloc="C:/Users/Admin/Desktop/images/"+request.getParameter("image");
	String m_id = request.getParameter("m_id");
	
	
	Connection con = (Connection) application.getAttribute("mycon");
	PreparedStatement ps = con.prepareStatement("insert into mproduct values(?,?,?,?,?,?)",
			ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ps.setString(1, mp_id);
	ps.setString(2, mp_name);
	ps.setString(3, mp_desc);
	ps.setString(4, mp_price);
	ps.setString(6, m_id);
	
	try
	{
		System.out.println("OK1");
		File image= new File(myloc); 
		System.out.println("Image : "+myloc);
		FileInputStream fis=new FileInputStream(image); 
		System.out.println("Fis : "+fis);
		ps.setBinaryStream(5, (InputStream) fis, (int) (image.length())); 
	}
	catch(Exception e)
	{
		System.out.println("H1 : "+e);
	}
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
<jsp:forward page="UserManufacturerHome.jsp"></jsp:forward>
<%
	}

	else {
		
		
%>
<jsp:forward page="UserManufacturerHome.jsp"></jsp:forward>
<%
	}
%>

