<%@page import="java.sql.*"%>
<%@page import="java.io.InputStream"%> 
<%@page import="java.io.FileInputStream"%> 
<%@page import="java.io.File"%> 
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%
	String c_id = request.getParameter("c_id");
	String itemsJson = request.getParameter("itemsJson");
	String c_country = request.getParameter("c_country");
	String c_fname = request.getParameter("c_fname");
	String c_lname = request.getParameter("c_lname");
	String c_address = request.getParameter("c_address");
	String c_state_country = request.getParameter("c_state_country");
	String c_postal_zip = request.getParameter("c_postal_zip");
	String c_email_address = request.getParameter("c_email_address");
	String c_phone = request.getParameter("c_phone");
	String c_order_notes = request.getParameter("c_order_notes");
	
		
	Connection con = (Connection) application.getAttribute("mycon");
	PreparedStatement ps=null;
	ps= con.prepareStatement("insert into customer_order (co_country,co_fname,co_lname,co_address,co_state_country,co_postal_zip,co_email_address,co_phone,co_order_notes,itemsJson,c_id)values(?,?,?,?,?,?,?,?,?,?,?)",
			Statement.RETURN_GENERATED_KEYS);
	
	ps.setString(1, c_country);
	ps.setString(2, c_fname);
	ps.setString(3, c_lname);
	ps.setString(4, c_address);
	ps.setString(5, c_state_country);
	ps.setString(6, c_postal_zip);
	ps.setString(7, c_email_address);
	ps.setString(8, c_phone);
	ps.setString(9, c_order_notes);
	ps.setString(10, itemsJson);
	ps.setString(11, c_id);
	
	
	
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
		
		ResultSet rs = ps.getGeneratedKeys();
		if (rs.next()) {
		    String generatedId = rs.getString(1); // Assuming the ID column is of type long
		    System.out.println("Generated ID: " + generatedId);
		    session.setAttribute("orderId", generatedId);
		    session.setAttribute("cid", c_id);
		    
		    ps= con.prepareStatement("insert into customer_order_track (co_id,status)values(?,?)",
					Statement.RETURN_GENERATED_KEYS);
		    
		    ps.setString(1,""+generatedId);
		    ps.setString(2,"Order Placed Success");
		    ps.executeUpdate();
		    
		}

%>
<jsp:forward page="cthankyou.jsp"></jsp:forward>
<%
	}

	else {
		
		
%>
<script>
	alert("Something Problem Please Check Your Record!!!");
</script>

<%
	}
%>
