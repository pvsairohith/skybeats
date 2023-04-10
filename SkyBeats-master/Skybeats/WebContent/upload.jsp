<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%

int albumid=Integer.valueOf(request.getParameter("albumid"));
String imagepath=request.getParameter("imagepath");  //field in html form

String path1="D:\\images\\";       // you can change this path

String path=imagepath;
File imagefile=new File(path);
FileInputStream fis=new FileInputStream(imagefile);
  
try
{
   Connection con=null;
   Class.forName("oracle.jdbc.driver.OracleDriver");
   con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
   PreparedStatement pstmt=null;
   pstmt=con.prepareStatement("insert into albumimage values(?,?)");
   pstmt.setInt(1,albumid);
   
   pstmt.setBinaryStream(2, (InputStream)fis, (int)(imagefile.length()));
   
   pstmt.executeUpdate();
   
   out.println("Uploaded");
   con.close();
}   
catch(Exception e)
{
    out.println("Exception:"+e);
}   
%>