import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/LoginC")
public class LoginServlet extends HttpServlet {
 public void service(HttpServletRequest req,HttpServletResponse res) throws IOException ,ServletException{
  res.setContentType("text/html");
  PrintWriter out=res.getWriter();
  String umail=req.getParameter("umail");
  String pwd=req.getParameter("pwd");
  try {
   Connection con = null;
   Class.forName("oracle.jdbc.driver.OracleDriver");
   con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
        PreparedStatement stmt=con.prepareStatement("select umail,pwd from register where umail='"+umail+"'");
        ResultSet rs=stmt.executeQuery();
        rs.next();
         if(rs.getString("umail").equals(umail) && rs.getString("pwd").equals(pwd)) {
          HttpSession session = req.getSession(true);
          session.setAttribute("umail", umail);
          res.sendRedirect("home1.html");
         }
   
         else {
         out.println("<h1 align='center'>Invalid credentials</h1>");
         RequestDispatcher rd=req.getRequestDispatcher("login.html");
         rd.include(req, res);
        }
  }
  catch(Exception e) {
   out.println(e);
  }
 }
}