<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
							<a href="UserWholesalerHome.jsp" class="js-logo-clone">Pharma</a>
						</div>
					</div>
					<div class="main-nav d-none d-lg-block">
						<nav class="site-navigation text-right text-md-center"
							role="navigation">
							<ul class="site-menu js-clone-nav d-none d-lg-block">
								<li><a href="UserWholesalerHome.jsp">Continue Shopping</a></li>

							</ul>
						</nav>
					</div>
					<div class="icons">
						<a href="#" class="icons-btn d-inline-block js-search-open"><span
							class="icon-search"></span></a> <a href="cart.html"
							class="icons-btn d-inline-block bag"> <span
							class="icon-shopping-bag"></span> <span class="number" id="cart"></span>
						</a> <a href="#"
							class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span
							class="icon-menu"></span></a> 
					</div>
				</div>
			</div>
		</div>

		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="UserWholesalerHome.jsp">Home</a> <span class="mx-2 mb-0">/</span>
						<strong class="text-black">Checkout</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">

				<div class="row">
					<div class="col-md-12 mb-5 mb-md-0">
						<h2 class="h3 mb-3 text-black">Billing Details</h2>
						<div class="p-3 p-lg-5 border">
							
							<form action="WholesalerOrderPlaceProcess.jsp" method="post">
						
							<input type="hidden" name="itemsJson" id="itemsJson">
							<input type="hidden" name="m_id" id="m_id" value="<%=session.getAttribute("m_id") %>"/>
							
							
							<div class="form-group">
								<label for="c_country" class="text-black">Country <span
									class="text-danger">*</span></label> 
									<select id="c_country" class="form-control" name="wo_country"> 
									<option value="1">Select a country</option>
									<option value="India">India</option>
									<option value="Algeria">Algeria</option>
									<option value="Ghana">Ghana</option>
									<option value="Albania">Albania</option>
									<option value="Bahrain">Bahrain</option>
									<option value="Colombia">Colombia</option>
									<option value="Dominican Republic">Dominican Republic</option>
								</select>
							</div>
							
							<div class="form-group row">
								<div class="col-md-6">
									<label for="c_fname" class="text-black">First Name <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" id="c_fname" name="wo_fname">
								</div>
								<div class="col-md-6">
									<label for="c_lname" class="text-black">Last Name <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" id="c_lname" name="wo_lname">
								</div>
							</div>

							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_companyname" class="text-black">Company
										Name </label> <input type="text" class="form-control"
										id="c_companyname" name="wo_companyname">
								</div>
							</div>

							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_address" class="text-black">Address <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" id="c_address" name="wo_address"
										placeholder="Street address">
								</div>
							</div>

							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="Apartment, suite, unit etc. (optional)">
							</div>

							<div class="form-group row">
								<div class="col-md-6">
									<label for="c_state_country" class="text-black">State /
										Country <span class="text-danger">*</span>
									</label> <input type="text" class="form-control" id="c_state_country"
										name="wo_state_country">
								</div>
								<div class="col-md-6">
									<label for="c_postal_zip" class="text-black">Posta /
										Zip <span class="text-danger">*</span>
									</label> <input type="text" class="form-control" id="c_postal_zip"
										name="wo_postal_zip">
								</div>
							</div>

							<div class="form-group row mb-5">
								<div class="col-md-6">
									<label for="c_email_address" class="text-black">Email
										Address <span class="text-danger">*</span>
									</label> <input type="text" class="form-control" id="c_email_address"
										name="wo_email_address">
								</div>
								<div class="col-md-6">
									<label for="c_phone" class="text-black">Phone <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" id="c_phone" name="wo_phone"
										placeholder="Phone Number">
								</div>
							</div>






							<div class="form-group">
								<label for="c_order_notes" class="text-black">Order
									Notes</label>
								<textarea name="wo_order_notes" id="c_order_notes" cols="30"
									rows="5" class="form-control" name="wo_order_notes"
									placeholder="Write your notes here..."></textarea>
							</div>
							
							<div class="form-group">
										<button class="btn btn-primary btn-lg btn-block"
											type="submit">Place
											Order</button>
									</div>
									
									</form>	
							

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
							<script>document.write(new Date().getFullYear());</script>
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
if (localStorage.getItem('cart') == null) {
    var cart = {};
} else {
    cart = JSON.parse(localStorage.getItem('cart'));
}
console.log(cart);
var sum = 0;
var total=0;
if ($.isEmptyObject(cart)) {
    //if object is empty -> trickEscape below n Tab Up between char `
    mystr = `<p>Your cart is empty, please add some items to your cart before checking out!</p>`
    $('#items').append(mystr);
} else {
    for (item in cart) {
    	let qty = cart[item][0];
        let name = cart[item][1];
        let price = cart[item][2];
        total = total + (qty*price);
        sum = sum + qty;
        mystr = `<tr>
		<td>${name} <strong class="mx-2">x</strong> ${qty}
		</td>
		<td>Rs. ${qty*price}</td>
	</tr>`
        $('#items').append(mystr);
		

    }
   	$('#items').append(`<tr>
	<td class="text-black font-weight-bold"><strong>Order
	Total</strong></td>
<td class="text-black font-weight-bold"><strong>Rs.${total}</strong></td>
</tr>`);
    console.log(total);
    $('#itemsJson').val(JSON.stringify(cart));
    document.getElementById('cart').innerHTML = sum;
}

/* $('#itemsJson').val(JSON.stringify(cart)); */
 //document.getElementById('itemsJson').innerHTML = JSON.stringify(cart);
 
</script>

</body>

</html>