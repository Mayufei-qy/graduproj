<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String mypath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="<%=mypath %>/static/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=mypath %>/static/sellerpagestyle/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
   folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="<%=mypath %>/static/sellerpagestyle/_all-skins.min.css">
<title>商家主页</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="" class="logo"  style="background:black;">
      <span style="font-size:20px;color:white;">商家中心</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
	  
	  <div class="container-fluid">
		  <div class="row">
		  	<div class="col-md-9">
	  		  <div style="width:280px;">
		      	<form action="#" method="get" class="sidebar-form" style="">
					<div class="input-group" >
						<input type="text" name="q" class="form-control" placeholder="Search..." style="background:#ffffff;height:30px;">
						<span class="input-group-btn">
							<button type="submit" name="search" id="search-btn" class="btn btn-flat" style="background:#ffffff;height:30px;padding:4px 10px;"><i class="fa fa-search" style="height:30px;color:black;"></i>
							</button>
						</span>
					</div>
				</form> 
			  </div>
		  	</div>
		  	<div class="col-md-2">
				<div style="height:50px;">
					<button style="border:none;border-radius:3px;padding:3px 12px;margin-top:12px;color:black;font-size:16px;">${user.email}</button>
					<a href="<%=mypath %>/login/logout">退出</a>
				</div>
		  	</div>
		  </div>
	  </div>
	  

	  

    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li>
          <a href="">
            <span>商家主页</span>
          </a>
        </li>
        
        <li class="treeview">
          <a href="">
            <span>订单管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href=""><i class="fa fa-circle-o"></i> blank</a></li>
            <li><a href=""><i class="fa fa-circle-o"></i> blank</a></li>
            <li><a href=""><i class="fa fa-circle-o"></i> blank</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="">
            <span>菜品管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href=""><i class="fa fa-circle-o"></i> blank</a></li>
            <li><a href=""><i class="fa fa-circle-o"></i> blank</a></li>
            <li><a href=""><i class="fa fa-circle-o"></i> blank</a></li>

          </ul>
        </li>
        <li class="treeview">
          <a href="">
            <span>blank</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href=""><i class="fa fa-circle-o"></i> blank</a></li>
            <li><a href=""><i class="fa fa-circle-o"></i> blank</a></li>
            <li><a href=""><i class="fa fa-circle-o"></i> blank</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="">
            <span>blank</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href=""><i class="fa fa-circle-o"></i> blank</a></li>
            <li><a href=""><i class="fa fa-circle-o"></i> blank</a></li>
          </ul>
        </li>
        
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  
  <!-- Content -->
  <div class="content-wrapper">
	<span>${shop.shopname}</span><br/>
	<span>${shop.ownername}</span><br/>
	<span>${shop.shopaddress}</span><br/>
  </div>
  
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.8
    </div>
    <strong>Copyright &copy; 2014-2016</strong> All rights
    reserved.
  </footer>
</div>
<!-- jQuery 2.2.3 -->
<script type="text/javascript" src="<%=mypath %>/static/jquery/jquery.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=mypath %>/static/js/app.min.js"></script>
</body>
</html>