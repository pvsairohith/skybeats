<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
    <title>SkyBeats</title>

    <style>
     
    </style>
</head>
<body style="background-color:black;">
    <!--Nav Bar-->
    <nav class="navbar navbar-expand-lg navbar-light bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand text-warning" href="#">SkyBeats</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active text-warning" aria-current="page" href="home1.html">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-warning" href="trendingsongs.jsp">Browse</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-warning" href="mymusic.html">My Music</a>
              </li>
               <li class="nav-item">
                <a class="nav-link text-warning" href="profile.jsp">Profile</a>
              </li>
            </ul>
            <form class="d-flex" style="margin-left:auto;">
              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-warning" type="submit">Search</button>
            </form>
          </div>
        </div>
      </nav>
<br>
<!--Nav2 bar-->

<div  class="container" >
 <div align="center">
           
    <%
try {
	String albid=request.getParameter("albumid");
	int albumid=Integer.valueOf(albid);
 Connection con = null;
 Class.forName("oracle.jdbc.driver.OracleDriver");
 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
      PreparedStatement psmt=con.prepareStatement("select * from song where albumid="+albumid+"");
      ResultSet rs=psmt.executeQuery();
      PreparedStatement smt=con.prepareStatement("select * from album where albumid="+albumid+"");
      ResultSet rs2=smt.executeQuery();
      rs2.next();
      String albumname=rs2.getString("albumname");
    	  %>
                <div class="col-lg-6 px-5 pt-5 mx-4">
                    <h1 class="font-weight-bold text-center pb-2 king text-warning"><%=albumname %></h1>
                    <img src="download.jsp?albumid=<%=albumid%>">
                    <form class="form1 as" method="post" >
                        <table class="table">
                        <thead class="thead-dark">
    <tr>
      <th scope="col-2" class="text-warning">Song Id</th>
      <th scope="col" class="text-warning">Song Name</th>
      <th scope="col" class="text-warning">Singer</th>
    </tr>
  </thead>
  <tbody>
  <% 
  int count=0;
  while(rs.next())
  { 
	  count++;
 int songid=rs.getInt("songid");
    	  String songname=rs.getString("songname");
    	  String singer=rs.getString("singer");
    	  String saddress=rs.getString("saddress");
    	  String songlink="songpage.jsp?songid="+songid+"";
    	  %>
    	  <tr>
    	  <td class="text-warning"><%=count %></td>
    	  <td class="text-white"><a href=<%=songlink %>><%=songname %></a></td>
    	  <td class="text-warning"><%=singer %></td>
    	  
    	  </tr>
    	  <% 
    	  
  }
  con.close();
 }
catch(Exception e) {
 System.out.println(e);
}
%>
  </tbody>
                        </table>
                    </form>
                </div>
</div>
   </div>
   <br><br><br><br>
    <footer>
        <div class="container-fluid">
            <div class="container-fluid bg-dark">
                <div class="row">
                  <div class="col-md-4 text-secondary">
                    <h5>Trending</h5>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt at minima dolorem. Vero accusantium quia numquam distinctio rerum debitis, velit optio quos blanditiis tempora iusto tenetur ab voluptates ex cumque.</p>
                  </div>
                  <div class="col-md-4 text-secondary">
                    <h5>New Releases</h5>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt at minima dolorem. Vero accusantium quia numquam distinctio rerum debitis, velit optio quos blanditiis tempora iusto tenetur ab voluptates ex cumque.</p>
                  </div>
                  <div class="col-md-4 text-secondary">
                    <h5>Genere</h5>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt at minima dolorem. Vero accusantium quia numquam distinctio rerum debitis, velit optio quos blanditiis tempora iusto tenetur ab voluptates ex cumque.</p>
                  </div>
                </div>
              </div>
        </div>
    </footer>
</body>
</html>