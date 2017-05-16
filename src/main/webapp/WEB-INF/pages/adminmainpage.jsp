<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	String mypath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=mypath %>/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=mypath%>/static/font-awesome-4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=mypath %>/static/sellerpagestyle/AdminLTE.min.css">
<link rel="stylesheet" href="<%=mypath %>/static/sellerpagestyle/_all-skins.min.css">
<link href="<%=mypath %>/static/mycss/buserpage.css" rel="stylesheet">
<title>外卖点餐系统管理员主页</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <a href="" class="logo"  style="background:black;">
      <span style="font-size:20px;color:white;">管理员中心</span>
    </a>
    <nav class="navbar navbar-static-top" role="navigation">
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
	  <div class="container-fluid">
		  <div class="row">
		  	<div class="col-md-8">
	  		  <div style="width:280px;">
			  </div>
		  	</div>
		  	<div class="col-md-3">
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
					  <li>
						<a>
						  <span class="glyphicon glyphicon-user"></span>
						  <span>${admin.adminname}</span>
						</a>
					  </li>
					  <li>
						<a href="<%=mypath %>/login/logout"><span class="glyphicon glyphicon-log-out"></span></a>
					  </li>
					</ul>
				</div>
		  	</div>
		  </div>
	  </div>
    </nav>
  </header>
  <aside class="main-sidebar">
    <section class="sidebar">
      <ul class="sidebar-menu">
        <li>
          <a href="">
            <span>信息审核</span>
          </a>
        </li>
        
        <li>
          <a href="">
            <span>店铺管理</span>
          </a>
          
        </li>
        <li>
          <a href="">
            <span>用户管理</span>
          </a>
        </li>
      </ul>
    </section>
  </aside>

  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
    	<div style="padding-top:30px;" id = "orderlistshow">
			<c:forEach items="${newshoplist}" var="o" varStatus="status">
				<table class="table table-condensed" style="width:100%;background:#F5F5F5; text-align:left;">
					<thead>
						<tr>
							<th style="height:45px;">
								<div></div>
							</th>
							<th style="height:45px; text-align:right;">
								<div></div>
							</th >
						</tr>
					</thead>
					<tbody id="orderTableTbody">
							<tr style="text-indent:45px;">
								<td>店铺名称:${o.shopname}</td>
								<td id="packingBoxTd">店主名称：${o.ownername}</td>
							</tr>
						<tr style="text-indent:45px;">
								<td>身份证号：${o.idcnum}</td>
								<td id="packingBoxTd">印业执照编号：${o.licensenum}</td>
						</tr>
						<tr style="text-indent:45px;">
								<td>店铺地址：${o.shopaddress}</td>
								<td id="packingBoxTd">店铺电话：${o.shopphonenum}</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="2">
								<div><button onclick="changeOrderTypeToOld(${o.shopid}, ${o.userid})" style="font-size:12px;margin-left:43px;">审核通过</button></div>
							</th>
						</tr>
					</tfoot>
				</table>
			</c:forEach>
		</div>
    </section>
  </div>

  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      Anything you want
    </div>
    <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.
  </footer>
  <div class="control-sidebar-bg"></div>
</div>
<script type="text/javascript" src="<%=mypath %>/static/jquery/jquery.min.js"></script>
<script src="<%=mypath %>/static/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=mypath %>/static/js/app.min.js"></script>
</body>
</html>