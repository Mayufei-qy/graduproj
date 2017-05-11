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
    	<div style="padding-top:30px;" id = "orderlistshow">
			<c:forEach items="${newOrderlist}" var="o" varStatus="status">
				<table class="table table-condensed" style="width:100%;background:#F5F5F5; text-align:left;">
					<thead>
						<tr>
							<th style="height:45px;">
								<div>订单号:${o.flowNum}</div>
							</th>
							<th style="height:45px; text-align:right;">
								<div>下单时间：${o.orderTime}</div>
							</th >
						</tr>
					</thead>
					<tbody id="orderTableTbody">
						<c:forEach items="${o.dishList}" var="i" varStatus="status">
							<tr style="text-indent:45px;">
								<td>${i.dishName}</td>
								<td id="packingBoxTd">${i.dishPrice} * ${i.dishnum}</td>
							</tr>
						</c:forEach>
						<tr style="text-indent:45px;">
								<td>餐盒</td>
								<td id="packingBoxTd">${o.packingBox}</td>
						</tr>
						<tr style="text-indent:45px;">
								<td>备注</td>
								<td id="packingBoxTd">${o.orderNote}</td>
						</tr>
						<tr>
							<td id="totalCountTd"><b>下单人：${o.userName}----电话：${o.userPhonenum}</b></td>
							<td id="totalCountTd" style="text-align:right;"><b>金额：￥${o.totalPrice}</b></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="2">
								<div><button class="btn btn-primary" onclick="changeOrderTypeToOld(${o.orderid}, this)" style="font-size:12px;padding: 4px 12px;">确认接单</button></div>
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
<script src="<%=mypath %>/static/js/app.min.js"></script>
<script type="text/javascript">
function changeOrderTypeToOld(orderid, target){
	var button = target;
	$.ajax({
		url:'<%=mypath %>/changeOrderToOld?orderid=' + orderid,
		type:'post',
		dataType:'json',
		success:function(result){
			if(result.resultFlag == 1){
				$(button).parents("table:first").hide();
			}
		}
	});
}
</script>
</body>
</html>