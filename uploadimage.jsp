
<html>
<head>
	<title>my web page</title>
	<link rel= "stylesheet"  type= "text/css"  href= "css/reset.css" >
	<link rel= "stylesheet"  type= "text/css"  href= "css/main.css" >
	<link rel= "stylesheet"  type= "text/css"  href= "css/style.css" >

</head>
<body>

	<header>
		<div class= "logo" >
			<a href= "index.html" ><img src= "img/logo.png"  title= "Magnetic"  alt= "Magnetic" /></a>
		</div>

		<div id= "menu_icon" >
		</div>
		<nav>
			<ul>
						<%@ page import="java.sql.*" %>
	<%@ page import="org.apache.commons.fileupload.*"%>
	<%@ page import="org.apache.commons.io.output.*"%>
	<%@ page import="org.apache.commons.fileupload.servlet.*"%>
	<%@ page import="org.apache.commons.fileupload.disk.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="java.util.*"%>
	<%	
		Connection conn=null;
   Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sample","root", "");
    ResultSet rs = null;
    Statement stmt = null;
    stmt = conn.createStatement();
   int i=1;
   byte[] b=null;
   String name=request.getParameter("table");
   				out.println("<li><a href= gallery.jsp?table="+name+"  class= selected >gallery</a></li>");
   				out.println("<li><a href= uploadimage.jsp?table="+name+" >upload</a></li>");
				out.println("<li><a href= delete.jsp?table="+name+" >delete</a></li>");
				out.println("<li><a href= contact.jsp?table="+name+" >Contact Us</a></li>");
	%>
				<li><a href= "index.html" >logout</a></li>
			</ul>
		</nav><!-- end navigation menu -->
	</header><!-- end header -->

	<section class= "main clearfix" >
      <div class="login-card">
      <%
      	out.println("<form name= form action= saveImage.jsp?table="+name+" enctype= multipart/form-data  method= post>");
 		%>
 		<input type="file" class="login login-submit1"	 name="uProperty" /> <br>
 		<input type="submit" name="goUpload" class="login login-submit" value="Upload" />
		</form>
	</div>


   
	</section><!-- end main -->
	
</body>
</html>