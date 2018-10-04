<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" >
	<head></head>
	<body>
		<%
			//Database Credentials
			String DRIVER = "com.mysql.jdbc.Driver";
			String DBuser="root";
			String DBpass="root";
			String DBURL="jdbc:mysql://localhost:3306/it2018?autoReconnect=true&useSSL=false";
			
			String uname_db = null;
			String pwd_db = null;
			
			try{
				String username = request.getParameter("uname_form");
				String password = request.getParameter("pwd_form");
				Class.forName(DRIVER);
				Connection conn=DriverManager.getConnection(DBURL, DBuser, DBpass);
				Statement stmt=conn.createStatement();
				String sql="SELECT * FROM user WHERE uname='"+username+"' AND pwd='"+password+"'";
				ResultSet rs=stmt.executeQuery(sql);
				
				while(rs.next()){
					uname_db=rs.getString("uname");
					pwd_db=rs.getString("pwd");
				}
				if(username.equals(uname_db)){
					if(password.equals(pwd_db)){
						out.println("Welcome "+username);
					}
				}
				else{
					out.println("Invalid Username");				}
			
				conn.close();
			}
			catch(Exception e){
				out.println("Error: "+e.getMessage());			
			}
			
		%>
	</body>
</html>

