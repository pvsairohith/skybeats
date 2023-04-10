<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String albumname = request.getParameter("albumname");
String musicdirector = request.getParameter("musicdirector");
String iaddress = request.getParameter("iaddress");
String description = request.getParameter("description");
String releasedate=request.getParameter("releasedate");
String imagepath=request.getParameter("imagepath");
String path1="D:\\Images\\";      
String path=path1+imagepath;
File imagefile=new File(path);
FileInputStream fis=new FileInputStream(imagefile);
int albumid = (int)(Math.random()*999999)+1;
try
{
 Connection con=null;
 Class.forName("oracle.jdbc.driver.OracleDriver");
 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
 PreparedStatement pstmt = con.prepareStatement(" insert into album values(?,?,?,?,?,?)");
 pstmt.setInt(1,albumid);
 pstmt.setString(2, albumname);
 pstmt.setString(3, musicdirector);
 pstmt.setString(4, description);
 pstmt.setString(5, iaddress);
 pstmt.setString(6, releasedate);
 int n=pstmt.executeUpdate();
 PreparedStatement pstmt1 = con.prepareStatement(" insert into albumimage values(?,?)");
 pstmt1.setInt(1,albumid);
 pstmt1.setBinaryStream(2, (InputStream)fis, (int)(imagefile.length()));
 int m=pstmt1.executeUpdate();
 
 if(n==1&&m==1)
 {
	  %>
      <h1 align='center'>Album Added Successfully</h1>
       <jsp:include page="album1.html"/>
       <%
 }
 else {
	 %>
     <h1 align='center'>Album Invalid</h1>
      <jsp:include page="album1.html"/>
      <%
 }
 con.close();
}
catch(Exception e)
{
 out.println(e);
}
%>
</body>
</html>