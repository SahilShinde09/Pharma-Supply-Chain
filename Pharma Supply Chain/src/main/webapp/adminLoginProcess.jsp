<%@page import="java.sql.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%
	String userEmail = request.getParameter("userEmail");
	String password = request.getParameter("userpass");
	Connection con = (Connection) application.getAttribute("mycon");
	PreparedStatement ps = con.prepareStatement("select * from admin where email=? and password=?",
			ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ps.setString(1, userEmail);
	ps.setString(2, password);

	ResultSet rs = ps.executeQuery();

	if (rs.next()) 
	{
		session.setAttribute("islogin", "plz sign in first");
		session.setAttribute("uname", userEmail);
		
%>
<script>
showAlert();
</script>
<jsp:forward page="adminHome.jsp"></jsp:forward>
<%
	}

	else {
		request.setAttribute("Error", "Sorry!Username or Password Error. plz Enter Correct Detail");
		session.setAttribute("Loginmsg", "plz sign in first");
		
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>

<script>
function showAlert() {
	  alert('Login Success!!!');
	}
</script>

