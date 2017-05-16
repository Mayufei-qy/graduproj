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
<title>外卖点菜系统管理员登录页面</title>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">管理员登录</p>

    <form id="newShopForm">
      <div class="form-group has-feedback">
        <input type="text" name="adminname" class="form-control" placeholder="用户名">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="adminpswd" class="form-control" placeholder="密码">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <!-- <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> 
            </label>
          </div>
        </div> -->
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="button" onclick="imageUpLoadAndFormSubmit()" class="btn btn-primary btn-block btn-flat">登录</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    <!-- /.social-auth-links -->

    <a href="#">I forgot my password</a><br>

  </div>
  <!-- /.login-box-body -->
</div>

<script type="text/javascript" src="<%=mypath %>/static/jquery/jquery.min.js"></script>
<script src="<%=mypath %>/static/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=mypath %>/static/js/app.min.js"></script>
<script src="<%=mypath %>/static/js/jquery.form.js"></script>
<script type="text/javascript">
function imageUpLoadAndFormSubmit(){
	$("#newShopForm").ajaxSubmit({
		type: "POST",
		url:"<%=mypath %>/adminLogin",
		dataType: "json",
	    success: function(data){
	    	console.log(data);
	    	if(data.result == 'true'){
	    		location.href='<%=mypath %>/toAdminMainPage';
	    	}else{
	    		alert("登陆失败！");
	    		location.href='<%=mypath %>';
	    	}
		}
	});
}
</script>
</body>
</html>