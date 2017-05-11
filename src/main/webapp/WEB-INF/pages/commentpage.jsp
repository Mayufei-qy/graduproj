<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=path %>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path %>/static/mycss/commentpage.css" rel="stylesheet"> 
<link href="<%=path %>/static/mycss/shoppage.css" rel="stylesheet">
<link href="<%=path %>/static/mycss/loginpage.css" rel="stylesheet">
<script src="<%=path %>/static/jquery/jquery.min.js"></script>
<script src="<%=path %>/static/jquery/jquery.cookie.js"></script>
<script src="<%=path %>/static/bootstrap/js/bootstrap.min.js"></script>




<title>外卖点餐系统店铺主页</title>
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


	<div class="container">
		<div class="row title">
		
			<div class="page-wrap">
        		<div class="inner-wrap">
					<div class="rest-info">
					    <div class="right-bar fr clearfix ct-lightgrey">

					      <a href="<%=path %>/getComment?shopid=${shopinfo.shopid }" class="fl average-speed" style="text-decoration: none;">
					        <div class="desc">评价</div>
					        <div class="nu"><span id="commentNumDomain">0</span></div>
					      </a>

					      <div class="fl in-ti">
					        <div class="desc">收藏</div>
					        <div class="nu">
					        <img alt="收藏" src="<%=path %>/static/image/favorite.png" />
					        </div>
					      </div>
					    </div>
					  <div class="details">
					    <div class="up-wrap clearfix">
					      <div class="avatar fl">
					        <img class="scroll-loading" src="http://p0.meituan.net/120.0/xianfu/f5c0fc4ed7a3ad4182a85dad71276b71422918.jpg" data-src="http://p0.meituan.net/120.0/xianfu/f5c0fc4ed7a3ad4182a85dad71276b71422918.jpg" data-max-width="120" data-max-height="90" style="width: 120px; height: 90px;">
					      </div>
					      <div class="list">
					        <div class="na">
					        <a href="/restaurant/144716875534175536">
					          <span>    ${shopinfo.shopname }   </span><i class="icon i-triangle-dn"></i>
					        </a>
					        </div>
					        <div class="clearfix">

					          <div class="stars clearfix" style="margin-top:7px;">
					            <span>店铺电话：</span><span class="info-detail">${shopinfo.shopphonenum }</span>
					          </div>

					            <div class="rest-info-thirdpart" style="color: rgb(67, 67, 67); margin-top: 6px; max-width: 285px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
					              商家地址：${shopinfo.shopaddress }
					            </div>

					        </div>
					      </div>
					    </div>
					  </div>
					</div>


					<div class="food-list fl">
					  	<div class="food-nav">
							<div class="list">
							    <div class="loading" style="display: none;"></div>
							    <div class="comment-list-wrapper">
									<ul>  
										<c:forEach var="data" items="${commentList}" varStatus="status">
											<li class="reply-field">
												<div class="info clearfix">    
													<span class="fr time">评价时间&nbsp;&nbsp;<fmt:formatDate value="${data.commtime}" pattern="yyyy-MM-dd"/></span>  
													<span class="name">${data.email}</span>      
													<span>总体评价：${data.score}</span>             
												</div>    
												<div class="user-reply">${data.commcontent}</div>
												<c:choose>  
										            <c:when test="${not empty data.list}">		
										            	<div class="bizz-reply">餐厅回复：${data.list[0].commcontent}</div>						                
										            </c:when>  
										            <c:otherwise>
										            
									            	</c:otherwise>
									            </c:choose>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
      					</div>
 				 	</div>
     			</div>
    		</div>
		</div>
	</div>
	<input id="shopidDomainIpt" style="display:none;" value="${shopinfo.shopid }">
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
	
	<script type="text/javascript">
		var shopid = $("#shopidDomainIpt").val();
		$.ajax({
			url:'<%=path %>/getCountOfComment?shopid=' + shopid,
			type:'post',
			dataType:'json',
			success:function(result){
				$("#commentNumDomain").text(result.resultTag);
			}
		});
	</script>

</body>
</html>