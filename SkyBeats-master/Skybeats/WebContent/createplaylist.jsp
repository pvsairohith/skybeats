<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%
   String umail=(String)session.getAttribute("umail");
   int userid=(Integer)session.getAttribute("userid");
   
   String pname=request.getParameter("pname");
   int pid = (int)(Math.random()*999999)+1;
   try {
	   Connection con = null;
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
	        PreparedStatement psmt=con.prepareStatement("insert into playlist values(?,?,?)");
	        psmt.setInt(1,pid);
	        psmt.setInt(3,userid);
	        psmt.setString(2,pname);
	     psmt.executeUpdate();
	     response.sendRedirect("playlists.jsp");
	        con.close();
   }
   catch (Exception e)
   {
	   System.out.println(e);
   }
	        
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>