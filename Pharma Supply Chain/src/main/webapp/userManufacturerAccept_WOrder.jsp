<%@page import="bean.Product"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.InputStream"%> 
<%@page import="java.io.FileInputStream"%> 
<%@page import="java.io.File"%> 
<%@ page import="org.json.JSONArray"%>
<%@ page import="org.json.JSONException"%>
<%@ page import="org.json.JSONObject"%>

<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%> 
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%
	String id = request.getParameter("wo_id");
	
	
	Connection con = (Connection) application.getAttribute("mycon");
	PreparedStatement ps=null , ps1 , ps2;
	ps= con.prepareStatement("update wholesaler_order set status=? where wo_id=?",
			ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	
	ps.setString(1, "1");
	ps.setString(2, id);
	
	ps1= con.prepareStatement("insert into wholesaler_order_track(wo_id,status) values(?,?)",
			ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	
	ps1.setString(1, id);
	ps1.setString(2, "Your Order is Ready To Dispatch!!!");
	
	int i=0;
	try
	{
		i = ps.executeUpdate();
		i = ps1.executeUpdate();
	}
	catch(Exception e)
	{
		System.out.println("H2 : "+e);
	}
	if (i>0) 
	{
		
		try
		{
			List<Product> products=new ArrayList<>();
			ResultSet rs=null;
			
			ps= con.prepareStatement("select * from mproduct",
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs=ps.executeQuery();
			while(rs.next())
			{
				Product product=new Product();
				product.setName(rs.getString(2));
				product.setDesc(rs.getString(3));
				product.setPrice(rs.getString(4));
				product.setImage(rs.getBlob(5)); 
				products.add(product);
			}
			
			System.out.println("OK2 : "+ products);
			
			ps= con.prepareStatement("select * from wholesaler_order where status=? and wo_id=?",
				ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			ps.setString(1, "1");
			ps.setString(2, id);
			
			rs=ps.executeQuery();
			while(rs.next())
			{
				
				String s = rs.getString(12);
				String w_id = rs.getString(14);
				
				System.out.println("Product : "+ s);
				
				JSONObject data = new JSONObject(s);
		        Iterator<String> it= data.keys();
		        System.out.println();
		        //int qty;
		        String name;
		        //int price;
		        while (it.hasNext())
		        {
//					System.out.println(it.next());
					JSONArray values = data.getJSONArray(it.next());
					 //qty = values.getInt(0);
					 //System.out.println(qty); 
					 
			            name = values.getString(1);
			            System.out.println(name);
			            //price = values.getInt(2);
			            //System.out.println(price);
			           
			           
			        	   ps2= con.prepareStatement("select * from wproduct where wp_name=? and w_id=?",
			   					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			        	   ps2.setString(1,name);
			        	   ps2.setString(2, w_id);
			        	   
			   				ResultSet rs11=ps2.executeQuery();
			        	   if(!rs11.next())
			        	   {
			        		   System.out.println("OK3 : "+name);
				        	   ps1= con.prepareStatement("insert into wproduct(wp_name,wp_desc,mp_price,image,w_id) values(?,?,?,?,?)",
				        				ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				        	   
				        	   for(Product product:products)
				        	   {
				        		   if(product.getName().equals(name))
				        		   {
				        				ps1.setString(1, product.getName());
				        				ps1.setString(2, product.getDesc());
				        				ps1.setString(3, product.getPrice());
				        				ps1.setBlob(4, product.getImage());
				        				ps1.setString(5, w_id);
				        				ps1.executeUpdate();
				        				System.out.println("Success");
				        				break;
				        		   }
				        		   
				        	   }
			        	   }
			           }
				
				
			}
			
		}
		catch(Exception e)
		{
			System.out.println("H3 : "+e);
		}	
		
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

