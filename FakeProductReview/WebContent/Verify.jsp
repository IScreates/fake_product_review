<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title><jsp:include page="projectTitle.jsp"></jsp:include></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<link href="style.css" rel="stylesheet" />
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">
<link rel="shortcut icon" href="assets/ico/favicon.ico">
</head>
<body>
<%
	String otpm=session.getAttribute("otpm").toString();
	String email=session.getAttribute("email").toString();
	String id=session.getAttribute("id").toString();
	
	if(request.getParameter("incorrect")!=null){
		   out.println("<script>alert('Invalid Login Credential.....');</script>"); 
		}
%>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="topNav">
			<div class="container">
				<div class="alignR">
					<div class="pull-left socialNw">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div id="gototop"></div>
		<header id="header">
		<div class="row">
			<div class="span4">
				<h1>
					<a class="logo" href="index.jsp"><span><jsp:include
								page="projectTitle.jsp"></jsp:include></span> <img
						src="assets/img/logo-bootstrap-shoping-cart1.png"
						alt="bootstrap sexy shop"> </a>
				</h1>
			</div>
			<div class="span4 alignR"></div>
		</div>
		</header>

		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<a data-target=".nav-collapse" data-toggle="collapse"
						class="btn btn-navbar"> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
					</a>
					<div class="nav-collapse">
						<jsp:include page="Header/CustomerHeader.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="span12">
				<div class="well np">
					<div id="myCarousel" class="carousel slide homCar">
						
				</div>
				
				
				<div class="well well-small">
					<hr class="soften" />
					<div class="row-fluid" align="center">
						<div id="newProductCar" class="carousel slide">
							<div class="carousel-inner">
							
								<div class="item active" align="center">
									<h1>Welcome</h1>
									<hr/>
									<span class="subheading mb-2">Welcome to SMTP Verification Process</span>
								    <h2 class="mb-2" style="font-size: 32px;">Doctor Treatment Panel:</h2>
								            
								        <h4>Customer email address.: <%=session.getAttribute("email") %></h4>
							            <font size="4px">Verification have been sent to Customers registered email-id.<br>
										Kindly check Customers mail and enter the code in below text box.</font><br>
										<h2 align="left"><b><font color="blue">Enter Verification Code:</font></b></h2>
							            <form action="Verification" method="post">		
							            <table style="border: 3px solid red" align="left" border="10" width="350px" height="50px" cellpadding="10px">
										<tr>
											<td rowspan="2"><img src="images/otp.png" width="75" height="95"></td>
											<td><input type="password" name="otpe" id="search-text" size="15" /></td>
										</tr>
										<tr>
											<td align="center"><input type="submit" id="search-submit" value="Submit" style= /></td>
										</tr>
						            </table>
						            </form>								
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /container -->

		<div class="copyright">
			<div class="container">
				<p class="pull-right"></p>
				<span>Copyright &copy; Bootstrap Online Bakery Shop
					Management Shopping Template.
				</span>
			</div>
		</div>
		<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="assets/js/jquery.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.easing-1.3.min.js"></script>
		<script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
		<script src="assets/js/shop.js"></script>
</body>
</html>