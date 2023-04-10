<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
    <script src="script.js"></script>
    <title>mymusic</title>
</head>
<body>


    <!--Navigation Bar-->
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
        <form class="d-flex " style="margin-left:auto;">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-warning" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>
<br><br><br>
<!--Nav2 bar-->
<div class="container-fluid">
    <div class="container-fluid bg-dark">
     
        <%
        int pid=Integer.valueOf(request.getParameter("pid"));
        //System.out.println(pid);
        try{
        	Connection con = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
                 PreparedStatement psmt=con.prepareStatement("select * from playlist where pid=?");
                 psmt.setInt(1,pid);
                 ResultSet rs=psmt.executeQuery();
                 rs.next();
                 int userid=rs.getInt("userid");
                 String pname=rs.getString("pname");
                 
                 //System.out.println(userid+""+pname);
                 %>
                 <h1 align="center" class="text-warning"><%=pname %></h1>
                  <table class="table">
                        <thead class="thead-dark">
    <tr>
      <th scope="col" class="text-warning">Song Id</th>
      <th scope="col" class="text-warning">Song Name</th>
      <th scope="col" class="text-warning">Singer</th>
      <th scope="col" class="text-warning">Album Name</th>
      <th scope="col" class="text-warning">Music Director</th>
      
      
    </tr>
  </thead>
  <tbody>
  
                 <%
                 PreparedStatement psmt2=con.prepareStatement("select * from playsongs p,song s,album a where pid=? and p.songid=s.songid and s.albumid=a.albumid");
                 psmt2.setInt(1,pid);
                 ResultSet rs2=psmt2.executeQuery();
                 int count=1;
                 while(rs2.next())
                	 
                 {
                    int songid=rs2.getInt("songid");
                    String songname=rs2.getString("songname");
                    String albumname=rs2.getString("albumname");
                    String musicdirector=rs2.getString("musicdirector");
                    String singer=rs2.getString("singer");
                    
                    String songlink="songpage.jsp?songid="+songid+"";
                	%>
                	<tr>
                	<td class="text-white"><%=count %></td>
                	<td class="text-white"><a href=<%=songlink%>><%=songid %></a></td>
                	<td class="text-white"><%=singer %></td>
                	<td class="text-white"><%=albumname%></td>
                	<td class="text-white"><%=musicdirector%></td>
                	<td class="text-white"><a href="deletefromplaylist.jsp?pid=<%=pid%>&songid=<%=songid %>">Delete</a></td>
                	</tr>
                	<% 
                	count++;
                 }
                 con.close();
        }
        catch (Exception e)
        {
        	System.out.println(e);
        }
        
        %>
        </tbody>
  </table>
        <br>
    </div>
    <hr>
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