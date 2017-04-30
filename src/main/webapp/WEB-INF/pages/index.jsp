<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
	/* String uri = request.getRequestURI();
	uri = uri.replace(path, "");
	out.print(uri);
	session.setAttribute("origin_uri", uri); */
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=path %>/static/mycss/mystyle.css">

<link rel="stylesheet" type="text/css" href="<%=path %>/static/mycss/loginpage.css">
<script type="text/javascript" src="<%=path %>/static/jquery/jquery.min.js"></script>
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

<title>外卖点餐系统首页</title>
</head>
<body>
    <div class="top-banner">
        <div class="userbar">
			<c:choose>  
		         <c:when test="${user != null}">
					<div class="dropdown">
					  <button class="dropbtn">${user.email}</button>
					  <div class="dropdown-content">
					    <a href="<%=path %>/toUserOrderListPage">我的订单</a>
					    <a href="#">我的收藏</a>
					    <a href="<%=path %>/login/logout">退出</a>
					  </div>
					</div>
		         </c:when>  
		         <c:otherwise>
		            <button class="button f1 f2" onclick="">登录</button>
					<button class="button f1" onclick="javascrtpt:window.location.href='<%=path %>/register/to_register'">注册</button>
		         </c:otherwise>  
		     </c:choose>
        </div>
    </div>
    <div class="searchbox">
    	<form action="<%=path %>/tomainshowpage">
    		<input name="searchcontent" type="text" class="input-box" placeholder="搜索菜名或店铺" /> 
			<input name="" type="submit" value="搜索" class="searchbtn f1" />
    	</form>
    </div>
    
	<div class="box">
		<div class="box2">
			<div class="login5">
				<h2>登录</h2>
				<a class="close"></a>
			</div>
			<div class="login51">
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
    
</body>
</html>