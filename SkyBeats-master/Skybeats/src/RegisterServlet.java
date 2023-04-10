import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet
{
 public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException
 {
  res.setContentType("text/html");
  PrintWriter out = res.getWriter();
  String umail = req.getParameter("umail");
  String pwd = req.getParameter("pwd");
  String fname = req.getParameter("fname");
  String lname = req.getParameter("lname");
  String gender = req.getParameter("gender");
  String ccode = req.getParameter("ccode");
  String mobno = req.getParameter("mobno");
  int userid = (int)(Math.random()*999999)+1;
  try
  {
   Connection con=null;
   Class.forName("oracle.jdbc.driver.OracleDriver");
   con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
   PreparedStatement pstmt = con.prepareStatement(" insert into register values(?,?,?,?,?,?,?,?)");
   pstmt.setInt(1,userid);
   pstmt.setString(2, umail);
   pstmt.setString(3, pwd);
   pstmt.setString(4, fname);
   pstmt.setString(5, lname);
   pstmt.setString(6, gender);
   pstmt.setString(7, ccode);
   pstmt.setString(8, mobno);
   int n=pstmt.executeUpdate();
   if(n==1)
   {
	out.println("<h1 align='center'>Registered Sucessfully</h1>");
   RequestDispatcher ro= req.getRequestDispatcher("login.html");
   ro.include(req, res);
   }
   else {
	   out.println("Invalid login");
	   RequestDispatcher ro= req.getRequestDispatcher("register.html");
	   ro.include(req, res);
   }
  }
  catch(Exception e)
  {
   out.println(e);
  }
 }
}