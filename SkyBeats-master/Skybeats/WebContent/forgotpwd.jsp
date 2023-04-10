<%@ page language="java"  import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <style>
    form{
    text-align:ceneter;
    }
    </style>
    <link href="" rel="stylesheet">
</head>
<body>
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid ">
          <a class="navbar-brand text-warning" href="index.html">SkyBeats</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon "></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              
              <li class="nav-item">
                <a class="nav-link text-warning" href="signup.html">SignUp</a>
                
              </li>
              <li class="nav-item ">
                <a class="nav-link text-warning" href="login.html">Login</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-warning" href="about.html">About</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
       <section class="Form mx-5 my-4">
        <div class="container">
            <div class="row no-gutters">
                
                <div class="col-lg-6 px-5 pt-5 mx-4">
                    <h1 class="font-weight-bold text-center pb-2 king">Forgot Password</h1>
                    <form class="form1" name="f" onsubmit="return Validate()" method="post" action="changepwd.jsp">
                        <div class="form-row">
                            <div class="col-lg-10">
                                <label for="email" class="font-weight-bold"  style="font-weight: bold;">Enter Registered Email</label>
                                <input id="email" name="umail" placeholder="email" class="form-control my-3 p-40">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-10">
                                <label for="password" class="font-weight-bold" style="font-weight: bold;">Enter New password</label>
                                <input type="password" id="password" name="pwd" placeholder="password" class="form-control my-3 p-40">
                            </div>
                        </div>
                        <div class="form-row mt-4">
                            <div class="col-lg-10">
                                <button type="submit"  class="bt">Submit</button>
                            </div>
                        </div>
                     
                    </form>
                    <script>
                    function Validate()
                    {
                        var email=document.getElementById("email").value;
                        var pass=document.getElementById("password").value;

                        if(email.length==0)
                        {
                            alert("Username Should be Required");
                            document.f.email.focus();
                            return false;
                        }
                       if(pass.length==0)
                       {
                        alert("Password Should be Required");
                        document.f.pass.focus();
                        return false;
                       }
                      
                    }
                    </script>
                </div>
            </div>
        </div>

    </section>

   
</body>
</html>
