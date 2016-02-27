<%@ page language ="java" import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

    <%
String user=request.getParameter("user");
String passw=request.getParameter("pass");

     try{

    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sample", "root", "");
     Statement st=con.createStatement();
     ResultSet rs=st.executeQuery("select uname,pass from log");
     while(rs.next())
         {
         String userid=rs.getString(1);
         String password=rs.getString(2);
         if(user.equals(userid) && passw.equals(password))
             {
                    response.sendRedirect("gallery.jsp?table="+user);
            }
     }
     response.sendRedirect("wsignin.html");
}catch(Exception e1)
{}

%>