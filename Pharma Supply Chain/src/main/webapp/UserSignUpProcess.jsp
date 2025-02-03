<%@page import="java.sql.*"%>
<%@page import="java.io.InputStream"%> 
<%@page import="java.io.FileInputStream"%> 
<%@page import="java.io.File"%> 
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%
	
	String c_country = request.getParameter("c_country");
	String c_fname = request.getParameter("c_fname");
	String c_lname = request.getParameter("c_lname");
	
	String c_address = request.getParameter("c_address");
	String c_state_country = request.getParameter("c_state_country");
	String c_postal_zip = request.getParameter("c_postal_zip");
	String c_email_address = request.getParameter("c_email_address");
	String c_phone = request.getParameter("c_phone");
	String c_password = request.getParameter("c_password");
	
		
	Connection con = (Connection) application.getAttribute("mycon");
	PreparedStatement ps=null;
	ps= con.prepareStatement("insert into customer (c_country,c_fname,c_lname,c_address,c_state_country,c_postal_zip,c_email_address,c_phone,c_password)values(?,?,?,?,?,?,?,?,?)",
			Statement.RETURN_GENERATED_KEYS);
	
	ps.setString(1, c_country);
	ps.setString(2, c_fname);
	ps.setString(3, c_lname);
	
	ps.setString(4, c_address);
	ps.setString(5, c_state_country);
	ps.setString(6, c_postal_zip);
	ps.setString(7, c_email_address);
	ps.setString(8, c_phone);
	ps.setString(9, c_password);
	
	
	
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
		
		session.setAttribute("islogin", "Login Success!!!");
		

%>
	<script type="text/javascript">
		alert("Sign Up Success!!!");
	</script>

	<jsp:forward page="index.jsp"></jsp:forward>
<%
	}

	else {
		
		
%>
<jsp:forward page="index.jsp"></jsp:forward>

<%
	}
%>
