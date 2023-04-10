<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
        <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
        <link rel="stylesgeet" href="https://rawgit.com/creativetimofficial/material-kit/master/assets/css/material-kit.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="profile.css">
    </head>
    <body class="profile-page">
      <div>
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
                  <a class="nav-link text-warning" href="browse.html">Browse</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-warning" href="mymusic.html">My Music</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-warning" href="profile.html">Profile</a>
                </li>
              </ul>
              <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-warning" type="submit">Search</button>
              </form>
            </div>
          </div>
        </nav>
      </div>
        <div class="page-header header-filter" data-parallax="true" style="background-image:url('http://wallpapere.org/wp-content/uploads/2012/02/black-and-white-city-night.png');"></div>
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                           <div class="profile">
                                <div class="avatar">
                                    <img src="images/avatar.jpg" alt="Circle Image" class="img-raised rounded-circle img-fluid">
                                    <%
String umail=(String)session.getAttribute("umail");
int userid;
String fname;
String lname;
String ccode;
String mobno,gender;
try {
	   Connection con = null;
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
	        PreparedStatement stmt=con.prepareStatement("select * from register where umail='"+umail+"'");
	        ResultSet rs=stmt.executeQuery();
	        rs.next();
	         if(rs.getString("umail").equals(umail)) {
	          userid=rs.getInt("userid");
	          fname=rs.getString("fname");
	           lname=rs.getString("lname");
	          gender=rs.getString("gender");
	           ccode=rs.getString("ccode");
	          mobno=rs.getString("mobno");
	          %>
	         
                                </div>
                                <div class="name">
                                    <h3 class="title">Profile</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="description text-center">
                        <b><i>Music Lover</i></b>
                    </div>
                </div>
            
              <div class="tab-content tab-space">
                <div class="text-center">
                            <table class="table table-borderless">
                                  <tr>
                                    <th scope="row">Email: </th>
                                    <th scope="row"><%=umail %></th>
                                  </tr>
                                <tbody>
                                  <tr>
                                    <th scope="row">First Name</th>
                                    <td><%=fname %></td>
                                  </tr>
                                  <tr>
                                    <th scope="row">Last Name</th>
                                    <td><%=lname %></td>
                                  </tr>
                                  <tr>
                                    <th scope="row">Mobile Number</th>
                                    <td><%=ccode %><%=mobno %></td>
                                  </tr>
                                </tbody>
                              </table>
                              <h2><a href="logout.jsp">Logout</a></h2>
                              <%
                              }
	         con.close();
}
catch (Exception e)
{
	System.out.println(e);
}
	          %>
                          </div>
                </div>
            </div>
        </div>
        <footer class="footer text-center ">
            <p>All Rights Reserved To SkyBeats</p>
        </footer>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
    </body>
</html>