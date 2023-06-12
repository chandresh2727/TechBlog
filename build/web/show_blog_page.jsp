<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>

<%

    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login.jsp");
    }


%>



<%    int postId = Integer.parseInt(request.getParameter("post_id"));

    PostDao d = new PostDao(ConnectionProvider.getConnection());

    Post p = d.getPostByPostId(postId);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%> || TechBlog by learn code with me </title>

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
        <!--navbar-->

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class="fa fa-bell-o"></span>Learn code with me <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programing Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data structure</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span> contact</a>
                    </li>
                    <a class="nav-link" href="#" data-togle = "modal" data-target = "modal" data-type = "#add-post-modal"><span class="fa fa-asterisk"></span> DO Post</a>
                    </li>




                </ul>

                <ul class="navbar-nav mr-right">

                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!--end of navbar-->

        <!--main content of body-->


        <div class="container">

            <div class="row my-4">

                <div class="col-md-6 offset-md-3">

                    <div class="card">

                        <div class="card-header">

                            <h4><%= p.getpTitle()%></h4>

                        </div>
                        <div class="card-body">
                            <p><%= p.getContent()%></p>
                            <br>
                            <br>

                            <pre><%= p.getpCode()%></pre>

                        </div>

                        <div class="card-footer primary-background"> 
                            <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <h1>Going to shoe single blogs...</h1>
        <h1>Post id : <%= postId%></h1>


        <div class="modal fade" id="profile-modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="staticBackdropLabel">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" alt="" style="border-radius:50%; max-width:150px; "/>
                            <br>
                            <h5 class="modal-title mt-3" id="staticBackdropLabel"><%= user.getName()%></h5>
                            <!--//details-->

                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID: </th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email: </th>
                                            <td><%= user.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender: r</th>
                                            <td><%= user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Status: </th>
                                            <td><%= user.getAbout()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on: </th>
                                            <td><%= user.getDataTime().toString()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--Profile edit-->
                        <div id="profile-edit" style="display:none;">
                            <h3 class="mt-2" >please edit carefully</h3>
                            <form action="EditServlet" method="post" enctype="multipart/form">
                                <table class="table">

                                    <tr>
                                        <td>id: </td>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Email: </td>
                                        <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Name: </td>
                                        <td><input type="name" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Password: </td>
                                        <td><input type="passsword" class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Gender: </td>
                                        <td><%= user.getGender().toUpperCase()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>About: </td>
                                        <td>
                                            <textarea rows="3" class="form-control" name="user_about><%= user.getAbout()%>
                                                      </textarea>
                                                      </td>
                                                      </tr>
                                                      <tr>
                                                      <td>New Profile: </td>
                                                      <td><input type="file" name="image" class="form-conrol"></td>
                                    </tr>

                                </table>

                                <div class="container">
                                    <button type="submit" class="btn btn-outline-primary">Save
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit </button>
                    </div>
                </div>
            </div>
        </div>


        <!--End of profile modal-->


        <!-- Modal -->
        <!--add-post-modal-->


        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-name" action="AddPostServlet" method="post">

                            <div class="form-group">
                                <select class="form-control" name="Cid">
                                    <option selected disabled >---Select category---</option>
                                    <!--Here you should have to fetch category from data base-->



                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>

                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                    <option>cat1</option>
                                    <option>cat2</option>
                                    <option>cat3</option>
                                    <option>cat4</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" placeholder="Enter your content" style="height: 200px;"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" placeholder="Enter your Program(if any)" style="height: 200px;"></textarea>
                            </div>

                            <div class="form-group">
                                <label>Select your pic</label>
                                <br>
                                <input type="file" name="pic">
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>

        <!--End Add host modal-->





        <!--Java scripts-->

        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
            $(document).ready(function () {
                let editStatus = false;

                $('#edit-profile-button').click(function ()
                {
                    if (editStatus === false)
                    {
                        $("#profile-details").hide();

                        $("#profile-edit").show();

                        editStatus = true;
                    } else
                    {
                        $("#profile-details").show();

                        $("#profile-edit").hide();

                        editStatus = false;

                        $(this).text("Edit");

                    }


                });
            });

        </script>


        <!--Now Add post JS-->

        <script>

            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
//                    This code get called when form is sumitted....
                    event.preventDefault();
                    console.log("You have done it.....");

                    let form = new FormData(this);

//                      now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
//                              success
                            console.log(data);
                            if (data.trim() === 'done')
                            {
                                swal("Good job!", "Saved succesfully ", "success");
                            } else {
                                swal("Error!!", "Something went wrong try Again.....", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
//                            error
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });

        </script>

    </body>
</html>
