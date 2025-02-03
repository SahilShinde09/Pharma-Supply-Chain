<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

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
<link rel="stylesheet" href="css/mycss.css">

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
							<a href="UseCustomerHome.jsp" class="js-logo-clone">Pharma</a>
						</div>
					</div>
					<div class="main-nav d-none d-lg-block">
						<nav class="site-navigation text-right text-md-center"
							role="navigation">
							<ul class="site-menu js-clone-nav d-none d-lg-block">
								<li class="active"><a href="UseCustomerHome.jsp">Home</a></li>
								
								
								<li class="has-children"><a href="#">Your Order</a>
									<ul class="dropdown">
										<!-- <li ><a href="UserCustomerOrder.jsp">Display Order</a></li> --> 
										<li><a data-toggle="modal"
									data-target="#trackOrderCustomer">Track</a></li>
									</ul>
								</li>
								</ul>
						</nav>
						
						
						<!-- Distributor Track Order -->
						
						<div class="modal fade" id="trackOrderCustomer" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">

										<h5 class="modal-title" id="exampleModalLabel">Track Our Order</h5>

										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>


									<div class="modal-body">
										<form action="UserCustomerTrack.jsp" method="post">

											<div class="form-group">
												<input type="text" name="co_id" class="form-control"
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
						


					</div>

					<div class="icons">
						
						<a href="#" class="icons-btn d-inline-block js-search-open"><span
							class="icon-search"></span></a> 
							
							<a href="ccart.html" id="carta"
							class="icons-btn d-inline-block bag"> <span
							class="icon-shopping-bag"></span> 
							
							<span id="cart" class="number"></span>
							
							</a> 
						
						<a href="#"
							class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span
							class="icon-menu"></span></a>

						<button class='btn btn-sm btn-primary mx-3' onclick='clearCart()'
							id='clearCart'>Clear Cart</button>
					</div>

					<a class="btn btn-primary" role="button" href="index.jsp"><b><%=session.getAttribute("uname")%>
					</b> &nbsp &nbsp Logout</a>
				</div>
			</div>
		</div>









		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="title-section text-center col-12">
						<h2 class="text-uppercase">All Manufacturer Products</h2>
					</div>
				</div>
				<%!Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;%>

				<%
					con = (Connection) application.getAttribute("mycon");
					ps = con.prepareStatement("select * from dproduct", ResultSet.TYPE_SCROLL_SENSITIVE,
							ResultSet.CONCUR_UPDATABLE);
					
					rs = ps.executeQuery();
				%>

				<div class="row">
					<%
						while (rs.next()) {
							
							Blob image = null;
							byte[] imgData = null;
							image = rs.getBlob(6);
							imgData = image.getBytes(1, (int) image.length());
							String encode = Base64.getEncoder().encodeToString(imgData);
							request.setAttribute("imgBase", encode);
					%>
					<div class="col-sm-6 col-lg-4 text-center item mb-4">
						<span class="tag">Sale</span> <a href="shop-single.html"> <img
							src="data:image/jpeg;base64,${imgBase}" alt="Image"></a>
						<h3 class="text-dark">
							<a href="shop-single.html"> <span
								id="name<%=rs.getString(1)%>" class="divpr"><%=rs.getString(2)%></span></a>
						</h3>
						<p class="price">
							Rs. <span id="price<%=rs.getString(1)%>" class="divpr"><%=rs.getString(5)%></span>
						</p>

						 <span id="divpr<%=rs.getString(1)%>" class="divpr">
							<button id="pr<%=rs.getString(1)%>" class="btn btn-primary cart">Add
								To Cart</button>
						</span> 

					</div>
					<%
						}
					%>
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

	<script>
		// Find out the cart items from localStorage
		
		if (localStorage.getItem('cart') == null) {
			var cart = {};
			const element = document.getElementById("carta");
			element.classList.add("mydisabled");
		} else {
			
			const element = document.getElementById("carta");
			element.classList.remove("mydisabled");
			
			cart = JSON.parse(localStorage.getItem('cart'));
			document.getElementById('cart').innerHTML = Object.keys(cart).length;
			updateCart(cart);
		}

		// If the add to cart button is clicked, add/increment the item
		$('.cart').click(function() {
			var idstr = this.id.toString();
			//console.log("ID"+idstr);
			if (cart[idstr] != undefined) {
				cart[idstr][0] = cart[idstr][0] + 1;
			} else {
				//console.log('ID1 : name'+idstr);
				qty = 1;
				a = idstr.slice(2);
				//console.log('ID2 : name'+a);
				name = document.getElementById('name' + a).innerHTML;
				price = document.getElementById('price' + a).innerHTML;
				cart[idstr] = [ qty, name, price ];

			}
			updateCart(cart);

		});

		function updateCart(cart) {
			var sum = 0;
			for ( var item in cart) {
				sum = sum + cart[item][0];
				document.getElementById('div' + item).innerHTML = "<button id='minus" + item + "' class='btn btn-primary minus'>-</button> <span id='val" + item + "''>"
						+ cart[item][0]
						+ "</span> <button id='plus" + item + "' class='btn btn-primary plus'> + </button>";
			}
			
			if(sum==0)
			{
				const element = document.getElementById("carta");
				element.classList.add("mydisabled");
			}
			else
			{
				const element = document.getElementById("carta");
				element.classList.remove("mydisabled");
			}
			
			localStorage.setItem('cart', JSON.stringify(cart));
			document.getElementById('cart').innerHTML = sum; //Object.keys(cart).length;
			console.log(cart);
		}

		// If plus or minus button is clicked, change the cart as well as the display value
		$('.divpr').on("click", "button.minus", function() {
			a = this.id.slice(7);
			cart['pr' + a][0] = cart['pr' + a][0] - 1;
			cart['pr' + a][0] = Math.max(0, cart['pr' + a][0]);
			document.getElementById('valpr' + a).innerHTML = cart['pr' + a][0];
			updateCart(cart);
		});
		$('.divpr').on("click", "button.plus", function() {
			a = this.id.slice(6);
			cart['pr' + a][0] = cart['pr' + a][0] + 1;
			document.getElementById('valpr' + a).innerHTML = cart['pr' + a][0];
			updateCart(cart);
		});

		function clearCart() {
			cart = JSON.parse(localStorage.getItem('cart'));
			for ( var item in cart) {
				document.getElementById('div' + item).innerHTML = '<button id="' + item + '" class="btn btn-primary cart">Add To Cart</button>'
			}
			localStorage.clear();
			cart = {};
			updateCart(cart);
			location.reload();

		}
	</script>

</body>

</html>