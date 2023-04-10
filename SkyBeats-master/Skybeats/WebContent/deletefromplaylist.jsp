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
int pid=Integer.valueOf(request.getParameter("pid"));
int songid=Integer.valueOf(request.getParameter("songid"));
try{
	 int userid=(Integer)session.getAttribute("userid");
	Connection con = null;
  Class.forName("oracle.jdbc.driver.OracleDriver");
  con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
  PreparedStatement psmt=con.prepareStatement("delete from playsongs where pid=? and songid=?");
  psmt.setInt(1,pid);
  psmt.setInt(2,songid);
  int n=psmt.executeUpdate();
  String link="playlistpage.jsp?pid="+pid+"";
  response.sendRedirect(link);
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>