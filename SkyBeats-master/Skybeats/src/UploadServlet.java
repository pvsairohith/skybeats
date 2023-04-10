import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215)   
// upload file's size up to 16MB
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
 
        final Part filePart = request.getPart("mp3file");  // html form field name - pfile
       
        InputStream pdfFileBytes = null;
        
        
        final PrintWriter writer = response.getWriter();
        
        HttpSession session=request.getSession(false);  
        
        String mp3id=(String)session.getAttribute("mp3id");  
        
       
        
            try
        {
            
        if (!filePart.getContentType().equals("application/mp3"))  // you can change the file type also
            {
         
        
        	System.out.println("you must upload pdf file only");
       
                       return;
            }
 
           else if (filePart.getSize()>3048576 ) { //2mb
               {
               
                           
            	  	System.out.println("file size should not be greater than 2 MB");
                    
              return;
               }
           }    
           
         pdfFileBytes = filePart.getInputStream();  // to get the body of the request as binary data
 
            final byte[] bytes = new byte[pdfFileBytes.available()];
             pdfFileBytes.read(bytes);  //Storing the binary data in bytes array.
 
        
             Connection con=null;
             Class.forName("oracle.jdbc.driver.OracleDriver");
             con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
             
         PreparedStatement statement = null;
         String sql = "insert into music values(?,?)";
         statement = con.prepareStatement(sql);
            
          statement.setString(1, mp3id);
          
          statement.setBytes(2,bytes);  
       
             
        int success =  statement.executeUpdate();
         
               if(success>0)
               {
  
                 System.out.println("file uploaded successfully");
                    
               }
                 
               
               
               con.close(); 
 
          
         
         
        }
        catch (Exception e) 
        {
           writer.println(e.getMessage());
        }
         
    }

}