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
String songname = request.getParameter("songname");
String singer = request.getParameter("singer");
String saddress = request.getParameter("saddress");
String releasedate = request.getParameter("releasedate");
int albumid = Integer.valueOf(request.getParameter("albumid"));
String songdescription = request.getParameter("songdescription");
int songid = (int)(Math.random()*999999)+1;
System.out.println(saddress);
try
{
 Connection con=null;
 Class.forName("oracle.jdbc.driver.OracleDriver");
 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
 PreparedStatement pstmt = con.prepareStatement(" insert into song values(?,?,?,?,?,?,?)");
 pstmt.setInt(1,songid);
 pstmt.setInt(2,albumid);
 pstmt.setString(3, songname);
 pstmt.setString(4, singer);
 pstmt.setString(5, releasedate);
 pstmt.setString(6, songdescription);
 pstmt.setString(7, saddress);
 
 int n=pstmt.executeUpdate();
 if(n==1)
 {
	  %>
      <h1 align='center'>Song Added Successfully</h1>
       <jsp:include page="song1.html"/>
       <%
 }
 else {
	 %>
     <h1 align='center'>Song Invalid</h1>
      <jsp:include page="song1.html"/>
      <%
 }
 con.close();
}
catch(Exception e)
{
 System.out.println(e);
}
%>
</body>
</html>