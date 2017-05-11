<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=path %>/static/mycss/userpage.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=path %>/static/mycss/mymodelbox.css">
<link href="<%=path %>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=path %>/static/jquery/jquery.min.js"></script>
<script src="<%=path %>/static/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path %>/static/js/jquery.form.js"></script>
<title>外卖点餐系统个人中心账户</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	$('.login5 a').click(function(){
		$('.mybox2').hide();
		});
	});
</script>
<body>
<input style="display:none;" value="${haveorders}" id="haveordersdomain"/>
<nav class="navbar navbar-default navbar-fixed-top" style="background:#FFA500;" role="navigation">
	    <div class="container-fluid">
	    	<div class="row">
	    		<div class="navbar-header col-md-2">
			        <a class="navbar-brand" href="<%=path %>">首页</a>
			    </div>
			    <div class="navbar-header col-md-2">
			        <a class="navbar-brand" href="" onclick="islogined();return false;">申请成为商家</a>
			    </div>
			    <div class="col-md-2  col-md-offset-4">
			    	<form class="navbar-form navbar-left" role="search" style="float:right">
			            <div class="input-group">
		            		<input type="text" class="form-control">
		            		<span class="input-group-addon glyphicon glyphicon-search" style="top:0px"></span>
		        		</div>
			        </form>
			    </div>
			    <div class="col-md-2">
	    			<div class="dropdown" style="margin-top:8px;margin-right:60px;">
						<button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">${user.email}
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
							<li role="presentation">
								<a role="menuitem" tabindex="-1" href="<%=path %>/toUserOrderListPage">我的订单</a>
							</li>
							<li role="presentation">
								<a role="menuitem" tabindex="-1" href="#">我的收藏</a>
							</li>
							<li role="presentation" class="divider"></li>
							<li role="presentation">
								<a role="menuitem" tabindex="-1" href="<%=path %>/login/logout">退出</a>
							</li>
						</ul>
					</div>
			    </div>
	    	</div>
	    </div>
	</nav>
	
	<div class="page-wrap">
		<div class="inner-wrap">
			<div class="orders-cont clearfix">
				<div class="orders-tab fl">
					<span href="javascript:;" class="tab">
						<span class="title">订单查询</span>
						<ul>
							<li><a href="<%=path %>/toUserOrderListPage" class="borderradius-1 order-today">我的订单</a></li>
						</ul>
					</span>  
					<span href="javascript:;" class="tab">
						<span class="title">账号管理</span>
						<ul>
							<li><a href="<%=path %>/toUserAccount" class="borderradius-1 my-account active">我的账号</a></li>
							<li><a href="" class="borderradius-1 my-favorite ">我的收藏</a></li>
						</ul>
					</span>
				</div>
				<div class="orders-list">
					<div class="empty-tips">
						<div style="padding-top:30px;" >
							<table class="mytable" style="">
							  <thead>
							    <tr>
							      <th style="width:80px;"></th>
							      <th style="width:200px;"></th>
							      <th></th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      <td>邮&nbsp;&nbsp;&nbsp;箱：</td>
							      <td>${userinfo.email}</td>
							      <td><a href="javascript:showmybox();">修改</a></td>
							    </tr>
							    <tr>
							      <td>手机号：</td>
							      <td>${userinfo.phonenum}</td>
							      <td><a href="javascript:">修改</a></td>
							    </tr>
							    <tr>
							      <td>用户名：</td>
							      <td>${userinfo.username}</td>
							      <td><a href="javascript:showUserNameUpdateBox()">修改</a></td>
							    </tr>
							    <tr>
							      <td>密&nbsp;&nbsp;&nbsp;码：</td>
							      <%-- <td><input type="password" value="${user.password}"></td> --%>
							      <td><span>•••••••••</span></td>
							      <td><a href="javascript:">修改</a></td>
							    </tr>
							    <tr>
							      <td>地&nbsp;&nbsp;&nbsp;址：</td>
							      <td>${userinfo.address}</td>
							      <td><a href="javascript:">修改</a></td>
							    </tr>
							  </tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div id="anti_token" data-token="QTj3VDqooFmmNEUBLK7YcAsKstAE7PyB/9euLGm1JjPF6nuhaO+5OgGnD/QK7jCz"></div>
		</div>
	</div>
	
	<div class="mybox">
		<div class="mybox2 f1">
			<div class="login5">
				<h2>修改邮箱</h2>
				<a class="close"></a>
			</div>
			<div class="login51">
				<form name="login5form" action="">
					<div class="login5left">
						<span></span>
						<div class="login5left1">
							<span>邮&nbsp;&nbsp;&nbsp;箱：</span><input type="text" name="username" />
						</div>
						<div class="login5left1">
							<span>验证码：</span><input type="password" name="user_possword" />
						</div>
						<div class="login5left2">
							<input class="dl" type="submit" value="确定"><span><a href="javascript:dismissmybox()">取消</a></span>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="mybox">
		<div class="mybox2 f2">
			<div class="login5">
				<h2>修改用户名</h2>
				<a class="close"></a>
			</div>
			<div class="login51">
				<form name="login5form" id="changeUseraNameForm">
					<div class="login5left" style="width:320px;">
						<span></span>
						<div class="login5left1" style="text-align:left;">
							<span>当前用户名：</span><span>${userinfo.username}</span>
						</div>
						<div class="login5left1">
							<span>新用户名：</span><input type="text" name="username" />
						</div>
						<div class="login5left2">
							<input class="dl" type="button" value="确定" onclick="submitUserNameChangeForm()" style="margin-left:20px;"><span><a href="javascript:dismissmybox()">取消</a></span>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function showmybox(){
		$('.f1').show();
	}
	function dismissmybox(){
		$('.mybox2').hide();
	}
	function showUserNameUpdateBox(){
		$('.f2').show();
	}
	
	function submitUserNameChangeForm(){
		$("#changeUseraNameForm").ajaxSubmit({
			type: "POST",
			url:"<%=path %>/changeUserName",
			dataType: "json",
		    success: function(data){
		    	if(data.flag == 'true'){
		    		/* $('.mybox2').hide(); */
		    		location.href='<%=path %>/toUserAccount';
		    	}
			}
		});
	}
</script>
</html>