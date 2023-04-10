<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
try
{
String email=(String)request.getParameter("umail" );
String upwd=(String)request.getParameter("pwd");
Connection con=null;
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
PreparedStatement ps = con.prepareStatement("update register set pwd=? where umail=?");
ps.setString(1, upwd);
ps.setString(2, email);
int n= ps.executeUpdate();
if(n==1)
{
	out.println("updated successfully");
}
else{
	out.println("not updated");
}
con.close();
}
catch(Exception e)
{
 System.out.println(e);
}
%>