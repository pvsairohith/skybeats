<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>song</title>
    <link rel="stylesheet" href="musicplayer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" integrity="sha512-PgQMlq+nqFLV4ylk1gwUOgm6CtIIXkKwaIHp/PAIWHzig/lKZSEGKEysh0TCVbHJXCLN7WetD8TFecIky75ZfQ==" crossorigin="anonymous" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="styles.css">
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
        <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-warning" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>
    <div align="center">
    <div class="main"><br>
        <div class="musiccontainer">
        <%
        int userid=(Integer)session.getAttribute("userid");
        String sonid=request.getParameter("songid");
    	int songid=Integer.valueOf(sonid);
    	try{
    	 Connection con = null;
    	 Class.forName("oracle.jdbc.driver.OracleDriver");
    	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
    	      PreparedStatement psmt5=con.prepareStatement("select max(hid) as maxhid from history");
    	      ResultSet rs5=psmt5.executeQuery();
    	      rs5.next();
    	      int maxcount=rs5.getInt(1);
    	      PreparedStatement psmt7=con.prepareStatement("delete from history where userid=? and songid= ?");
    	      psmt7.setInt(1,userid);
    	      psmt7.setInt(2,songid);
    	      psmt7.executeUpdate();
    	      PreparedStatement psmt6=con.prepareStatement("insert into history values(?,?,?)");
    	      psmt6.setInt(1,maxcount+1);
    	      psmt6.setInt(2,userid);
    	      psmt6.setInt(3,songid);
    	      psmt6.executeQuery();
    	      
    	      con.close();
    	}
    	catch (Exception e)
    	{
    		System.out.println(e);
    	}
    	      
        %>
        
         <%
try {
	
	 Connection con = null;
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
      PreparedStatement psmt=con.prepareStatement("select * from song where songid="+songid+"");
      ResultSet rs=psmt.executeQuery();
      rs.next();
      int albumid=rs.getInt("albumid");
      String songname=rs.getString("songname");
      String saddress=rs.getString("saddress");
      PreparedStatement smt=con.prepareStatement("select * from album where albumid="+albumid+"");
      ResultSet rs2=smt.executeQuery();
      rs2.next();
      String albumname=rs2.getString("albumname");
      String iaddress=rs2.getString("iaddress");
      con.close();
      %>
       <div class="imgcontain">
              <img src="download.jsp?albumid=<%=albumid%>">
            </div>
            <audio src=<%=saddress %>></audio>
            <div class="controls">
                <i class="fas fa-backward" id="prev" title="previous"></i>
                <i class="fas fa-play playbutton" id="play" title="play"></i>
                <i class="fas fa-forward" id="next" title="next"></i>
            </div>
            <div id="seekbar">
                <div id="fill">
                    <div id="handle"></div>
                </div>
                <div align="center"  class="contain">
                &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="addtolikedlist.jsp?songid=<%=songid%>" class="button" type="button" >Add to LikedSongs</a>
            </div>
            </div>
            <br>
            <div class="contain">
                <a href="#" class="button" type="button" id="butt">Add to Playlist</a>
            </div>
            
            <br><br>
        </div>
      <% 
}
  catch(Exception e){
	  System.out.println(e);
  }
          
    	  %>
  <%
  try{
	  
	 Connection con = null;
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
	 PreparedStatement psmt=con.prepareStatement("select * from songview where songid="+songid+"");
	 ResultSet rs=psmt.executeQuery();
	 //System.out.println(songid);
	 if(rs.next())
	 {
		int views=rs.getInt("views");
		views++;
		//System.out.println(views);
		PreparedStatement psmt2=con.prepareStatement("update songview set views=? where songid=?");
		psmt2.setInt(1,views);
		psmt2.setInt(2,songid);
		psmt2.executeUpdate();
	 }
	 else{

		 PreparedStatement psmt3=con.prepareStatement("insert into songview values(?,?)");
		 psmt3.setInt(1,songid);
		 psmt3.setInt(2,1);
		 psmt3.executeUpdate();
	 }
	 con.close();
  }
  catch(Exception e)
  {
	  System.out.println(e);
  }
  %>
           
    </div>
    <div class="popup">
        <div class="popup-content">
            <a class="close" href="#">×</a>
            <h1>add to playlist</h1><br>
            <%
            try{
            	
             String umail=(String)session.getAttribute("umail");
          	 Connection con = null;
          	 Class.forName("oracle.jdbc.driver.OracleDriver");
          	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
          	 PreparedStatement psmt=con.prepareStatement("select * from register where umail= ?");
          	 psmt.setString(1,umail);
          	 ResultSet rs=psmt.executeQuery();
          	 //System.out.println(songid);
          	 rs.next();
          	 
          	 PreparedStatement psmt2=con.prepareStatement("select * from playlist where userid= ?");
         	 psmt2.setInt(1,userid);
         	 ResultSet rs2=psmt2.executeQuery();
          	 while(rs2.next())
          	 {
          		 int pid=rs2.getInt("pid");
          		 String pname=rs2.getString("pname");
          		 String link="addtoplaylist.jsp?songid="+songid+"&pid="+pid;
          		 %>
          		<a href="addtoplaylist.jsp?songid=<%=songid%>&pid=<%=pid %>" class="button" type="button" id="butt"><%=pname %></a><br> 
          		<%
          	 }
          	 con.close();
            }
            catch(Exception e)
            {
          	  System.out.println(e);
            }
            %>
            
        </div>
    </div>
</div>

    <script>
        $(document).ready(function(){
        $('.content').click(function(){
          $('.content').toggleClass("heart-active")
          $('.text').toggleClass("heart-active")
          $('.numb').toggleClass("heart-active")
          $('.heart').toggleClass("heart-active")
        });
      });
        document.getElementById("butt").addEventListener("click",function(){
            document.querySelector(".popup").style.display ="flex";
        })
        document.querySelector(".close").addEventListener("click",function(){
            document.querySelector(".popup").style.display ="none";
        })

        const music = document.querySelector("audio");
        const img= document.querySelector("img");
        const play=document.getElementById("play");
        var fillbar=document.getElementById("fill");
        let isplay=false;
        const playMusic= () =>{
            isplay=true;
            music.play();
            play.classList.replace("fa-play","fa-pause");
            img.classList.add("anima")
        };
        const pauseMusic= () =>{
            isplay=false;
            music.pause();
            play.classList.replace("fa-pause","fa-play");
            img.classList.remove("anima")
        };
        play.addEventListener('click', () =>{
            if(isplay){
                pauseMusic();
            }
            else{
                playMusic();
            }
        });
        music.addEventListener('timeupdate',function(){
            var postion=music.currentTime/music.duration;
            fillbar.style.width=postion*100 + "%";
        });
    </script>
</body>
</html>