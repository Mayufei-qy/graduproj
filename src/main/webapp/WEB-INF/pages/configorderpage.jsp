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
<link href="<%=path %>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path %>/static/mycss/configorderpage.css" rel="stylesheet">
<link href="<%=path %>/static/mycss/loginpage.css" rel="stylesheet">
<script src="<%=path %>/static/jquery/jquery.min.js"></script>
<script src="<%=path %>/static/jquery/jquery.cookie.js"></script>
<script src="<%=path %>/static/bootstrap/js/bootstrap.min.js"></script>
<title>确认订单</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	$('.f2').click(function(){
		$('.box2').show();
		});
	$('.login5 a').click(function(){
		$('.box2').hide();
		$("#loginfailerr").css("display","none");
		});
	});
</script>
<body>
	<input style="display:none;" value="${shopid}" id="dishiddomain"/>
	<nav class="navbar navbar-default navbar-fixed-top" style="background:#FFA500;" role="navigation">
	    <div class="container-fluid">
	    	<div class="row">
	    		<div class="navbar-header col-md-2">
			        <a class="navbar-brand" href="#">首页</a>
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
			    	<c:choose>  
					     <c:when test="${user != null}">
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
					     </c:when>  
					     <c:otherwise>
					        <div style="margin-top:8px;">
			        			<button class="button f1 f2" onclick="">登录</button>
								<button class="button f1" onclick="javascrtpt:window.location.href='<%=path %>/register/to_register'">注册</button>
					        </div>
					     </c:otherwise>  
					</c:choose>
			    </div>
	    	</div>
	    </div>
	</nav>

	<!-- <div style="height:50px;">
		<h4 style="margin-left:100px;">请确认订单信息：</h4>
	</div> -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-5 col-md-offset-3">
				<div style="background:white;font-size:16px;">
					<table class="table table-hover" style="width:100%;">
						<thead>
							<tr>
								<th style="height:50px;width:80px;">
									<div>菜品</div>
								</th>
								<th style="height:50px;width:80px;">
									<div>价格/份数</div>
								</th >
							</tr>
						</thead>
						<tbody id="orderTableTbody">
							
							<tr>
								<td>餐盒费</td>
								<td id="packingBoxTd">左2</td>
							</tr>
							<tr>
								<td>合计</td>
								<td id="totalCountTd">左2</td>
							</tr>
						</tbody>
					</table>
					<div style="font-size:14px;">
						<span>送餐地址：</span>${user.address}<a>[修改]</a><br/><br/>
						<span style="vertical-align: top;">留言备注：</span>
						<textarea rows="1" cols="60" id = "dishnote" style="resize: none;"></textarea>
					</div>
					<button onclick="sendOrder()">下单</button>
				
				</div>
			</div>
		</div>
	</div>
	
	<div class="box">
		<div class="box2">
			<div class="login5">
				<h2>登录</h2>
				<a class="close"></a>
			</div>
			<div class="login51" style="width:380px;height:380px;">
				<form name="login5form" action="">
					<div class="login5left">
						<span></span>
						<div class="login5left1">
							<input type="text" name="email" id="email" placeholder="用户名/手机号/邮箱" /></input>
						</div>
						<div class="login5left1">
							<input type="password" name="password" id="password" placeholder="密码" /></input>
						</div>
						<div class="login5left2">
							<span class="dl" id="login">登&nbsp;&nbsp;&nbsp;&nbsp;录</span>
							<a class="wjmm">忘记密码</a>
						</div>
						
						<span id="loginfailerr" style="color:red;display:none;font-size:15px;" >邮箱或密码错误！！！</span>
					</div>
				</form>
			</div>
		</div>
	</div>

<script type="text/javascript">
	window.cartDishDataArr = new Array();
	function loadInitialize(shopid){
		var packingboxPrice = 0;
		var totalcount = 0;
		var sumCount = 0;
		var tempStr = shopid+'cartStr';
		var strCookie = document.cookie;
		var arrCookie = strCookie.split("; ");
		for(var i=0;i<arrCookie.length;i++){
			var arr = arrCookie[i].split("=");
			var isThisShopStr = arr[0].indexOf(tempStr);
			if(isThisShopStr == 0){
				var dishItemCookie = $.cookie(arr[0]); 
			    var dishItem = JSON.parse(dishItemCookie);
			    packingboxPrice += dishItem.dishNum;
			    totalcount += (dishItem.dishNum * dishItem.dishPrice);
			    var str = '<tr>'
				+'<td>' + dishItem.dishName + '</td>'
				+'<td>' + '￥' + dishItem.dishPrice + '*' + dishItem.dishNum + '</td>'
			    +'</tr>';
			    $("#orderTableTbody").prepend(str);
			    window.cartDishDataArr.push(dishItem);
			}
		}
		sumCount = packingboxPrice + totalcount;
		$("#packingBoxTd").html('￥' + packingboxPrice);
		$("#totalCountTd").html('￥' + sumCount);
	}
	function sendOrder(){
		var ordernote = $("#dishnote").val();
		if(window.cartDishDataArr != null){
			window.cartDishDataArr[0].orderNote = ordernote;
		}
		var dataParam = JSON.stringify(cartDishDataArr);
		console.log(dataParam);
		if(dataParam != 'null'){
			$.ajax({
				url        : "<%=path %>/orderManage",
		        type       : "POST",
		        dataType   : "json",
		        contentType: "application/json",
		        data       : dataParam,
		        success    : function (result) {
		        	if(result.ordermsg == "true"){
						location.href='<%=path %>/toUserOrderListPage';
					}else{
						alert("下单失败！！！")
						location.href='<%=path %>';
					}
		        }
			 });
		}
		
		var shopid = $("#dishiddomain").val();
		var tempStr = shopid+'cartStr';
		var strCookie = document.cookie;
		var arrCookie = strCookie.split("; ");
		for(var i=0;i<arrCookie.length;i++){
			var arr = arrCookie[i].split("=");
			var isThisShopStr = arr[0].indexOf(tempStr);
			if(isThisShopStr == 0){
				$.cookie(arr[0],'',{expires:-1});
			}
		}
		window.cartDishDataArr = null;
	}
</script>
<script type="text/javascript">
	var shopid = $("#dishiddomain").val();
	loadInitialize(shopid);
</script>
<script type="text/javascript">
	$("#login").click(function(){
		$.ajax({
			url:'<%=path %>/login/dologin',
			type:'post',
			data:{
				email:$("#email").val(),
				password:$("#password").val()
			},
			
			dataType:'json',
			success:function(result){
				if(result.loginmsg == "true"){
					console.log(result.url);
					if(typeof(result.url) != "undefined"){
						location.href='<%=path %>/' + result.url;
					}else{
						var url = window.location.href;
						location.href=url;
					}
				}else{
					/* alert("登录失败"); */
					$("#loginfailerr").css("display","block");
				}
			}
		});
	});
</script>
</body>
</html>