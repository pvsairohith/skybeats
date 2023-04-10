<%@page import="java.sql.*"%>

<%@ page import="java.io.*,java.util.*" %>
<% 
Blob image = null;
Connection con = null;
byte[ ] imgData = null ;
PreparedStatement stmt = null;
ResultSet rs = null;
int albumid=Integer.valueOf(request.getParameter("albumid"));
try 
{	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
	
stmt = con.prepareStatement("select aimage from albumimage where albumid=?");
stmt.setInt(1,albumid);
rs = stmt.executeQuery();
if (rs.next()) 
{
image = rs.getBlob(1);
imgData = image.getBytes(1,(int)image.length());
} 
else 
{
out.println("Display Blob Example");
out.println("image not found for given ID");
return;
}
response.setContentType("image/gif");
OutputStream o = response.getOutputStream();
o.write(imgData);
o.flush();
o.close();
} 
catch (Exception e) 
{
out.println("Unable To Display image");
out.println("Image Display Error=" + e.getMessage());
return;
} 
finally 
{
try 
{

stmt.close();
con.close();
} 
catch (SQLException e) 
{
e.printStackTrace();
}
}

%>