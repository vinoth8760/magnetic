  <%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>

<%
response.setContentType("image/gif");
OutputStream o = response.getOutputStream();

Blob image = null;
//long   imgLen;
Connection con = null;

byte[ ] imgData = null ;

Statement stmt = null;

ResultSet rs = null;

try 
{

Class.forName("com.mysql.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sample","root","");

stmt = con.createStatement();
String id = request.getParameter("id");
String name = request.getParameter("table");


rs = stmt.executeQuery("select bImage from "+name+" where iImageID='"+id+"'");
while(rs.next()){   
        image = rs.getBlob(1);
        imgData = image.getBytes(1,(int)image.length());
        o.write(imgData);
     }    
o.close();

} catch (Exception e)
{

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());
}

%>