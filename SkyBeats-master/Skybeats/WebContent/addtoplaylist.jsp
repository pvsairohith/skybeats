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
try{
     int pid=Integer.valueOf(request.getParameter("pid"));
     int songid=Integer.valueOf(request.getParameter("songid"));
 	 Connection con = null;
 	 Class.forName("oracle.jdbc.driver.OracleDriver");
 	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
 	PreparedStatement psmt2=con.prepareStatement("select * from playsongs where songid=? and pid=?");
 	psmt2.setInt(1,songid);
 	psmt2.setInt(2,pid);
 	ResultSet rs=psmt2.executeQuery();
 	String link="songpage.jsp?songid="+songid+"";
 	if(rs.next())
 	{
 		%>
 		<h1>Already added in playlist</h1>
 		<jsp:include page="<%=link%>"></jsp:include>
 		<%  
 	}
 	else{
 	 PreparedStatement psmt=con.prepareStatement("insert into playsongs values(?,?)");
 	 psmt.setInt(1,pid);
 	 psmt.setInt(2,songid);
 	 int n=psmt.executeUpdate();
 	 
 	 if(n>0)
 	 {
 		%>
 		<h1>Song added to Playlist</h1>
 		<jsp:include page="<%=link %>"></jsp:include>
 		<% 
 	 }
 	 else{
 		%>
 		<h1>Song Not added to Playlist</h1>
 		<jsp:include page="<%=link %>"></jsp:include>
 		<% 
 	 }
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