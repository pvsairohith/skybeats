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
int userid=(Integer)session.getAttribute("userid");
String sonid=request.getParameter("songid");
int songid=Integer.valueOf(sonid);
try{
	 Connection con = null;
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
	 PreparedStatement psmt2=con.prepareStatement("select * from likedsongs where songid=? and userid=?");
     psmt2.setInt(1,songid);
     psmt2.setInt(2,userid);
     ResultSet rs=psmt2.executeQuery();
     if(rs.next())
     {
    	 String link="songpage.jsp?songid="+songid+"";
	      response.sendRedirect(link);
     }
     else{
    	 PreparedStatement psmt=con.prepareStatement("insert into likedsongs values(?,?)");
	      psmt.setInt(1,userid);
	      psmt.setInt(2,songid);
	      psmt.executeUpdate();
	      String link="songpage.jsp?songid="+songid+"";
	      response.sendRedirect(link);
     }
	      
}
catch (Exception e)
{
	System.out.println(e);
}

%>
</body>
</html>