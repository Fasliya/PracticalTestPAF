<%@page import="com.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Management</title>
    <link rel="stylesheet" href="Views/css/bootstrap.min.css">
    <script src="Components/jquery-3.5.0.min.js"></script>
    <script src="Components/users.js"></script>
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!-- Material Kit CSS -->
    <link href="Views/css/material-dashboard.css?v=2.1.0" rel="stylesheet"/>

</head>

<body class="dark-edition">
<div class="wrapper ">
    <div class="sidebar" data-color="green" data-background-color="black">
        <div class="logo">
            <a href="users.jsp" class="simple-text logo-normal">
                H e a l t h C a r e
            </a>
        </div>
        <div class="sidebar-wrapper">
            <ul class="nav">
                <li class="nav-item active  ">
                    <a class="nav-link" href="users.jsp">
                        <i class="material-icons">account_circle</i>
                        <p>Users</p>
                    </a>
                </li>
                <!-- your sidebar here -->
            </ul>
        </div>
    </div>
    <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
            <div class="container-fluid">
                <div class="navbar-wrapper">
                    <a class="navbar-brand">User Management</a>
                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="navbar-toggler-icon icon-bar"></span>
                    <span class="navbar-toggler-icon icon-bar"></span>
                    <span class="navbar-toggler-icon icon-bar"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end">
                    <ul class="navbar-nav">
                        <li class="nav-item">

                        </li>
                        <!-- navbar  -->
                    </ul>
                </div>
            </div>
        </nav>
        <!-- End Navbar -->
        <div class="content">
            <div class="container-fluid">
                <!-- content  -->


                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-success">
                                <h4 class="card-title">Add a new User</h4>
                                <p class="card-category">Enter User Details</p>
                            </div>
                            <div class="card-body">


                                <form id="formUser" name="formUser">

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Enter First Name</label>
                                                <input id="firstName" name="firstName" type="text" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Enter Last Name</label>
                                                <input id="lastName" name="lastName" type="text" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Enter Age</label>
                                                <input id="age" name="age" type="number" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Enter Gender</label>
                                                <input id="gender" name="gender" type="text" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Enter Email</label>
                                                <input id="email" name="email" type="text" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Enter Address</label>
                                                <input id="address" name="address" type="text" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Enter Phone Number</label>
                                                <input id="phoneNumber" name="phoneNumber" type="text"
                                                       class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Enter Username</label>
                                                <input id="username" name="username" type="text" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Enter Password</label>
                                                <input id="password" name="password" type="password"
                                                       class="form-control">
                                            </div>
                                        </div>
                                    </div>


                                    <input id="btnSave" name="btnSave" type="button" value="Save"
                                           class="btn btn-primary">
                                    <input type="hidden" id="hidUserIDSave"
                                           name="hidUserIDSave" value="">

                                </form>
                                <br>
                                <div id="alertSuccess" class="alert alert-success"></div>
                                <div id="alertError" class="alert alert-danger"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-success">
                                <h4 class="card-title">View Registered Users</h4>
                                <p class="card-category">Manage Users</p>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div id="divUsersGrid">
                                        <%
                                            User userObj = new User();
                                            out.print(userObj.readUsers());
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="container-fluid">
                <nav class="float-left">
                    <ul>
                        <li>

                        </li>
                    </ul>
                </nav>
                <div class="copyright float-right">
                    R. F Fasliya @ H e a l t h c a r e
                </div>
                <!-- your footer here -->
            </div>
        </footer>
    </div>
</div>

<!--   Core JS Files   -->
<script src="Views/js/core/jquery.min.js"></script>
<script src="Views/js/core/popper.min.js"></script>
<script src="Views/js/core/bootstrap-material-design.min.js"></script>
<script src="https://unpkg.com/default-passive-events"></script>
<script src="Views/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

</body>
</html>
