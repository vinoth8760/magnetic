<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>sign-up</title>

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">

</head>

<body>
	<header>
		<div class="logo">
			<a href="index.html"><img src="img/logo.png" title="Magnetic" alt="Magnetic"/></a>
		</div><!-- end logo -->

		<div id="menu_icon"></div>
		<nav>
			<ul>
				<li><a href="index.html">Home</a></li>
				<li><a href="signin.html">signin</a></li>
				<li><a href="#" class="selected">signup</a></li>
				<li><a href="contact.html">Contact Us</a></li>
			</ul>
		</nav><!-- end navigation menu -->
	</header><!-- end header -->

	<section class="main clearfix" id="map">
		<div class="login-card">
    			<h1>sign-up</h1><br>
			<form name="form" method="post" action="user.jsp">
   			 <input type="text" name="name" placeholder="username" required>
   			 <input type="password" name="pass" placeholder="Password" required>
   			 <input type="submit" name="login" class="login login-submit" value="login">
  			</form>
		</div>
	</section><!-- end main/map -->

</body>

</html>
