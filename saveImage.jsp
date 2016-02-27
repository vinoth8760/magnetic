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
    String name=request.getParameter("table");
   PreparedStatement psImageInsertDatabase=null;
   int i=1;
   byte[] b=null;
   try{
      rs = stmt.executeQuery("select * from "+name+" ORDER BY iImageID ASC");
      while(rs.next())
      {  
          if(i!=rs.getInt("iImageID"))
            break;
          else
            i++;
      }  
      String sqlImageInsertDatabase="insert into "+name+" (iImageID,bImage) values(?,?)";
      psImageInsertDatabase=conn.prepareStatement(sqlImageInsertDatabase);
      
      DiskFileItemFactory factory = new DiskFileItemFactory();

      ServletFileUpload sfu = new ServletFileUpload(factory);
      List items = sfu.parseRequest(request);

      Iterator iter = items.iterator();
      
      while (iter.hasNext()) {
         FileItem item = (FileItem) iter.next();
         if (!item.isFormField()) {
              b = item.get();
          }
      }
      
      psImageInsertDatabase.setInt(1,i);
      psImageInsertDatabase.setBytes(2,b);
      psImageInsertDatabase.executeUpdate();
      response.sendRedirect("gallery.jsp?table="+name);
   }
   catch(Exception e)
   {
     e.printStackTrace();
     response.sendRedirect("addimage.jsp");
   }

%>
