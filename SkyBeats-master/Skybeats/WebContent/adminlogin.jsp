<%@ page language="java"  import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
String aname=request.getParameter("aname");
String pwd=request.getParameter("pwd");
try {
 Connection con = null;
 Class.forName("oracle.jdbc.driver.OracleDriver");
 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
      PreparedStatement psmt=con.prepareStatement("select * from admin where aname=?");
      psmt.setString(1,aname);
      ResultSet rs=psmt.executeQuery();
       rs.next();
      
       if(rs.getString("aname").equals(aname) && rs.getString("pwd").equals(pwd))
       {
        session.setAttribute("aname", aname);
        response.sendRedirect("admin.jsp");
       }
 
       else {
    	   %>
      <h1 align='center'>Invalid credentials</h1>
       <jsp:include page="adminlogin.html"/>
       <%
      }
       con.close();
}
catch(Exception e) {
 System.out.println(e);
}
%>
