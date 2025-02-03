<%@page import="java.sql.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%
	String usertype = request.getParameter("usertype");
	String id = request.getParameter("id");
	String password = request.getParameter("userpass");
	Connection con = (Connection) application.getAttribute("mycon");
	
	PreparedStatement ps=null;
	if(usertype.equals("Manufacturer"))
	{
		ps = con.prepareStatement("select * from Manufacturer where m_id=? and password=?",
				ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	}
	else if(usertype.equals("Wholesaler"))
	{
		ps = con.prepareStatement("select * from Wholesaler where w_id=? and password=?",
				ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	}
	else if(usertype.equals("Distributor"))
	{
		ps = con.prepareStatement("select * from Distributor where d_id=? and password=?",
				ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	}
	else
	{
		ps = con.prepareStatement("select * from customer where c_email_address=? and c_password=?",
				ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	}
	
	ps.setString(1, id);
	ps.setString(2, password);

	ResultSet rs = ps.executeQuery();

	if (rs.next()) 
	{
		session.setAttribute("islogin", "plz sign in first");
		session.setAttribute("uname", id);
		session.setAttribute("usertype", usertype);
		if(usertype.equals("Manufacturer"))
		{
%>
			<jsp:forward page="UserManufacturerHome.jsp"></jsp:forward>
<%
		}
		else if(usertype.equals("Wholesaler"))
		{
	%>
				<jsp:forward page="UserWholesalerHome.jsp"></jsp:forward>
	<%
		}
		else if(usertype.equals("Distributor"))
		{
	%>
				<jsp:forward page="UserDistributorHome.jsp"></jsp:forward>
	<%
		}
		else if(usertype.equals("Customer"))
		{
	%>
				<jsp:forward page="UseCustomerHome.jsp"></jsp:forward>
	<%
		}
	}

	else {
		request.setAttribute("Error", "Sorry!Username or Password Error. plz Enter Correct Detail");
		session.setAttribute("Loginmsg", "plz sign in first");
		
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>

