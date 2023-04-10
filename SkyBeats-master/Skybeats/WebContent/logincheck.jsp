<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
  String umail=request.getParameter("umail");
  String pwd=request.getParameter("pwd");
  try {
   Connection con = null;
   Class.forName("oracle.jdbc.driver.OracleDriver");
   con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
        PreparedStatement stmt=con.prepareStatement("select userid,umail,pwd from register where umail='"+umail+"' and pwd='"+pwd+"'");
        ResultSet rs=stmt.executeQuery();
        
         if(rs.next()) {
          
          session.setAttribute("umail", umail);
          session.setAttribute("userid", rs.getInt("userid"));
          response.sendRedirect("home1.html");
         }
   
         else {
         %>
         <h1 align='center'>Invalid credentials</h1>
         <jsp:include page="login.html"></jsp:include>
         <%
        }
         con.close();
  }
  catch(Exception e)
  {
   out.println(e);
  }
 %></body>
</html>