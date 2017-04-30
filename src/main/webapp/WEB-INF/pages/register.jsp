<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
	String mypath = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=mypath %>/static/jquery/jquery.min.js"></script>
<link href="<%=mypath %>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=mypath %>/static/mycss/registerpage.css">
<title>外卖点餐系统用户注册</title>
</head>
<body>

<div class="wrap">
	<form class="main form-horizontal" action="<%=mypath %>/register/doRegister" method="post">
	<fieldset>
		<legend>用户注册：</legend>
		<div class="controlalign">
			<div class="controlinfo">
				邮箱：<input type="email" id="mailAddress" name="email" placeholder="输入常用邮箱地址" required="required"/>
			</div>
			
			<div class="controlinfo">
				<span id="send" class="get_vercode">获取邮箱验证码</span>
			</div>
			
			<div class="controlinfo">
				验证码：<input type="text" name="code" pattern="^\d{6}$" autocomplete="off" placeholder="输入6位数字验证码" required="required"/>
			</div>
			
			<div class="controlinfo">
				密码：<input type="password" id="firstpswd" name="password" autocomplete="off" placeholder="6-24位字母数字特殊字符组合" required onchange="checkPasswords()"/>
			</div>
			
			<div class="controlinfo">
				确认密码：<input type="password" id="confirmpswd" autocomplete="off" placeholder="6-24位字母数字特殊字符组合" required onchange="checkPasswords()"/>
			</div>
		
			<div class="controlinfo">
				<input type="submit" value="同意以下协议并注册">
			</div>
			
			<div style="text-align:left;color:red;padding-top:10px;">
				<span>${errormsg}</span>
			</div>
			
		</div>
		
	</fieldset>
	</form>
</div>

<script type="text/javascript">
var msg = "${registersuccessmsg}";
/* alert(msg); */
if( msg != ""){
	alert(msg);
	location.href='<%=mypath %>';
}
</script>

<script type="text/javascript">
$("#send").click(function(){
	var mailaddress = $("#mailAddress").val();
	if(mailaddress == ""){
		alert("邮箱不能为空！");
	}else{
		$.ajax({
		 	url: '<%=mypath %>/register/getVerificationCode',
		 	type: 'post',
		 	dataType: 'json',
		 	data: {email:mailaddress}
		 })
		 .done(function(datas) {
			 console.log(datas);
		 })
		 .fail(function() {
		 	console.log("error");
		 });
	}
});

function checkPasswords() {  
    var passl = document.getElementById("firstpswd");  
    var pass2 = document.getElementById("confirmpswd");  
    if (passl.value != pass2.value)  
        pass2.setCustomValidity("两次密码必须输入一致！");  
    else  
        pass2.setCustomValidity('');  
}
</script>
</body>
</html>