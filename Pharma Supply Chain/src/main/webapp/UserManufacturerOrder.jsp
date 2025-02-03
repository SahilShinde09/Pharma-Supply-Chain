<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="org.json.JSONException"%>
<%@ page import="org.json.JSONObject"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Pharma &mdash; Colorlib Template</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Rubik:400,700|Crimson+Text:400,400i"
	rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">


<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/style.css">

</head>

<body>

	<div class="site-wrap">


		<div class="site-navbar py-2">

			<div class="search-wrap">
				<div class="container">
					<a href="#" class="search-close js-search-close"><span
						class="icon-close2"></span></a>
					<form action="#" method="post">
						<input type="text" class="form-control"
							placeholder="Search keyword and hit enter...">
					</form>
				</div>
			</div>

			<div class="container">
				<div class="d-flex align-items-center justify-content-between">
					<div class="logo">
						<div class="site-logo">
							<a href="UserManufacturerHome.jsp" class="js-logo-clone">Pharma</a>
						</div>
					</div>
					<div class="main-nav d-none d-lg-block">
						<nav class="site-navigation text-right text-md-center"
							role="navigation">
							<ul class="site-menu js-clone-nav d-none d-lg-block">
								<li ><a href="UserManufacturerHome.jsp">Home</a></li>
								<li><a data-toggle="modal" data-target="#addProductModal">AddProduct</a></li>
								<li class="active"><a href="UserManufacturerOrder.jsp">Order</a></li>
								<li><a data-toggle="modal"
									data-target="#trackOrder">Track</a></li>
									
								<li><a data-toggle="modal"
									data-target="#updateTrackOrder">UpdateTrackStatus</a></li>
							</ul>
						</nav>
						
						<!-- Update Track Status  -->
						
						<div class="modal fade" id="updateTrackOrder" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">

										<h5 class="modal-title" id="exampleModalLabel">Track Your Order</h5>

										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>


									<div class="modal-body">
										<form action="UserManufacturerTrackUpdate.jsp" method="post">

											<div class="form-group">
												<input type="text" name="wo_id" class="form-control"
													id="exampleInputEmail1" aria-describedby="emailHelp"
													placeholder="Enter Track ID"
													>
											</div>
											
											<div class="form-group">
												<input type="text" name="status" class="form-control"
													id="exampleInputEmail1" aria-describedby="emailHelp"
													placeholder="Enter Status"
													>
											</div>											

											<button type="submit" class="btn btn-primary">Track</button>

										</form>


									</div>


								</div>
							</div>

						</div>
						
						<!-- End Update Track Status -->
						
						<!-- Track Order -->
						
						<div class="modal fade" id="trackOrder" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">

										<h5 class="modal-title" id="exampleModalLabel">Track Your Order</h5>

										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>


									<div class="modal-body">
										<form action="UserManufacturerTrack.jsp" method="post">

											<div class="form-group">
												<input type="text" name="wo_id" class="form-control"
													id="exampleInputEmail1" aria-describedby="emailHelp"
													placeholder="Enter Track ID"
													>
											</div>										

											<button type="submit" class="btn btn-primary">Track</button>

										</form>


									</div>


								</div>
							</div>

						</div>
						
						<!-- End Track Order -->
						

						<!-- Users Model -->
						<div class="modal fade" id="addProductModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
																
									
									<div class="modal-body">
										<form action="addManufacturerProductProcess.jsp" method="post">

											<div class="form-group">
												<input type="text" name="mp_id" class="form-control"
													id="exampleInputEmail1" aria-describedby="emailHelp"
													placeholder="Enter Unique Product ID"
													>
											</div>

											<div class="form-group">
												<input type="text" name="mp_name"
													class="form-control" id="exampleInputPassword1"
													placeholder="Enter Product Name"
													>
											</div>

											<div class="form-group">
												<textarea id="info" name="mp_desc" rows="4" cols="50"
													class="form-control p-4"
													placeholder="Enter Complaint Information"
													required="required"></textarea>
											</div>
											
											<div class="form-group">
												<input type="text" name="mp_price"
													class="form-control" id="exampleInputPassword1"
													placeholder="Enter Product Price"
													>
											</div>
											
											<div class="form-group">
												<input type="file" name="image"
													class="form-control" id="exampleInputPassword1"
													>
											</div>
											
											<div class="form-group">
												<input type="text" name="m_id"
													class="form-control" id="exampleInputPassword1"
													placeholder="Manufacturer ID"
													value="<%=session.getAttribute("uname") %>"
													>
											</div>
											

											<button type="submit" class="btn btn-primary">Save</button>

										</form>

										<div class="modal-footer">
											<%
												if (request.getAttribute("notlogin_msg") != null) {
													out.print("<font size='2' color='red' m>");
													out.print(request.getAttribute("notlogin_msg"));
													out.print("</font>");
												}
											%>



											<%
												if (request.getAttribute("Error") != null) {
													out.print("<font size='2' color='red' m>");
													out.print(request.getAttribute("Error"));
													out.print("</font>");
												}
											%>
										</div>
									</div>


								</div>
							</div>

						</div>



					</div>
					<div class="icons">
						<a href="#" class="icons-btn d-inline-block js-search-open"><span
							class="icon-search"></span></a> <a href="#"
							class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span
							class="icon-menu"></span></a>
					</div>
					<a class="btn btn-primary" role="button" href="index.jsp"><b><%=session.getAttribute("uname")%>
					</b> &nbsp &nbsp Logout</a>
				</div>
			</div>
		</div>








		<div class="site-section bg-light">
			<div class="container">
				<div class="row">
					<div class="title-section text-center col-12">
						<h2 class="text-uppercase">Action(Accept/Reject) Orders</h2>
					</div>
				</div>
				
				<%
					Connection con = (Connection) application.getAttribute("mycon");
					PreparedStatement ps=null;
					ps = con.prepareStatement("select * from wholesaler_order where m_id=?",
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					ps.setString(1, (String)session.getAttribute("uname"));
					ResultSet rs = ps.executeQuery();
				%>
				
				<div class="row">
					<table class="table">
					<thead>
						<tr>
							<th scope="col">SR.NO</th>
							<th scope="col">Order ID</th>
							<th scope="col">CompanyName</th>
							<th scope="col">Address</th>
							<th scope="col">Email</th>
							<th scope="col">Item</th>
							<th scope="col">WID</th>
							<th scope="col">ACTIONS</th>
						</tr>
					</thead>
					<tbody>
						<% 
						int i=1;
						while(rs.next()){ System.out.println("OKK");%>
							<tr>
								<th scope="row"><%=i %></th>
								<td ><%=rs.getString(1) %></td>
								<td ><%=rs.getString(5) %></td>
								<td ><%=rs.getString(6) %></td>
								<td ><%=rs.getString(9) %></td>
								<td>
								<%
									String s=rs.getString(12);
									
								JSONObject data = new JSONObject(s);
						        Iterator<String> it= data.keys();
						        System.out.println();
						        int qty;
						        String name;
						        int price;
						        
						        while (it.hasNext())
						        {
//									System.out.println(it.next());
									JSONArray values = data.getJSONArray(it.next());
									 qty = values.getInt(0);
									 System.out.println(qty);
							            name = values.getString(1);
							            System.out.println(name);
							            price = values.getInt(2);
							            System.out.println(price);
							        %>
							        
							        QTY : <%=qty %>
							        Name : <%=name %>
							        <br>
							        <%
								}
								
								%>
								</td>
								
								<td ><%=rs.getString(14) %></td>
								<td> 
								<% if(rs.getString(15).equals("0")){ %>
								Order Pending<br>
								<a type="button" href="userManufacturerAccept_WOrder.jsp?wo_id=<%=rs.getString(1)%>" class="btn btn-primary btn-sm">Accept</a>
								<% }  else
								 {%>
								<span class="text-success">Order Accepted</span> <br>
								
								<% } %> 
								</td>
							</tr>
						
						<% i++;
						} %>
					</tbody>
					</table>
				</div>
				
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="title-section text-center col-12">
						<h2 class="text-uppercase">Testimonials</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 block-3 products-wrap">
						<div class="nonloop-block-3 no-direction owl-carousel">

							<div class="testimony">
								<blockquote>
									<img src="images/person_1.jpg" alt="Image"
										class="img-fluid w-25 mb-4 rounded-circle">
									<p>&ldquo;Lorem ipsum dolor, sit amet consectetur
										adipisicing elit. Nemo omnis voluptatem consectetur quam
										tempore obcaecati maiores voluptate aspernatur iusto eveniet,
										placeat ab quod tenetur ducimus. Minus ratione sit quaerat
										unde.&rdquo;</p>
								</blockquote>

								<p>&mdash; Kelly Holmes</p>
							</div>

							<div class="testimony">
								<blockquote>
									<img src="images/person_2.jpg" alt="Image"
										class="img-fluid w-25 mb-4 rounded-circle">
									<p>&ldquo;Lorem ipsum dolor, sit amet consectetur
										adipisicing elit. Nemo omnis voluptatem consectetur quam
										tempore obcaecati maiores voluptate aspernatur iusto eveniet,
										placeat ab quod tenetur ducimus. Minus ratione sit quaerat
										unde.&rdquo;</p>
								</blockquote>

								<p>&mdash; Rebecca Morando</p>
							</div>

							<div class="testimony">
								<blockquote>
									<img src="images/person_3.jpg" alt="Image"
										class="img-fluid w-25 mb-4 rounded-circle">
									<p>&ldquo;Lorem ipsum dolor, sit amet consectetur
										adipisicing elit. Nemo omnis voluptatem consectetur quam
										tempore obcaecati maiores voluptate aspernatur iusto eveniet,
										placeat ab quod tenetur ducimus. Minus ratione sit quaerat
										unde.&rdquo;</p>
								</blockquote>

								<p>&mdash; Lucas Gallone</p>
							</div>

							<div class="testimony">
								<blockquote>
									<img src="images/person_4.jpg" alt="Image"
										class="img-fluid w-25 mb-4 rounded-circle">
									<p>&ldquo;Lorem ipsum dolor, sit amet consectetur
										adipisicing elit. Nemo omnis voluptatem consectetur quam
										tempore obcaecati maiores voluptate aspernatur iusto eveniet,
										placeat ab quod tenetur ducimus. Minus ratione sit quaerat
										unde.&rdquo;</p>
								</blockquote>

								<p>&mdash; Andrew Neel</p>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section bg-secondary bg-image"
			style="background-image: url('images/bg_2.jpg');">
			<div class="container">
				<div class="row align-items-stretch">
					<div class="col-lg-6 mb-5 mb-lg-0">
						<a href="#" class="banner-1 h-100 d-flex"
							style="background-image: url('images/bg_1.jpg');">
							<div class="banner-1-inner align-self-center">
								<h2>Pharma Products</h2>
								<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit.
									Molestiae ex ad minus rem odio voluptatem.</p>
							</div>
						</a>
					</div>
					<div class="col-lg-6 mb-5 mb-lg-0">
						<a href="#" class="banner-1 h-100 d-flex"
							style="background-image: url('images/bg_2.jpg');">
							<div class="banner-1-inner ml-auto  align-self-center">
								<h2>Rated by Experts</h2>
								<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit.
									Molestiae ex ad minus rem odio voluptatem.</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>


		<footer class="site-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-3 mb-4 mb-lg-0">

						<div class="block-7">
							<h3 class="footer-heading mb-4">About Us</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Eius quae reiciendis distinctio voluptates sed dolorum excepturi
								iure eaque, aut unde.</p>
						</div>

					</div>
					<div class="col-lg-3 mx-auto mb-5 mb-lg-0">
						<h3 class="footer-heading mb-4">Quick Links</h3>
						<ul class="list-unstyled">
							<li><a href="#">Supplements</a></li>
							<li><a href="#">Vitamins</a></li>
							<li><a href="#">Diet &amp; Nutrition</a></li>
							<li><a href="#">Tea &amp; Coffee</a></li>
						</ul>
					</div>

					<div class="col-md-6 col-lg-3">
						<div class="block-5 mb-5">
							<h3 class="footer-heading mb-4">Contact Info</h3>
							<ul class="list-unstyled">
								<li class="address">203 Fake St. Mountain View, San
									Francisco, California, USA</li>
								<li class="phone"><a href="tel://23923929210">+2 392
										3929 210</a></li>
								<li class="email">emailaddress@domain.com</li>
							</ul>
						</div>


					</div>
				</div>
				<div class="row pt-5 mt-5 text-center">
					<div class="col-md-12">
						<p>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="icon-heart" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank" class="text-primary">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>

				</div>
			</div>
		</footer>
	</div>

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>

	<script src="js/main.js"></script>

</body>

</html>