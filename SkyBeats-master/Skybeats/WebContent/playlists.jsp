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
    <style>
    .close{
    position: absolute;
    top:-15px;
    right:-15px;
    background:#fff;
    height: 20px;
    width:20px;
    border-radius: 50%;
    box-shadow: 6px 6px 29px -4px rgba(0,0,0,0.75);
}
.heart-btn{
    position: absolute;
    top: 15%;
    left: 65%;
    transform: translate(-50%,-50%);
  }
  .content{
    padding: 5px 5px;
    display: flex;
    border-radius: 5px;
    cursor: pointer;
  }
  .heart{
    position: absolute;
    background: url("images/img.png") no-repeat;
    background-position: left;
    background-size: 2900%;
    height: 90px;
    width: 90px;
    top: 50%;
    left: 21%;
    transform: translate(-50%,-50%);
  }
  .text{
    font-size: 15px;
    margin-left: 30px;
    color: grey;
    font-family: 'Montserrat',sans-serif;
  }
  .numb:before{
    content: '0';
    font-size: 15px;
    margin-left: 7px;
    font-weight: 600;
    color: #9C9496;
    font-family: sans-serif;
  }
  .numb.heart-active:before{
    color: #000;
  }
  .text.heart-active{
    color: #000;
  }
  .heart.heart-active{
    animation: animate .8s steps(28) 1;
    background-position: right;
  }
  @keyframes animate {
    0%{
      background-position: left;
    }
    100%{
      background-position: right;
    }
  }
@keyframes rotate{
    from{
        transform: rotate(0deg);
    }
    to{
        transform: rotate(360deg);
    }
}
#volume-container{
    margin-top:3rem;
    color:white;
}
#seekbar{
    width:250px;
    height:5px;
    background-color: gray;
    display:flex;
    border-radius:50px;
    margin-top:30px;
    margin-left:100px;
    cursor:pointer;
}
#fill{
    height:5px;
    background-color:royalblue;
    border-radius: 20px;
}
    </style>
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
        <div class="row" style="padding-bottom:10px">
            <div class=" col-md-1.5 col-xs-4" style="padding: 10px;">
                <button type="button" class="btn  btn-rounded btn-outline-danger" onclick="location.href='mymusic.html'">Liked Songs</button>
            </div>
            <div class=" col-md-1.5 col-xs-4" style="padding: 10px;">
                <button type="button" class="btn  btn-rounded btn-outline-primary" onclick="location.href='recentlyplayed.jsp'">Recently Played Songs</button>
            </div>
            <div class=" col-md-1.5 col-xs-4" style="padding: 10px;">
                <button type="button" class="btn btn-outline-success btn-rounded active" onclick="location.href='playlists.jsp'">My Playlists</button>
            </div>
        </div>
        <%
        String umail=(String)session.getAttribute("umail");
        //System.out.println(umail);
        try {
        	
         Connection con = null;
         Class.forName("oracle.jdbc.driver.OracleDriver");
         con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
              PreparedStatement psmt=con.prepareStatement("select * from register where umail=?");
              psmt.setString(1,umail);
              ResultSet rs=psmt.executeQuery();
              int userid;
              if(rs.next());
              {
              userid=rs.getInt("userid");
              }
              //System.out.println(userid);
              PreparedStatement psmt2=con.prepareStatement("select * from playlist where userid=? ");
              psmt2.setInt(1,userid);
              ResultSet rs2=psmt2.executeQuery();
              while(rs2.next())
              {
            	  int pid=rs2.getInt("pid");
            	  String pname=rs2.getString("pname");
            	  String link="playlistpage.jsp?pid="+pid+"";
            	  %>
          <div class="row">
            <br>
           <button type="button" class="btn btn-outline-warning btn-rounded col-md-12" onclick="location.href='<%=link %>'" ><%=pname %></button>
        </div>
            	  <% 
            	  
              }
              con.close();
        }
              catch (Exception e)
              {
            	  System.out.println(e);
              }
        %>
        <div class="row">
            <br>
           <button type="button" class="btn btn-outline-warning btn-rounded col-md-12" onclick="location.href='createplaylist.html'" >Add New Playlist</button>
        </div>
        
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
    <script>
    document.getElementById("butt").addEventListener("click",function(){
        document.querySelector(".popup").style.display ="flex";
    })
    document.querySelector(".close").addEventListener("click",function(){
        document.querySelector(".popup").style.display ="none";
    })
    </script>
</body>
</html>