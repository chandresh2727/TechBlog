
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry Something went wrong.....</title>
        
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-backgrond{
                /*clip-path : polygon(30% 0%, 70% 0%, 100% 0, 100% 81%, 70% 100%, 30% 100%, 0 81%, 0 0);*/
                /*clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 94%, 69% 74%, 30% 75%, 0 93%, 0 0);*/
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 94%, 68% 95%, 30% 96%, 0 93%, 0 0);
            }
        </style>
        
        
    </head>
    <body>
        <div class="container text-center">
            <img src="img/computer.png" class="img-fluid" alt=""/>
            <h3 class="display-3">Sorry ! something went wrong</h3>
          <!--  <%= exception %> -->
            
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3"> Home</a>
        </div>
        
        
        
        
    </body>
</html>
