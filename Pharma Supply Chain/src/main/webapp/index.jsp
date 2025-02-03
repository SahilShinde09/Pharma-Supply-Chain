<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
							<a href="index.jsp" class="js-logo-clone">Pharma</a>
						</div>
					</div>
					<div class="main-nav d-none d-lg-block">
						<nav class="site-navigation text-right text-md-center"
							role="navigation">
							<ul class="site-menu js-clone-nav d-none d-lg-block">
								<li class="active"><a href="index.jsp">Home</a></li>
								<li><a href="shop.html">Store</a></li>
								<li class="has-children"><a href="#">Login</a>
									<ul class="dropdown">
										<li><a data-toggle="modal" data-target="#exampleModal">Admin</a></li>
										<li><a data-toggle="modal" data-target="#usersModal">Users</a></li>


									</ul></li>
								<li><a href="about.html">About</a></li>
								<li><a href="contact.html">Contact</a></li>
								<li><a data-toggle="modal"
									data-target="#userCustomerSUModal">Cust_Sign_Up</a></li>

								<li><a data-toggle="modal"
									data-target="#userCustomerSIModal">Cust_Sign_In</a></li>
							</ul>
						</nav>
						
						<!-- Start Cust Sign In -->
						<div class="modal fade" id="userCustomerSIModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Customer
											SignIn</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form action="userLoginProcess.jsp" method="post">
											
											<input type="hidden" value="Customer" name="usertype">
											
											<div class="form-group">
												<label for="exampleInputEmail11">Enter Email ID</label> <input
													type="email" name="id" class="form-control"
													id="exampleInputEmail11" aria-describedby="emailHelp">
											</div>

											<div class="form-group">
												<label for="exampleInputPassword1">Password</label> <input
													type="password" name="userpass" class="form-control"
													id="exampleInputPassword1">
											</div>

											<button type="submit" class="btn btn-primary">SignIn</button>

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
						<!-- End  Cust Sign In-->

						<!-- Start Customer SignUp Model -->
						<div class="modal fade" id="userCustomerSUModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">User
											SignIn</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form action="UserSignUpProcess.jsp" method="post">
											<div class="form-group">
												<label for="c_country" class="text-black">Country <span
													class="text-danger">*</span></label> <select id="c_country"
													class="form-control" name="c_country">
													<option value="1">Select a country</option>
													<option value="India">India</option>
													<option value="Algeria">Algeria</option>
													<option value="Ghana">Ghana</option>
													<option value="Albania">Albania</option>
													<option value="Bahrain">Bahrain</option>
													<option value="Colombia">Colombia</option>
													<option value="Dominican Republic">Dominican
														Republic</option>
												</select>
											</div>

											<div class="form-group row">
												<div class="col-md-6">
													<label for="c_fname" class="text-black">First Name
														<span class="text-danger">*</span>
													</label> <input type="text" class="form-control" id="c_fname"
														name="c_fname">
												</div>
												<div class="col-md-6">
													<label for="c_lname" class="text-black">Last Name <span
														class="text-danger">*</span>
													</label> <input type="text" class="form-control" id="c_lname"
														name="c_lname">
												</div>
											</div>

											

											<div class="form-group row">
												<div class="col-md-12">
													<label for="c_address" class="text-black">Address <span
														class="text-danger">*</span>
													</label> <input type="text" class="form-control" id="c_address"
														name="c_address" placeholder="Street address">
												</div>
											</div>

											<div class="form-group">
												<input type="text" class="form-control"
													placeholder="Apartment, suite, unit etc. (optional)">
											</div>

											<div class="form-group row">
												<div class="col-md-6">
													<label for="c_state_country" class="text-black">State
														/ Country <span class="text-danger">*</span>
													</label> <input type="text" class="form-control"
														id="c_state_country" name="c_state_country">
												</div>
												<div class="col-md-6">
													<label for="c_postal_zip" class="text-black">Posta
														/ Zip <span class="text-danger">*</span>
													</label> <input type="text" class="form-control" id="c_postal_zip"
														name="c_postal_zip">
												</div>
											</div>

											<div class="form-group row mb-5">
												<div class="col-md-6">
													<label for="c_email_address" class="text-black">Email
														Address <span class="text-danger">*</span>
													</label> <input type="text" class="form-control"
														id="c_email_address" name="c_email_address">
												</div>
												<div class="col-md-6">
													<label for="c_phone" class="text-black">Phone <span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" id="c_phone" name="c_phone"
														placeholder="Phone Number">
												</div>
											</div>

											<div class="form-group row">
												<div class="col-md-12">
													<label for="c_companyname" class="text-black">Password
													</label> <input type="password" class="form-control" id="c_password"
														name="c_password">
												</div>
											</div>

											<div class="form-group">
												<button class="btn btn-primary btn-lg btn-block"
													type="submit">Sign Up</button>
											</div>

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

						<!-- Customer SignUp Model  END-->

						<!-- Admin Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Admin
											SignIn</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form action="adminLoginProcess.jsp" method="post">
											<div class="form-group">
												<label for="exampleInputEmail1">Email address</label> <input
													type="email" name="userEmail" class="form-control"
													id="exampleInputEmail1" aria-describedby="emailHelp">
												<small id="emailHelp" class="form-text text-muted">We'll
													never share your email with anyone else.</small>
											</div>
											<div class="form-group">
												<label for="exampleInputPassword1">Password</label> <input
													type="password" name="userpass" class="form-control"
													id="exampleInputPassword1">
											</div>

											<button type="submit" class="btn btn-primary">SignIn</button>
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


						<!-- Users Model -->
						<div class="modal fade" id="usersModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">User
											SignIn</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form action="userLoginProcess.jsp" method="post">

											<div class="form-group">
												<label for="inputState">Select User</label> <select
													id="user" name="usertype" class="form-control">
													<option selected>Choose...</option>
													<option>Manufacturer</option>
													<option>Distributor</option>
													<option>Wholesaler</option>


												</select>
											</div>

											<div class="form-group">
												<label for="exampleInputEmail1">Enter Unique ID</label> <input
													type="text" name="id" class="form-control"
													id="exampleInputEmail1" aria-describedby="emailHelp">
											</div>

											<div class="form-group">
												<label for="exampleInputPassword1">Password</label> <input
													type="password" name="userpass" class="form-control"
													id="exampleInputPassword1">
											</div>

											<button type="submit" class="btn btn-primary">SignIn</button>

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
							class="icon-search"></span></a> </a> <a href="#"
							class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span
							class="icon-menu"></span></a>
					</div>
				</div>
			</div>
		</div>

		<div class="site-blocks-cover"
			style="background-image: url('images/hero_1.jpg');">
			<div class="container">
				<div class="row">
					<div class="col-lg-7 mx-auto order-lg-2 align-self-center">
						<div class="site-block-cover-content text-center">
							<h2 class="sub-title">Effective Medicine, New Medicine
								Everyday</h2>
							<h1>Welcome To Pharma</h1>
							<p>
								<a href="#" class="btn btn-primary px-5 py-3">Shop Now</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row align-items-stretch section-overlap">
					<div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
						<div class="banner-wrap bg-primary h-100">
							<a href="#" class="h-100">
								<h5>
									Free <br> Shipping
								</h5>
								<p>
									Amet sit amet dolor <strong>Lorem, ipsum dolor sit
										amet consectetur adipisicing.</strong>
								</p>
							</a>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
						<div class="banner-wrap h-100">
							<a href="#" class="h-100">
								<h5>
									Season <br> Sale 50% Off
								</h5>
								<p>
									Amet sit amet dolor <strong>Lorem, ipsum dolor sit
										amet consectetur adipisicing.</strong>
								</p>
							</a>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
						<div class="banner-wrap bg-warning h-100">
							<a href="#" class="h-100">
								<h5>
									Buy <br> A Gift Card
								</h5>
								<p>
									Amet sit amet dolor <strong>Lorem, ipsum dolor sit
										amet consectetur adipisicing.</strong>
								</p>
							</a>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="title-section text-center col-12">
						<h2 class="text-uppercase">Popular Products</h2>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-6 col-lg-4 text-center item mb-4">
						<span class="tag">Sale</span> <a href="shop-single.html"> <img
							src="images/product_01.png" alt="Image"></a>
						<h3 class="text-dark">
							<a href="shop-single.html">Bioderma</a>
						</h3>
						<p class="price">
							<del>95.00</del>
							&mdash; $55.00
						</p>
					</div>
					<div class="col-sm-6 col-lg-4 text-center item mb-4">
						<a href="shop-single.html"> <img src="images/product_02.png"
							alt="Image"></a>
						<h3 class="text-dark">
							<a href="shop-single.html">Chanca Piedra</a>
						</h3>
						<p class="price">$70.00</p>
					</div>
					<div class="col-sm-6 col-lg-4 text-center item mb-4">
						<a href="shop-single.html"> <img src="images/product_03.png"
							alt="Image"></a>
						<h3 class="text-dark">
							<a href="shop-single.html">Umcka Cold Care</a>
						</h3>
						<p class="price">$120.00</p>
					</div>

					<div class="col-sm-6 col-lg-4 text-center item mb-4">

						<a href="shop-single.html"> <img src="images/product_04.png"
							alt="Image"></a>
						<h3 class="text-dark">
							<a href="shop-single.html">Cetyl Pure</a>
						</h3>
						<p class="price">
							<del>45.00</del>
							&mdash; $20.00
						</p>
					</div>
					<div class="col-sm-6 col-lg-4 text-center item mb-4">
						<a href="shop-single.html"> <img src="images/product_05.png"
							alt="Image"></a>
						<h3 class="text-dark">
							<a href="shop-single.html">CLA Core</a>
						</h3>
						<p class="price">$38.00</p>
					</div>
					<div class="col-sm-6 col-lg-4 text-center item mb-4">
						<span class="tag">Sale</span> <a href="shop-single.html"> <img
							src="images/product_06.png" alt="Image"></a>
						<h3 class="text-dark">
							<a href="shop-single.html">Poo Pourri</a>
						</h3>
						<p class="price">
							<del>$89</del>
							&mdash; $38.00
						</p>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col-12 text-center">
						<a href="shop.html" class="btn btn-primary px-4 py-3">View All
							Products</a>
					</div>
				</div>
			</div>
		</div>


		<div class="site-section bg-light">
			<div class="container">
				<div class="row">
					<div class="title-section text-center col-12">
						<h2 class="text-uppercase">New Products</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 block-3 products-wrap">
						<div class="nonloop-block-3 owl-carousel">

							<div class="text-center item mb-4">
								<a href="shop-single.html"> <img src="images/product_03.png"
									alt="Image"></a>
								<h3 class="text-dark">
									<a href="shop-single.html">Umcka Cold Care</a>
								</h3>
								<p class="price">$120.00</p>
							</div>

							<div class="text-center item mb-4">
								<a href="shop-single.html"> <img src="images/product_01.png"
									alt="Image"></a>
								<h3 class="text-dark">
									<a href="shop-single.html">Umcka Cold Care</a>
								</h3>
								<p class="price">$120.00</p>
							</div>

							<div class="text-center item mb-4">
								<a href="shop-single.html"> <img src="images/product_02.png"
									alt="Image"></a>
								<h3 class="text-dark">
									<a href="shop-single.html">Umcka Cold Care</a>
								</h3>
								<p class="price">$120.00</p>
							</div>

							<div class="text-center item mb-4">
								<a href="shop-single.html"> <img src="images/product_04.png"
									alt="Image"></a>
								<h3 class="text-dark">
									<a href="shop-single.html">Umcka Cold Care</a>
								</h3>
								<p class="price">$120.00</p>
							</div>

						</div>
					</div>
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