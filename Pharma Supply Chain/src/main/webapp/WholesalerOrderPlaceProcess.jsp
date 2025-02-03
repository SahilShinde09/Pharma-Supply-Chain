<%@page import="java.sql.*"%>
<%@page import="java.io.InputStream"%> 
<%@page import="java.io.FileInputStream"%> 
<%@page import="java.io.File"%> 
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%
	String itemsJson = request.getParameter("itemsJson");
	String m_id = request.getParameter("m_id");
	String wo_country = request.getParameter("wo_country");
	String wo_fname = request.getParameter("wo_fname");
	String wo_lname = request.getParameter("wo_lname");
	String wo_companyname = request.getParameter("wo_companyname");
	String wo_address = request.getParameter("wo_address");
	String wo_state_country = request.getParameter("wo_state_country");
	String wo_postal_zip = request.getParameter("wo_postal_zip");
	String wo_email_address = request.getParameter("wo_email_address");
	String wo_phone = request.getParameter("wo_phone");
	String wo_order_notes = request.getParameter("wo_order_notes");
	
		
	Connection con = (Connection) application.getAttribute("mycon");
	PreparedStatement ps=null;
	ps= con.prepareStatement("insert into wholesaler_order (wo_country,wo_fname,wo_lname,wo_companyname,wo_address,wo_state_country,wo_postal_zip,wo_email_address,wo_phone,wo_order_notes,itemsJson,m_id,w_id)values(?,?,?,?,?,?,?,?,?,?,?,?,?)",
			Statement.RETURN_GENERATED_KEYS);
	
	ps.setString(1, wo_country);
	ps.setString(2, wo_fname);
	ps.setString(3, wo_lname);
	ps.setString(4, wo_companyname);
	ps.setString(5, wo_address);
	ps.setString(6, wo_state_country);
	ps.setString(7, wo_postal_zip);
	ps.setString(8, wo_email_address);
	ps.setString(9, wo_phone);
	ps.setString(10, wo_order_notes);
	ps.setString(11, itemsJson);
	ps.setString(12, m_id);
	ps.setString(13, (String)session.getAttribute("uname"));
	
	
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
		    
		    ps= con.prepareStatement("insert into wholesaler_order_track (wo_id,status)values(?,?)",
					Statement.RETURN_GENERATED_KEYS);
		    
		    ps.setString(1,""+generatedId);
		    ps.setString(2,"Order Placed Success");
		    ps.executeUpdate();
		    
		}

%>
<jsp:forward page="thankyou.jsp"></jsp:forward>
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
