<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
    <%
            String connectionURL = "jdbc:mysql://localhost:3306/sample";
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection connection = DriverManager.getConnection(connectionURL, "root", "");
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery("select uname,pass from log");
            String name=request.getParameter("name");
            String pass=request.getParameter("pass");
            try {
                while(rs.next())
                {
                    String userid=rs.getString(1);
                    if(name.equals(userid))
                    {
                        response.sendRedirect("wsignup.jsp");
                    }
                }
                String QueryString = "create table "+name+"(iImageID int(11) primary key,bImage longblob);";
                st.executeUpdate(QueryString);
                QueryString = "insert into log (uname,pass) values('"+name+"','"+pass+"');";
                st.executeUpdate(QueryString);
                response.sendRedirect("gallery.jsp?table="+name);
                
                }
                catch (Exception ex) {} 
            %>