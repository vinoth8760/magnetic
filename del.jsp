<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
        <%
            String name=request.getParameter("table");
            String id=request.getParameter("id");
            int x;
            x=Integer.parseInt(id);
            String connectionURL = "jdbc:mysql://localhost:3306/sample";
            Connection connection = null;
            Statement statement = null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(connectionURL, "root", "");
                statement = connection.createStatement();
                String QueryString = "delete from "+name+" where iImageid = "+x+";";
                statement.executeUpdate(QueryString);
                response.sendRedirect("delete.jsp?table="+name);
                }
                catch (Exception ex) {} 
                
        %>