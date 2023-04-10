<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <link rel="stylesheet" href="sty.css">

        <title>Admin panel</title>
    </head>
    <body id="body-pd">
        <header class="header" id="header">
            <div class="header__toggle">
                <i class='bx bx-menu' id="header-toggle"></i>
            </div>

            <div class="header__img">
                <img src="assets/img/perfil.jpg" alt="">
            </div>
        </header>

        <div class="l-navbar" id="nav-bar">
            <nav class="nav">
                <div>
                    <a href="#" class="nav__logo">
                        <i class='bx bx-layer nav__logo-icon'></i>
                        <span class="nav__logo-name">Admin panel</span>
                    </a>

                    <div class="nav__list">
                        <a href="admin.jsp" class="nav__link active">
                        <i class='bx bx-grid-alt nav__icon' ></i>
                            <span class="nav__name">Dashboard</span>
                        </a>

                        <a href="song1.html" class="nav__link">
                            <i class='bx bx-music' ></i>
                            <span class="nav__name">Add Songs</span>
                        </a>
                        
                        <a href="album1.html" class="nav__link">
                            <i class='bx bx-message-square-detail nav__icon' ></i>
                            <span class="nav__name">Add Albums</span>
                        </a>

                        <a href="#" class="nav__link">
                            <i class='bx bx-bookmark nav__icon' ></i>
                            <span class="nav__name">all songs</span>
                        </a>

                        <a href="allalbums.jsp" class="nav__link">
                            <i class='bx bx-folder nav__icon' ></i>
                            <span class="nav__name">All Albums</span>
                        </a>

                    </div>
                </div>

                <a href="#" class="nav__link">
                    <i class='bx bx-log-out nav__icon' ></i>
                    <span class="nav__name">Log Out</span>
                </a>
            </nav>
        </div>
        <div>
        <h1 align="center">Most Listened Songs</h1>
        <div align="center">
          <section class="container">
                <div class="col-lg-6 px-5 pt-5 mx-4">
                        <table class="table">
                        <thead class="thead-dark">
    <tr>
      <th scope="col">Song Id</th>
      <th scope="col">Song Name</th>
      <th scope="col">Album name</th>
      <th scope="col">Singer</th>
      <th scope="col">Views</th>
    </tr>
  </thead>
  <tbody>  
    <%
try {

 Connection con = null;
 Class.forName("oracle.jdbc.driver.OracleDriver");
 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
      PreparedStatement psmt=con.prepareStatement("select * from songview v,song s,album a where v.songid=s.songid and s.albumid=a.albumid order by v.views desc");
      ResultSet rs=psmt.executeQuery();
     
  while(rs.next())
  { 
	
 int songid=rs.getInt("songid");
 String albumname=rs.getString("albumname");
    	  String songname=rs.getString("songname");
    	  String singer=rs.getString("singer");
    	  int views=rs.getInt("views");
    	  %>
    	  <tr>
    	  <td><a href=""><%=songid %></a></td>
    	  <td><%=songname %></td>
    	  <td><%=albumname %></td>
    	  <td><%=singer %></td>
    	  <td><%=views %></td>
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
                        
                             </div>
                </section>
        </div>
        
        </div>
        
        <script src="main.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
    crossorigin="anonymous"></script>
    <script>
        $(function () {
            $(document).scroll(function () {
                var $nav = $("#mainNavbar");
                $nav.toggleClass("scrolled", $(this).scrollTop() > $nav.height());
            });
        });
    </script>
    </body>
</html>