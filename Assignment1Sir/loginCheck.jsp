<html>
<body>
<%@ page import="java.sql.*" %>
<%!
  Connection con = null;
  Statement stmt = null;
  ResultSet rs = null;
%>
<%
      try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection("jdbc:mysql:///it2018","root", "root");

        System.out.println("Successfully connected to " + "MySQL server using TCP/IP...");

        stmt = con.createStatement();
        rs = stmt.executeQuery("select * from user");
    
        while(rs.next()) {
            out.println("User Name = "+rs.getString("uname")+"       "+"Password = "+rs.getString("pwd")+"<br>");
        }  
      } 
      catch(Exception e)  {
      	    out.println("Exception: " + e.getMessage());
      } 
      finally {
      	     try {
        	if(con != null)
          	  con.close();
      	     } 
	     catch(SQLException e) {}
      }
%>
</body>
</html>
