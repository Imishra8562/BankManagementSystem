<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index page</title>
<%@ include file="component/allcss.jsp"%>
</head>
<body>
	<%@ include file="component/navbar.jsp"%>

	<div id="carouselExampleCaptions" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/Screenshot 2024-02-27 193436.png"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="img/banner11.jpg" class="d-block w-100" alt="...">
			</div>
		</div>
		<div class="carousel-item">
			<img src="img/banner12.jpg" class="d-block w-100" alt="...">
		</div>
	</div>
	<div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="alert alert-success" role="information">
		<h4 class="alert-heading">Internet Banking - Getting Started</h4>
		<p>Start banking online using Bank.Bank provides easy steps to
			start online banking. Assistance is available 24/7 for customers.
			Avail a variety of benefits and services by bank through the online
			banking service. Hassle-free Internet banking options makes banking
			with Bank the best.
		<hr>
		<h2>For Retail and NRI customers</h2>

		To access Internet Banking, you will have to first register for it.
		Click here to go to the login page and click on the “Register here”
		link to begin the registration. Keep your customer ID, KYC details and
		debit card handy. Also ensure that your registered mobile number and
		your registered email address are active. Enter either your customer
		ID or registered mobile number. The customer ID is mentioned in the
		welcome letter and also printed on your cheque book. You can also
		obtain your Customer ID by sending an SMS CUSTID to 56161600 If you
		have a savings or current account with Axis Bank, you will next be
		displayed one or more out of the following options: Debit Card, OTP,
		Email link and KYC Choose one of the options and fill up the details
		to set your password and to complete your registration You can now
		login using one of the following options: Customer ID/login ID &
		Password Debit card number, ATM PIN, OTP Customer ID & mPIN Registered
		mobile number, mPIN & OTP For the first option in above step, you can
		login using an alphanumeric Login ID instead of the customer ID. You
		can create this Login ID only once by logging in to Internet Banking,
		going to My Profile ,and clicking on “Personalise your Login ID” When
		you login to Internet Banking for the first time after registration,
		you will have to set three security questions and their answers. If
		you have forgotten your password and want to reset it, you can click
		on “Reset Here” link in the login page to commence If you login
		incorrectly multiple times, your Internet banking access gets locked.
		To enable it, click on the “Enable Login ID” link in the login page to
		commence Netsecure with SMSF
		</p>
	</div>
	<div class="card bg-primary text-dark">
		<img src="img/banner1.jpg" class="card-img" alt="...">
		<div class="card-img-overlay">
			<h5 class="card-title">EASY,INSTANT,SECURE</h5>
			<p class="card-text">
			<h5>
				Today, you can efficiently conduct online<br> transactions by
				choosing your <br>preferred digital payment solutions.
			</h5>
			</p>
			<p class="card-text">Last updated 3 mins ago</p>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>