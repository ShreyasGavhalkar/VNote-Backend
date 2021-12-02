<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">
  <head>
    <meta charset="utf-8" />

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Vnote | Register </title>

    <script>
        let input=document.forms["myForm"]["pass"].value;
        function validateForm() {
        let x = document.forms["myForm"]["pass"].value;
        let x1 = document.forms["myForm"]["email"].value;
        if (x== "") {
        alert("Password is required");
        return false;
        }
        if (x1== "") {
        alert("Email is required");
        return false;
        }
    
    }
        
        </script>

    <style>
        *{
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }
        
        body
        {
            background : rgb(219, 226, 226)
        }
        .row
        {
            background: white;
            border-radius: 30px;
            box-shadow: 12px 12px 22px grey;
        }
        img{
            border-top-left-radius: 30px;
            border-bottom-left-radius: 30px;
        }
        .btn1
        {
            border: none;
            outline: none;
            height: 50px;
            width: 100%;
            background-color: black;
            color: white;
            border-radius: 4px;
            font-weight:bold ;

        }
        .btn1:hover
        {
            background: white;
            border: 1px solid;
            color: black;
        }
    </style>
  </head>

  <body>
    <section class ="Form my-4 mx-5">
    <div class="container">
        <div class ="row g-0">
            <div class="col-lg-5">
                <img src="./image.jpg" class="img-fluid" alt="">
            </div>
            <div class="col-lg-7">
                <h1 class = "font-weight-bold px-5 pt-5">Vnote</h1>
                <h4 class = "px-5 pt-5"> Create an Account</h4>
                <form class = "px-5" name="myForm" class="container" action="Register"  method="post">

                    <div class ="form-row">
                        <div class="col-lg-7">
                            <input type ="email" name="email" id="email" placeholder="Enter valid Email-Address" class = "form-control my-3 p-4 ">
                        </div>
                        </div>
                    <div class ="form-row">
                        <div class="col-lg-7">
                        <input type ="password" name="pass" placeholder="Set Password" class = "form-control my-3 p-4">
                    </div>
                        </div>
                    <div class ="form-row">
                        <div class="col-lg-7">
                        <button type ="submit" onclick=" return validateForm()" class="btn1 mt-3 mb-5 " >Register </button>
                        
                    </div>
                      <%
                           if(session.getAttribute("user")!=null)
                           {
                        	   if(session.getAttribute("user") == "FAIL")
                        	   {
                        		   out.println("<b>Email already in use. </b>");
                        	   }
                        	   else
                        	   {
                        		   response.sendRedirect("main.jsp");
                        	   }
                           }
                       
                       
                       %> 
                    <p>Go back to
                    <a href="#" class="link-dark ">Login Page.</a></p>
                
                    </div>
                </form>
            
            </div>   
            </div>  
    </div>
    </section>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">

    </script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>