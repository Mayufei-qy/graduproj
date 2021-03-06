<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>外卖点餐系统商家主页</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <a href="" class="logo"  style="background:black;">
      <span style="font-size:20px;color:white;">商家中心</span>
    </a>
    <nav class="navbar navbar-static-top" role="navigation">
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
	  <div class="container-fluid">
		  <div class="row">
		  	<div class="col-md-8">
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
		  	<div class="col-md-3">
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
					  <li>
						<a>
						  <span class="glyphicon glyphicon-user"></span>
						  <span>${user.email}</span>
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
          <a href="<%=mypath %>/login/toSellerPage">
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
            <li><a href="<%=mypath %>/toSellerOrderListPage?urlFlag=1"><i class="fa fa-circle-o"></i> 新订单</a></li>
            <li><a href=""><i class="fa fa-circle-o"></i> 催&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单</a></li>
            <li><a href="<%=mypath %>/toSellerOrderListPage?urlFlag=0"><i class="fa fa-circle-o"></i> 历史订单</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="<%=mypath %>/toSellerDishPage">
            <span>菜品管理</span>
            <!-- <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span> -->
          </a>
          <!-- <ul class="treeview-menu">
            <li><a href=""><i class="fa fa-circle-o"></i> blank</a></li>
            <li><a href=""><i class="fa fa-circle-o"></i> blank</a></li>
            <li><a href=""><i class="fa fa-circle-o"></i> blank</a></li>

          </ul> -->
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
  </aside>

  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
    	<div class="container-fluid">
		  <div class="row">
		  	<div class="col-md-5" style="padding-top:30px;margin-left:5%;" >
				<table class="mytable">
				  <thead>
				    <tr>
				      <th style="width:120px;"></th>
				      <th style="width:200px;"></th>
				      <th></th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>邮&nbsp;&nbsp;&nbsp;箱：</td>
				      <td>${user.email}</td>
				      <td><a href="javascript:showmybox();">修改</a></td>
				    </tr>
				    <tr>
				      <td>手机号：</td>
				      <td>${user.phonenum}</td>
				      <td><a>修改</a></td>
				    </tr>
				    <tr>
				      <td>用户名：</td>
				      <td>${user.username}</td>
				      <td><a>修改</a></td>
				    </tr>
				    <tr>
				      <td>密&nbsp;&nbsp;&nbsp;码：</td>
				      <%-- <td><input type="password" value="${user.password}"></td> --%>
				      <td><span>•••••••••</span></td>
				      <td><a>修改</a></td>
				    </tr>
				    <tr>
				      <td>店铺名称：</td>
				      <td>${shop.shopname}</td>
				      <td><a>修改</a></td>
				    </tr>
				    <tr>
				      <td>店铺地址：</td>
				      <td>${shop.shopaddress}</td>
				      <td><a>修改</a></td>
				    </tr>
				    <tr>
				      <td>店铺电话：</td>
				      <td>${shop.shopphonenum}</td>
				      <td><a>修改</a></td>
				    </tr>
				  </tbody>
				</table>
			</div>
			<input style="display:none;" value="${shop.shopid}" id="hiddenShopIdDomain">
			<div class="col-md-6" style="padding-top:30px;font-size:16px;">
				<div style="padding-top:10px;display:inline;">店铺公告：</div>
				<div>
					<textarea rows="10" cols="60" style="border:none;resize: none;margin-top:10px;display:inline;"></textarea>
					<button class="btn btn-primary" style="border-radius: 0px;float:right;height:30px;margin-top:225px;padding:4px 10px;">发布</button>
				</div>
			</div>
		  </div>
		</div>
    	
    </section>
  </div>
  
  <div class="modal fade" tabindex="-1" role="dialog" id="NewOrderMsgModal">
	  <div class="modal-dialog" role="document" style="width:400px;">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h5 class="modal-title"><b>新订单提醒</b></h5>
		  </div>
		  <div class="modal-body">
			有<span id="newOrderNumSpan"></span>条新订单，去处理新订单？
			<audio id="newOrderMsg">
			    <source = src="<%=mypath %>/static/voice/voice.mp3" type="audio/mp3">
				Your browser does not support the audio element.
			</audio>
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			<button type="button" class="btn btn-primary" onclick="goNewOrderPage()">确定</button>
		  </div>
		</div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

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
<script type="text/javascript">
setInterval(function() {
	var shopid = $("#hiddenShopIdDomain").val();
	$.ajax({
		url:'<%=mypath %>/getCountOfNewOrder?shopId=' + shopid,
		type:'post',
		dataType:'json',
		success:function(result){
			if(result.newOrderFlag == "true"){
				$("#NewOrderMsgModal").modal("show");
				$("#newOrderNumSpan").text(result.newDishNum);
				document.getElementById("newOrderMsg").play();
			}
		}
	});
}, 30000);
function goNewOrderPage(){
	location.href='<%=mypath %>/toSellerOrderListPage?urlFlag=1'
}
</script>
</body>
</html>